module User::Operation
  class Delete < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :find_by)
      step Contract::Build(constant: User::Contract::Delete)
    end
    step Nested(Present)
    step :find_posts!
    step :assign_current_user!
    step Contract::Validate()
    step Contract::Persist()
    step :delete!

    def find_posts!(options, model:, **)
      @posts = Post.where(created_user_id: options['model'][:id])
    end

    def assign_current_user!(options, **)
      @posts.each do |post|
        post.update_column :deleted_user_id, options['current_user'][:id]
      end
      options[:model][:deleted_user_id] = options['current_user'][:id]
    end

    def delete!(options, model:, **)
      model.save
      model.destroy
    end
  end
end
