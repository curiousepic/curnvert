require "minitest/autorun"
require "curnvert"

### Requirements

# Currency:

# Should be created with an amount and a currency code

# Should equal another Currency object with the same amount and currency code

# Should be able to be added to another Currency object with the same currency code

# Should be able to be subtracted by another Currency object with the same currency code

# Should raise a DifferentCurrencyCodeError when you try to add or subtract two Currency objects with different currency codes.

# Should be able to be multiplied by a Fixnum or Float and return a Currency object

# CurrencyConverter:

# Should be created with a Hash of currency codes to conversion rates (see below)

# At first, just make this work with two currency codes and conversation rates, with one rate being 1.0 and the other being the conversation rate (like this: {USD: 1.0, EUR: 0.74})

# Should be able to take a Currency object and a requested currency code that is the same currency code as the Currency object's and return a Currency object equal to the one passed in (that is, currency_converter.convert(Currency.new(1, :USD)) == Currency.new(1, :USD))

# Should be able to take a Currency object that has one currency code it knows and a requested currency code and return a new Currency object with the right amount in the new currency code

# Should be able to be created with a Hash of three or more currency codes and conversion rates

# Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.

# Should raise an UnknownCurrencyCodeError when you try to convert from or to a currency code it doesn't know about.



class CurnvertTest < MiniTest::Unit::TestCase

  # Should be created with an amount and a currency code
  def test_currency_created_with_amount_and_currency_code
    assert(true, Currency.new(100, :USD))
    assert_raises(ArgumentError) { Currency.new(1, 2, 3) }
    assert_raises(ArgumentError) { Currency.new() }
    assert_raises(ArgumentError) { Currency.new("asdf", :USD) }
  end

  # Should equal another Currency object with the same amount and currency code
  def test_two_currency_objects_with_same_arguments_are_equal
    assert_equal Currency.new(110, :ASDF), Currency.new(110, :ASDF)
  end

  # Should be able to be added to another Currency object with the same currency code
  def test_two_currency_objs_with_same_code_can_be_added
    assert_equal Currency.new(123, :USD),
    (Currency.new(52, :USD) + Currency.new(71, :USD))
  end

  # Should be able to be subtracted by another Currency object with the same currency code
  def test_two_currency_objs_with_same_code_can_be_added
    assert_equal Currency.new(67, :USD),
    (Currency.new(10000, :USD) - Currency.new(9933, :USD))
    assert_equal Currency.new(67, :USD),
    (Currency.new(9933, :USD) - Currency.new(10000, :USD))
  end

  # Should raise a DifferentCurrencyCodeError when you try to add or subtract two Currency objects with different currency codes.

  def test_raises_error_when_using_two_different_codes
    assert_raises(DifferentCurrencyCodeError) do
    Currency.new(52, :USD) + Currency.new(71, :ISK)
    end
    assert_raises(DifferentCurrencyCodeError) do
    Currency.new(52, :USD) - Currency.new(71, :ISK)
    end
  end

  # Should be able to be multiplied by a Fixnum or Float and return a Currency object
  def test_returns_currency_obj_when_multiplying_it_by_fixnum_or_float
    assert_equal Currency.new(32,:USD), (Currency.new(8, :USD) * 4)
    assert_equal Currency.new(19.488,:USD),
    (Currency.new(6, :USD) * 3.248)
  end

  # At first, just make this work with two currency codes and conversation rates, with one rate being 1.0 and the other being the conversation rate (like this: {USD: 1.0, EUR: 0.74})
  # def test_a_hash_of_codes_and_rates_exist
  #   assert_equal CurrencyConverter.new,
  #   {}

end
