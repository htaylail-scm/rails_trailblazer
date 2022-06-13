class PasswordMailer < ApplicationMailer

  def reset
    # signed_id support rails 6.1 & above
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)
    @email = params[:user].email

    # abort  @token.inspect
    mail(to: @email, subject: 'Reset Password Link')
  end

end