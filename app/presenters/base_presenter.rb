class BasePresenter < SimpleDelegator
  attr_reader :view

  alias_method :h, :view

  def initialize(model, view)
    @model, @view = model, view
    super(@model)
  end
end
