module Post::Operation
    class Import < Trailblazer::Operation
      class Present < Trailblazer::Operation
        step Contract::Build(constant: Post::Contract::Import)
      end
      step Nested(Present)
      step Contract::Validate()
      step :import_csv!

      def import_csv!(options, params:, **)
        CSV.foreach(params[:file].path, headers: true) do |row|
          Post.create! row.to_hash.merge(created_user_id: options['current_user_id'], updated_user_id: options['current_user_id'], created_at: Time.now, updated_at: Time.now)
        end
    end  

     
    end
  end
  