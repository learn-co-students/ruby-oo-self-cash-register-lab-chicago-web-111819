require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :cart, :lastitem

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def total
        @total
    end

    def add_item(item, price, quantity = 1)
        @total += price * quantity
        @lastitem = price * quantity
        while quantity > 0 do
            @cart << item
            quantity -= 1
        end
    end

    def apply_discount
        if self.discount == 0
            self.total
            return "There is no discount to apply."
        end
        if self.discount
            self.total = @total - @total * (@discount.to_f / 100.00)
            ptotal = (self.total).to_i
            return "After the discount, the total comes to $#{ptotal}."
        else
            self.total
        end
        
    end
    
    def items
        @cart
    end

    def void_last_transaction
        self.total -= @lastitem
    end

end