module Post::Operation
  class Delete < Trailblazer::Operation
    step Model(Post, :find_by)
    step :assign_current_user!
    step :delete!

    # to add delete_user_id
    def assign_current_user!(options, model, **)
      options[:model][:deleted_user_id] = options['current_user'][:id]
    end

    def delete!(ctx, model:, **)
      model.save
      model.destroy
    end
  end
end
