class ApplicationController
  include Pakyow::Helpers

  def index
    presenter.view.find('#nav-home a').add_class('active')
  end

  def todos
    presenter.view.find('#nav-todos a').add_class('active')
  end
  
  def links
    presenter.view.find('#nav-links a').add_class('active')
  end

  def notes
    presenter.view.find('#nav-notes a').add_class('active')
  end

  def about
    presenter.view.find('#nav-about a').add_class('active')
  end

end
