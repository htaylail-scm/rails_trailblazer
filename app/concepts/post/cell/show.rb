module Post::Cell
  class Show < Trailblazer::Cell
    property :title
    property :body

    def current_user
      return options[:context][:current_user]
    end

    def time
      model.created_at
    end

    def edit
      link_to "Edit", edit_post_path(model.id), class: "btn btn-primary", style: "margin-right: 5px;"
    end

    def delete
      button_to "delete", {:controller => :posts, :action => 'destroy', :id => model.id }, :method => :delete ,  class: "btn btn-danger"
    end

    def back
      link_to "Back to posts list", posts_path, class: "btn btn-primary"
    end
  end
end
