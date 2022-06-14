class UsersController < ApplicationController
  before_action :authorized
  # show user list
  def index
    run User::Operation::Index do |result|
      render cell(User::Cell::Index, result[:model])
    end
  end

  # show user detail page
  def show
    run User::Operation::Update::Present do |result|
      render cell(User::Cell::Show, result[:model])
    end
    check_resource(result[:model])
  end

  # params: admin?
  # show user create form
  def new
    if logged_in?
      run User::Operation::Create::Present
        render cell(User::Cell::New, @form, is_admin: admin?)
    else
      run User::Operation::Signup::Present
        render cell(User::Cell::Signup, @form)
    end
  end



  # create user
  # params: current_user
  def create
    if logged_in?
      run User::Operation::Create, current_user: current_user do |result|
      return redirect_to users_path, notice: 'User Created Successfully!'
      end
      render cell(User::Cell::New, @form, is_admin: admin?)
    else
      run User::Operation::Signup do |result|
        return redirect_to welcome_path, notice: 'User Created Successfully!'
      end
      render cell(User::Cell::Signup, @form), notice: 'Something went wrong!'
    end
  end


  # params: admin?
  # show user edit form
  def edit
    run User::Operation::Update::Present do |result|
      render cell(User::Cell::Edit, @form, is_admin: admin?)
    end
    check_resource(result[:model])
  end

  # update user
  # params: current_user
  def update
    run User::Operation::Update, current_user: current_user do |result|
      return redirect_to user_path(result[:model]), notice: 'User data Updated Successfully!'
    end
    render cell(User::Cell::Edit, @form, is_admin: admin?)
  end


  # destroy user
  # params: current_user
  def destroy
    run User::Operation::Delete, current_user: current_user do |result|
      redirect_to users_path, notice: "User deleted Successfully!"
    end
    check_resource(result[:model])
  end

  def search
    run User::Operation::Search, is_admin: admin? do |result|
      render cell(User::Cell::Index, result[:users], is_admin: admin?, 
                search_name: result[:search_name],search_email: result[:search_email],search_from_date: result[:search_from_date],search_to_date: result[:search_to_date])
    end
  end
end
  