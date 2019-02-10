class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, User
      can :manage, Product
      can :set_price, Product
      can :manage, Category
      can :manage, Currency
      can :manage, Customer
    end
    if user.has_role? 'staff-warehouse'
      can :manage, Product
      can :manage, Depreciation
      can :manage, Category
      can :manage, Assembly
    end
  end
end
