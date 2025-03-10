# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  protected

  def signed_in?
    !!user
  end
end
