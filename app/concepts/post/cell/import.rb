module Post::Cell
  class Import < Trailblazer::Cell
    def back
      link_to "Back", posts_path
    end
end
end
  