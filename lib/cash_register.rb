class CashRegister

    attr_accessor :total, :item, :discount, :transaction


    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @all_items = []
    end

    def add_item(name, price, qty = 1)
        self.total += price*qty

        self.item = name
        qty.times do
            @all_items << self.item
        end

        self.transaction = price*qty
    end

    def apply_discount

        f_discount = discount.to_f

        if discount != 0
            self.total -= (total*(f_discount/100.0)).to_i
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @all_items
    end

    def void_last_transaction
        self.total -= self.transaction
    end
end