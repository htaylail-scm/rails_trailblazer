# frozen_string_literal: true

module User::Operation
  class Index < Trailblazer::Operation
    step :model!
   
    def model!(options, **)
      # options['model'] = ::User.all 
      options["model"] = ::User.all.reverse_order
      # abort options['model'].inspect                 
    end
  end
end

