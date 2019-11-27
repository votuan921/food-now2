module CombosHelper
  def get_stores
    current_user.stores.pluck :name, :id
  end
end
