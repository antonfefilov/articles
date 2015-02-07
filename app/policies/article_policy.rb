class ArticlePolicy < ApplicationPolicy
  def edit?
    user && user == record.user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def create?
    user
  end
end
