module User::Operation
  class Delete < Trailblazer::Operation 
    step Model(User, :find_by)
    step :assign_current_user!
    step :delete!

    def assign_current_user!(options, model:, **)      
      options[:model][:deleted_user_id] = options['current_user'][:id]
    end

    def delete!(ctx, model:, **)
      # abort model[:id].inspect
      # abort model[:deleted_user_id].inspect
      model.save
      model.destroy
    end
  end
end


