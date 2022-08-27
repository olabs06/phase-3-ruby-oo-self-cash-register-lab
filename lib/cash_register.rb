require "pry"

class CashRegister
    attr_accessor :discount, :total, :item_history, :current_transaction
    def initialize discount = nil
        @total = 0
        @discount = discount
        @item_history = []
    end

    def add_item title, price, quantity=1
        self.current_transaction = price * quantity
        self.total += self.current_transaction
        quantity.times {self.item_history << title}
    end
    def apply_discount
        if self.discount
            self.total -= self.total * self.discount/100
            "After the discount, the total comes to $#{self.total}."
            
        else
            "There is no discount to apply."
        end
    end

    def items
        self.item_history
    end

    def void_last_transaction
        self.total -= self.current_transaction
    end
end
