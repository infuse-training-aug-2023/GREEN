require_relative 'Login'
require_relative 'Selenium_Wrapper'

class WishList < Common_flow
    def initialize
        super
        @driver = get_driver
        # @driver.set_wait(10)
    end
    
    def click_item
        # @driver.click(:xpath,'/html/body/div[1]/div/div[2]/div[3]/div[2]/section/div/div/div/div[2]/div/div/ul/li[2]/div/div/a/h3')

        @driver.click(:class,'sf-product-card__link')
        print("Clicked Item\n")
        original_window = @driver.driver.driver.window_handle

        @driver.driver.driver.window_handles.each do |handle|
          if handle != original_window
            @driver.driver.driver.switch_to.window handle
            print("Tab Switched\n")
            break
          end
        end
    end

    def select_size
        # @driver.click(:xpath,'//*[@id="product__select-size-sizes"]/div[2]/button')
        element = @driver.get_text(:class,'sf-button--oos')
        print("Size Selected #{element}\n")
        @driver.click(:class,'sf-button--oos')
    end

    def add_to_wish_list
        @driver.click(:class,'a-add-to-wishlist')
        print("Added to wishlist\n")
    end

    def open_wish_list
        if @driver.get_element(:class, "wishlist").displayed?

            # @driver.click(:id, "wps-ribbon-bottom-fix-close-button")
            @driver.click(:class,'wishlist')
        end
     
    end

    # def edit_wish_list
    #     @driver.click(:xpath,'/html/body/div[1]/div/div[2]/div[2]/div/div/div[2]/div[11]/div/div/div[1]/div/div[3]/a')
    # end

    # def change_size
    #     @driver.click(:xpath,'/html/body/div[1]/div/div[2]/div[4]/span/section/div[2]/div/div/div[2]/div[2]/div[2]/div/div[1]/button')
    # end

    # def update
    #     @driver.click(:xpath,'/html/body/div[1]/div/div[2]/div[4]/span/section/div[2]/div/div/div[2]/div[3]/button')
    # end

    def delete
        # @driver.click(:xpath,'/html/body/div[1]/div/div[2]/div[3]/div/div/div[2]/div[11]/div/div/div[1]/div[1]/div[1]')
        if @driver.get_element(:class, 'cross-icon').displayed?
            element = @driver.get_text(:class,'sku')
            print("Found #{element}\n")
            @driver.click(:class,'cross-icon')
            print("Deleting Item\n")
        end
    end

    def delete_confirm
        # @driver.click(:xpath,'/html/body/div[1]/div/div[2]/div[4]/span/div/section/div[2]/div[2]/div[2]/div/button[2]')
        if @driver.get_element(:xpath,'//span[contains(text(),"Remove")]').displayed?
            @driver.click(:xpath,'//span[contains(text(),"Remove")]')
            print("Item deleted successfully")
        end
   
    end
end

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