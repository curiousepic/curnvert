

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
    if amount.class != Fixnum
      raise ArgumentError, "First argument must be the amount as an integer"
    end
    if code.class != String
      raise ArgumentError, "Second argument must be the currency code in string format"
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

  # def check_codes(curr1, curr2)
  #   if curr1 == curr2
  #     true
  #   else
  #     raise DifferentCurrencyCodeError, "These currencies' codes are different"
  #   end
  # end

end


class CurrencyConverter
end
