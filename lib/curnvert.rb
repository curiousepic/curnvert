

class Curnvert
  def run
    fail "You need to add some functionality here before you can use this."
  end
end

class DifferentCurrencyCodeError < ArgumentError
end

class Currency
  attr_reader :amount, :code

  def initialize(amount, code)
    if amount.class != Fixnum && amount.class != Float
      raise ArgumentError, "First argument must be the amount as an integer or decimal"
    end
    if code.class != Symbol
      raise ArgumentError, "Second argument must be the currency code in symbol format"
    end
    @amount = amount
    @code = code
  end

  def ==(other)
    if @amount == other.amount && @code == other.code
      true
    end
  end

  def +(other)
    if @code != other.code
      raise DifferentCurrencyCodeError, "These currencies' codes are different"
    else
      Currency.new((@amount + other.amount), @code)
    end
  end

  def -(other)
    if @code != other.code
      raise DifferentCurrencyCodeError, "These currencies' codes are different"
    else
      amounts = [@amount, other.amount]
      amounts = amounts.sort
      Currency.new((amounts.last - amounts.first), @code)
    end
  end

  def *(fof)
    Currency.new(@amount * fof, @code)
  end

end


class CurrencyConverter
  attr_reader :rates

  def initialize
    @rates = { USD: 1.0, EUR: 0.74 }
  end

  def convert(curr, new_code)
    if new_code == curr.code
      curr
    else
      curr_rate = @rates[curr.code]
      new_rate = @rates[new_code]
      actual_rate = new_rate / curr_rate
      Currency.new((curr.amount * actual_rate), new_code)
    end
  end
end
