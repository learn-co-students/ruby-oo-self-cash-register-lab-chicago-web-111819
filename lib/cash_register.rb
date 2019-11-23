require 'pry'
class CashRegister
    attr_reader :discount, :items
    attr_accessor :total

    @subtotal


    def initialize(discount = 0)
        @items = []
        @discount = discount
        @total = 0
    end

    def add_item(title,price,quantity = 1)
        i = 0
        while i < quantity
            @items << title
            i += 1
        end

        @subtotal = price * quantity
        self.total += @subtotal
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else        
            subtotal = self.total * (self.discount / 100.00)
            self.total -= subtotal.floor
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        @total -= @subtotal
    end

end
