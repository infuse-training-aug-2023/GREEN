require_relative "add_to_cart"
require_relative "edit_profile"
require_relative "wish_list"

class Flow
  def add_cart
    add = Add_TO_cart.new
    add.login
    # sleep 5
    # sleep 5

    add.get_shopping_items
    add.quit
  end

  def edit_profile
    e = Edit_Profile.new
    e.login
    e.run_all_edit_profile
    e.display_profile_after_changes
    e.quit
  end

  def wish_list
    wish_list = WishList.new
    # wish_list.set_wait(10)
    wish_list.login
    print "logged in\n"
    # sleep 10
    wish_list.click_item
    # sleep 10
    wish_list.select_size
    wish_list.add_to_wish_list
    sleep 10
    wish_list.open_wish_list
    # wish_list.edit_wish_list
    # wish_list.change_size
    # wish_list.update
    # sleep 5
    wish_list.delete
    # sleep 5
    wish_list.delete_confirm
    sleep 10
    wish_list.quit
  end
end

flow = Flow.new
flow.edit_profile
flow.wish_list
flow.add_cart
