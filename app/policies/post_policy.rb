class PostPolicy < ApplicationPolicy

  def edit?
    user.roles.include?("pastor")
  end

  def update?
    user.roles.include?("pastor")
  end

  def destroy?
    user.roles.include?("pastor")
  end

  def index?
    user.roles.include?("pastor")
  end


  def create?
    if user.roles?
      user.roles.include?("pastor")
    end
  end
end
