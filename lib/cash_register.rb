class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(name, price, quanitity = 1)
    @total += (price * quanitity)
    quanitity.times do
      @items << name
    end
    @last_transaction_price = price
    @last_transaction_quanitity = quanitity
  end

  def apply_discount()
    if discount > 0
      @discount = @discount/100.to_f
      @total = @total - (@total * (@discount))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= (@last_transaction_price * @last_transaction_quanitity)
  end
end