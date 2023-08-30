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

        element = @driver.get_text(:class,'sf-product-card__link')
        print("Clicked #{element}\n")
    end

    def select_size
        # @driver.click(:xpath,'//*[@id="product__select-size-sizes"]/div[2]/button')
        @driver.click(:xpath,'sf-button--oos')
    end

    def add_to_wish_list
        @driver.click(:class,'a-add-to-wishlist')
    end

    def open_wish_list
        @driver.click(:class,'wishlist')
        element = @driver.get_text(:xpath,'/html/body/div[1]/div/div[2]/div[2]/div/div/div[2]/div[11]/div/div/div[1]/div/div[2]/div/div/p[2]')
        print("Added #{element}\n")
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
        @driver.click(:xpath,'/html/body/div[1]/div/div[2]/div[2]/div/div/div[2]/div[11]/div/div/div[1]/div/div[1]')
    end

    def delete_confirm
        @driver.click(:xpath,'/html/body/div[1]/div/div[2]/div[4]/span/div/section/div[2]/div[2]/div[2]/div/button[2]')
        print("Item deleted successfully")
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
wish_list.delete_confirm
sleep 5
wish_list.quit