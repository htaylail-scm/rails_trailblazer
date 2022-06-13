class SessionsController < ApplicationController

    def new
      run User::Operation::Login::Present
        render cell(User::Cell::Login, @form)
    end

    def create
      run User::Operation::Login do |result|
        if result[:remember_me]
          # cookies.signed[:user_id] = result[:user][:id]
          session[:user_id] = result[:user][:id]
        else
          # cookies.signed[:user_id] = { value: result[:user][:id], expires: 2.weeks.from_now }
          session[:user_id] = { value: result[:user][:id], expires: 2.weeks.from_now }
        end
        return redirect_to "/welcome", notice: 'You have logged in successfully!'
      end
      if result.failure?
        if result[:pwd_fail]
          redirect_to login_path, notice: "Invalid Password!"
          return
        end
        if result[:user_fail]
          redirect_to login_path, notice: "Email does not exist!"
        else
          redirect_to login_path, notice: "Something went wrong!"
          return
        end
      end
    end
    
    def welcome    
    end
  
    def log_out
      # cookies.delete :user_id
      session[:user_id] = nil
      redirect_to '/welcome', notice: "You logout successfully!"
    end
  end