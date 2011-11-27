class PostsController
  include Pakyow::Helpers

  def index
    Log.puts "PostsController:index"
    posts = Post.all
    view = presenter.view.find('#post')
  end
  
  def show
    Log.puts "PostsController:show"
  end

  def new
    Log.puts "PostsController:new"
  end

  def create
    Log.puts "PostsController:create"
    post = Post.create(request.params['post'])
    post.save
    app.redirect_to!('/posts')
  end

  def edit
    Log.puts "PostsController:edit"
  end

  def delete
    Log.puts "PostsController:delete"
  end

  def update
    Log.puts "PostsController:update"
  end
end
