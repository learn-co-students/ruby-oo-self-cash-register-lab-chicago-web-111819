class CashRegister
    attr_accessor :total, :discount, :items
    attr_reader :hash

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @hash = {}
    end

    def add_item(item, price, quantity = 1)
        self.hash[item] = price
        self.total += price * quantity
        i = 0
        while i < quantity do
            self.items << item
            i += 1
        end
    end

    def apply_discount
        floaty = @discount.to_f
        floaty_boi = floaty / 100
        if discount != 0
           self.total = @total - @total * floaty_boi
           self.total = self.total.to_i
           return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        long_thing = self.items.length - 1
        name_of_item = self.items[long_thing]
        price_of_item = self.hash[name_of_item]
        item_taken = self.items.pop
        if self.items.include?(item_taken)
            self.items = []
            self.total = 0.0
        elsif self.items == []
            self.total = 0.0
        else
            self.total -= price_of_item
        end

    end
end

