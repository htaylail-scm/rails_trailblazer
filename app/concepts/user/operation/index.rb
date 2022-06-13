module User::Operation
  class Index < Trailblazer::Operation
    step :model!
   
    def model!(options, **)
      # options['model'] = ::User.all 
      options["model"] = ::User.all.reverse_order              
    end
  end
end

