class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, User
    end
    
    if user.has_role? 'staff-warehouse'
      can :manage, Depreciation
    end
    
  end
end
