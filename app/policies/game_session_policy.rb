class GameSessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    record.user == user
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def new?
    true
  end

  def create?
    true
  end
end
