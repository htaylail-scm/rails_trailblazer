require "bcrypt"
module User::Operation
  class Login < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: User::Contract::Login)
    end
    step Nested(Present)
    step Contract::Validate(key: :user)
    step :model!

    # to check password
    def model!(options, params:, **)
      user = User.find_by(email: params[:user][:email])    
      if user.present?
        # check same password
        if user && user.authenticate(params[:user][:password])
          if params[:remember_me]
            options['remember_me'] = 1
          end
          if user
            options['user'] = user
            true
          end
        else
          options['pwd_fail'] = 'Password Wrong'
          false
        end
      else
        options['user_fail'] = 'No User'
        false
      end
    end
    
  end
end