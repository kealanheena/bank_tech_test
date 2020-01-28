class BankData
  DEFAULT_BALANCE = 0
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = format('%.2f', balance)
  end

#  @statement = {
#   date: Time.now.strftime('%d/%m/%Y at %H:%M'),
#   amount: money
# }

# def return
#   @statement
  # end
end
