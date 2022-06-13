module Post::Operation
  class Index < Trailblazer::Operation
    step :model!

    def model!(ctx, **)
      ctx["model"] = ::Post.all.reverse_order
      # ctx["model"] = ::Post.all.reverse_order.paginate(:page => ctx[:page], :per_page => 3)
    end
    
  end
end
