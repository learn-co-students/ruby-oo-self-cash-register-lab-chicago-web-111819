class CashRegister
    attr_reader :discount
    attr_accessor :total, :cart, :last_item

    
    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @cart = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        quantity.times do
            cart.push(title)
        end
        self.total += (price * quantity)
        self.last_item = (price * quantity)

    end

    def apply_discount
        if self.discount
            self.total = ((1-(self.discount/100.0)) * self.total)
            "After the discount, the total comes to $#{self.total.round}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        self.total -= self.last_item
    end

end
