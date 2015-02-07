module ApplicationHelper
  def present(model)
    klass = "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    block_given? ? yield(presenter) : presenter
  end
end
