class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :access, :rails_admin
      can :read, :dashboard  
      if user.admin?
        can :manage, :all
      elsif user.manager?
        can :manage, Image, {imageable_type: Product, imageable_id:  user.product_ids}
        can :manage, Image, {imageable_type: Store, imageable_id:  user.store_ids}
        can [:read, :edit], User, id: user.id
        can :read, User
        can :manage, Store, user_id: user.id
        can :create, Combo
        can [:read, :update, :destroy], Combo, id: user.combo_ids
        can :create, Product
        can [:read, :update, :destroy], Product, id: user.product_ids
        can :mamage, [ComboProduct, Comment]
        can [:read, :update], Bill, store: {id: user.store_ids}
      else
        can :create, Store
        can [:read, :create], Bill, user_id: user.id
        can [:read, :create], BillDetail, bill_detail: {bill: {user_id: user.id}}
      end
    else
      can :read, Store
      can :read, Product
      can :read, Combo
    end
  end
end