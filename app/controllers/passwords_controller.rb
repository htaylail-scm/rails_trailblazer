class PasswordsController < ApplicationController

  

  # to change password
  def edit
    run User::Operation::UpdatePassword::Present
      render cell(Password::Cell::Edit, @form)
  end

  def update
    if current_user.authenticate(password_params[:old_password])
      run User::Operation::UpdatePassword, user_id: current_user.id do |result|
        return redirect_to root_path, notice: 'Your password has been changed.'
      end
      redirect_to edit_password_path, notice: 'New password and confirm password must be same!'
    else
      redirect_to edit_password_path, notice: "Old password is wrong"
    end
  end


  # to reset password (forget password function)
  def new
    render cell(Password::Cell::New, @form)
  end

  def create
    run User::Operation::ResetPassword do |result|
      return redirect_to root_path, notice: 'We have sent a link to reset a password.'
    end
    if result.failure?
      if result[:fail]
        redirect_to reset_password_path, notice: 'No account with this email.'
      else
        redirect_to reset_password_path, notice: 'Something went wrong.'
      end
    end
  end

  def editReset
    run User::Operation::ResetPasswordForm::Present do |result|
      render cell(Password::Cell::Reset, @form)
    end
    if result.failure?
    redirect_to root_path, notice: "Your token has expired."
    end
  end

  def updateReset
    run User::Operation::ResetPasswordForm do |result|
      return redirect_to root_path, notice: 'Your password has been changed.'
    end
    render cell(Password::Cell::Reset, @form)
  end

  def password_params
    params.require(:user).permit(:old_password, :password, :password_confirmation)
  end
end
