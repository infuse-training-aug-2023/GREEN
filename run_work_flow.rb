require_relative "work_flow/add_to_cart"
require_relative "work_flow/edit_profile"
require_relative "work_flow/wish_list"

class Flow
  def add_cart
    add = AddToCart.new
    add.login
    add.get_shopping_items
    add.quit
  end

  def edit_profile
    edit = EditProfile.new
    edit.login
    edit.edit_profile_details
    edit.display_profile_after_changes
    edit.quit
  end

  def wish_list
    wish = WishList.new
    wish.login
    wish.click_item
    wish.select_size
    wish.add_to_wish_list
    wish.open_wish_list
    wish.delete
    wish.delete_confirm
    wish.quit
  end
end

flow = Flow.new
flow.edit_profile
flow.wish_list
flow.add_cart
