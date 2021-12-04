class LobbyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def accept?
    true
  end

end
