require_relative 'transaction'

class BankData
  DEFAULT_BALANCE = 0
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    @statement.unshift({ time: Time.now.strftime('%d/%m/%Y'),
                         deposit: format('%.2f', amount),
                         withdrawl: format('%.2f', 0),
                         balance: format('%.2f', (@balance = @balance.to_f + amount)) })
  end

  def withdrawl(amount)
    @statement.unshift({ time: Time.now.strftime('%d/%m/%Y'),
                         deposit: format('%.2f', 0),
                         withdrawl: format('%.2f', amount),
                         balance: format('%.2f', (@balance = @balance.to_f - amount)) })
  end

  def store_data(amount, transaction_type)
    @transaction = Transaction.new
    if transaction_type == 'deposit'
      { time: @transaction.time, credit: amount, debit: 0}
    else
      { time: @transaction.time, credit: 0, debit: amount}
    end
  end

  def display
    puts 'date || credit || debit || balance'
    @statement.each { |transaction|
      puts "#{transaction[:time]} || #{transaction[:deposit]} ||" +
           " #{transaction[:withdrawl]} || #{transaction[:balance]}"
    }
  end
end
