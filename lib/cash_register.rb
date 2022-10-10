require 'pry'

class CashRegister
    attr_reader :discount
    attr_reader :multiplier
    attr_accessor :total 
    attr_accessor :prev_total
    attr_accessor :items

    def initialize(discount = 0)
        @discount =  discount
        @multiplier = 100 - discount
        @total = 0
        @prev_total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.prev_total = self.total 
        self.total += price * quantity
        quantity.times do 
            items << title
        end
    end

    def apply_discount
        if self.discount > 0
            self.total *=  multiplier
            self.total /= 100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.prev_total
    end



end


binding.pry