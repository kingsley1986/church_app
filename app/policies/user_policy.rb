class UserPolicy < ApplicationPolicy

  def edit?
    user.roles.to_s.include?("pastor")
  end

  def update?
    user.roles.to_s.include?("pastor")
  end


  def destroy?
    user.roles.to_s.include?("pastor")
  end

end
