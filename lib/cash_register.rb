class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction_items

    def initialize(emp_discount = 0)
        @total = 0
        @discount = emp_discount
        @items = []
        @last_transaction_items = {}
    end

    def add_item(title, price, qty = 1)
        # Register an item
        tmp_items = []
        i = 0
        while i < qty do
            tmp_items << title
            if tmp_items[i] == tmp_items.last
                # keep track of last transaction
                self.last_transaction_items[:price] = price
                self.last_transaction_items[:qty] = qty
            end
            i += 1
        end
        self.items += tmp_items

        # Increase total cost
        self.total += (price * qty)
    end

    def apply_discount
        @total -= @discount # reduce the price by a given discount
        if self.discount > 0
            msg = "After the discount, the total comes to $#{@total}."
        else
            msg = "There is no discount to apply."
        end
        return msg
    end

    def items
        @items
    end

    def void_last_transaction
        # subtract the last item from the total
        self.total -= last_transaction_amount
        # return the total to 0.0 if all items have been removed
        if self.items.empty?
            @total = self.total.to_f # Keep it Float[ing] with 'to_f'... :)
        end
    end

    # helper method
    def last_transaction_amount
        return self.last_transaction_items[:price] * self.last_transaction_items[:qty]
    end

end
