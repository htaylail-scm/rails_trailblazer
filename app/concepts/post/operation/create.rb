module Post::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Post, :new)
      step Contract::Build(constant: Post::Contract::Create)
    end

    step Subprocess(Present)
    step :assign_current_user!
    step Contract::Validate(key: :post)
    step Contract::Persist()    
    step :notify!

    # to assign value
    def assign_current_user!(options, params:, **)
      if options['current_user'].present?
        options[:params][:post][:created_user_id] = options['current_user'][:id]
        options[:params][:post][:updated_user_id] = options['current_user'][:id]
      end
    end

    def notify!(ctx, model:, **)
      ctx["result.notify"] = Rails.logger.info("New post #{model.title}.")
    end
  end
end
