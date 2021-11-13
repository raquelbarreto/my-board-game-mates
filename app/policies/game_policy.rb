class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end
end
