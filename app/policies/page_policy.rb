class PagePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def edit?
    user.roles.include?("pastor")
  end

  def update?
    user.roles.include?("pastor")
  end

  def destroy?
    user.roles.include?("pastor")
  end
  def create?
    user.roles.include?("pastor")
  end

  def new?
    user.roles.include?("pastor")
  end
end
