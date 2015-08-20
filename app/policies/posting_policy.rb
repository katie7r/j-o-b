class PostingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: @user.id)
    end
  end

  def index?
    signed_in?
  end

  def show?
    user_posting?
  end

  def create?
    signed_in?
  end

  def update?
    user_posting?
  end

  def destroy?
    user_posting?
  end

  def user_posting?
    @posting.user_id == @user.id
  end
end
