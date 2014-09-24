

class Curnvert
  def run
    fail "You need to add some functionality here before you can use this."
  end
end

class Currency
  attr_reader :amount, :code

  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
    if @amount == other.amount && @code == other.code
      true
    end
  end

  def +(other)
    Currency.new((@amount + other.amount), @code)
  end

  def -(other)
    amounts = [@amount, other.amount]
    amounts = amounts.sort
    Currency.new((amounts.last - amounts.first), @code)
  end


end


class CurrencyConverter
end
