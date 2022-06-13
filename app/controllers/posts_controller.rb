class PostsController < ApplicationController

  def new
    run Post::Operation::Create::Present
    render cell(Post::Cell::New, @form)
  end

  def create
    run Post::Operation::Create, current_user: current_user do |result|
      return redirect_to posts_path, notice: "Post create successfully!"
    end

    render cell(Post::Cell::New, @form)
  end

  def show
    run Post::Operation::Show
    render cell(Post::Cell::Show, result["model"])
  end

  def index
    run Post::Operation::Index
    render cell(Post::Cell::Index, result["model"])
  end

  def edit
    run Post::Operation::Update::Present
    render cell(Post::Cell::Edit, @form)
  end

  def update
    run Post::Operation::Update do |result|
      flash[:notice] = "Post update successfully!"
      return redirect_to post_path(result["model"].id)
    end
    render cell(Post::Cell::Edit, @form)
  end

  def destroy
    run Post::Operation::Delete, current_user: current_user do |result|
      flash[:alert] = "Post deleted successfully!"
      redirect_to posts_path
    end
    check_resource(result[:model])
  end

    
  # params: find_word
  # to search post
  def search
    run Post::Operation::Search do |result|
      render cell(Post::Cell::Index, result[:posts], find_word: result[:find_word])
    end
  end

  def download
    run Post::Operation::Export::CsvData do |result|
      respond_to do |format|
        format.html
        format.csv { send_data result[:posts_csv],  :filename => "Post List.csv" }
      end
    end
  end

  def upload
    run Post::Operation::Import::Present
      render cell(Post::Cell::Import, @form)
  end

  def import_csv
    run Post::Operation::Import, current_user_id: current_user.id do |_|
      return redirect_to posts_path, notice: 'Imported Successfully!'
    end
    render cell(Post::Cell::Import, @form)
  end
 
end
