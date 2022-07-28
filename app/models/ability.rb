class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, Recipe, user_id: user.id if user.present?
    can :manage, Food, user: user if user.present?
  end
end
