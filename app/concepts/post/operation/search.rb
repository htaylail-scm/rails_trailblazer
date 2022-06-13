module Post::Operation
    class Search < Trailblazer::Operation
      step :get_posts
  
      def get_posts(options, params:, **)
        options['posts'] = Post.where("title LIKE :title or body LIKE :body", {:title => "%#{params[:search_keyword]}%", :body => "%#{params[:search_keyword]}%"})
        options['find_word'] = params[:search_keyword]
      end
    end
  end
  