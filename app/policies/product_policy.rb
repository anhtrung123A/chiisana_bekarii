class ProductPolicy < ApplicationPolicy
  def create?
    user.admin?  # hoặc user.role == 'admin'
  end

  def show?
    true  # tất cả đều có thể xem
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
