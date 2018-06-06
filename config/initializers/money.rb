# encoding : utf-8
require 'money'
#require 'money/bank/google_currency'

MoneyRails.configure do |config|
  #set the default currency

  config.default_currency = :gbp

  # (optional)
  # set the seconds after than the current rates are automatically expired
  # by default, they never expire
#  Money::Bank::GoogleCurrency.ttl_in_seconds = 86400
  
  # To handle the inclusion of validations for monetized fields
  # The default value is true
  #
  config.include_validations = true
#  config.default_bank = Money::Bank::GoogleCurrency.new
#  config.default_bank = Money::Bank::VariableExchange.new(ExchangeRate)
  Money.default_bank = Money::Bank::VariableExchange.new(Money::RatesStore::Memory.new)
  # Add exchange rates to current money bank object.
  # (The conversion rate refers to one direction only)
  #
  # Example:

  config.add_rate "eur", "gbp", 0.88
  config.add_rate "gbp", "eur", 1.14
  # config.add_rate "CAD", "USD", 0.803115
#  config.get_rate('GBP','EUR')

end
