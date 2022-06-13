module Post::Cell
  class Index < Trailblazer::Cell
    def total
      return "No posts" if model.size == 0
    end

    def new
      link_to "New", new_post_path
    end

    def delete
      link_to "Delete Post", post_path(model.id), method: :delete
    end

    def find_word
      find_word = options[:find_word]
    end

  end
end
