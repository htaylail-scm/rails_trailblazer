module User::Cell
  class Show < Trailblazer::Cell
    def image
      if model.profile.attached?
        image_tag url_for(model.profile)
      end
    end

    # def image
    #   if model.profile.present?
    #     image_url(model.profile)
    #   else
    #     image_tag('assets/images/d_profile.jpg')
    #   end
    # end
  end
end
