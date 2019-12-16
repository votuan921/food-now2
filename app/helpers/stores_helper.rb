module StoresHelper

  def stt_store_create
    current_user.stores.count
  end
end
