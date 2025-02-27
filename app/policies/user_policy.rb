class UserPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.order(created_at: :desc)
    end

    private

    attr_reader :user, :scope
  end

  def edit?
    update?
  end

  def update?
    user.id == record.id
  end

  def destroy?
    !record.confirmed?
  end
end
