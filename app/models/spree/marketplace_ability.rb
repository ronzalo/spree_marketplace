module Spree
  class MarketplaceAbility
    include CanCan::Ability

    def initialize(user)
      user ||= Spree.user_class.new
      if user.supplier
        can [:admin, :manage], Spree::SupplierBankAccount, supplier_id: user.supplier_id
        can :create, Spree::SupplierBankAccount
        # can [:admin, :read, :stock], Spree::Variant do |variant|
        #   variant.supplier_ids.include?(user.supplier_id)
        # end
        can [:admin, :read], Spree::Variant
      end
    end
  end
end
