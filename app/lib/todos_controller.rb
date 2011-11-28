class TodosController
  include Pakyow::Helpers

  def index
    Log.puts "TodosController:index"
    todos = Todo.all
    presenter.view.find('#nav-todos a').add_class('active')
  end
  
  def show
    Log.puts "TodosController:show"
  end

  def new
    Log.puts "TodosController:create"
    post = Todo.create(request.params['post'])
    post.save
    app.redirect_to!('/todos')
  end

  def edit
    Log.puts "TodosController:edit"
  end

  def delete
    Log.puts "TodosController:delete"
  end

  def update
    Log.puts "TodosController:update"
  end
end
