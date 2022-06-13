module User::Cell
  class Show < Trailblazer::Cell
    def image
      if model.profile.attached?
        image_tag url_for(model.profile)
      end
    end
  end
end
