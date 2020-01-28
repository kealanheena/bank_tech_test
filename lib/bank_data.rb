class BankData

  DEFAULT_BALANCE = sprintf("%.2f", 0)
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
  end

  # @statement = {
    #   date: Time.now.strftime('%d/%m/%Y at %H:%M'),
    #   amount: money
    # }

  # def return
  #   @statement
  # end
end
