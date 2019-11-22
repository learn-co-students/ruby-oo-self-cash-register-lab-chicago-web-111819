require 'pry'

class CashRegister
attr_accessor :title, :items, :prices



    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @title = title
        @items = []
        @prices = []
    end

    def discount
        @discount 
    end

    def total= (total)
        @total = total
    end

    def total
        @total
    end

    def add_item(title, price, qt = 1)
        @total += (price * qt)
        qt.times do 
            @items << title
        end
        @prices << price
    end

    def void_last_transaction
        @prices.pop
        @total = @prices.sum
        # @total = @total - @prices.last
        # @prices.delete(@prices.last)
    end


    def apply_discount
       if discount == 20
        @total = @total * 0.8
        return "After the discount, the total comes to $#{@total.to_i}."
       else
        "There is no discount to apply."
       end
    end



end

