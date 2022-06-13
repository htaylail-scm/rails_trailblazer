# module User::Operation
#     class ResetPassword < Trailblazer::Operation
#         class Present < Trailblazer::Operation
#             step :model!
#             step Contract::Build(constant: User::Contract::ResetPassword)

#             def model!(options, params:, **)
#                 options['model'] = User.find_by(email: params['email'])
                
#                 if options['model'].present?
#                     PasswordMailer.with(user: options['model']).reset.deliver_now  
#                     # abort  options['model']['email'].inspect               
#                     true                  
#                 else
#                     # abort  options['model']['email'].inspect 
#                     options['fail'] = 'fail'
#                     false
#                 end
#             end
#         end

#         step Nested(Present)
#         step Contract::Validate(key: :user)
#     end
# end

module User::Operation
    class ResetPassword < Trailblazer::Operation
      class Present < Trailblazer::Operation
        step :model!
        step Contract::Build(constant: User::Contract::ResetPassword)
        
        def model!(options, params:, **)
          options['model'] = User.find_by(email: params['email'])
          if options['model'].present?
            true
          else
            options['fail'] = 'fail'
            false
          end
        end
  
      end
      step Nested(Present)
      step Contract::Validate()
      step :send_mail
  
      def send_mail(options, params:, **)
        PasswordMailer.with(user: options['model']).reset.deliver_now
      end
    end
  end
  