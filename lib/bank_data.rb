class BankData
  def initialize(money)
    @statement = {
      date: Time.now.strftime('%d/%m/%Y'),
      amount: money
    }
  end

  def return
    @statement
  end
end
