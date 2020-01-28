class BankData
  DEFAULT_BALANCE = 0
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    @statement << { time: Time.now.strftime('%d/%m/%Y'),
                    deposit: amount,
                    withdrawl: format('%.2f', 0),
                    balance: format('%.2f', (@balance.to_f + amount)) }
  end

  def withdrawl(amount)
    @statement << { time: Time.now.strftime('%d/%m/%Y'),
                    deposit: format('%.2f', 0),
                    withdrawl: amount,
                    balance: format('%.2f', (@balance.to_f - amount)) }
  end

  def display
    puts 'date || credit || debit || balance'
    @statement.each { |transaction|
      puts "#{transaction[:time]} || #{transaction[:deposit]} ||" +
           " #{transaction[:withdrawl]} || #{transaction[:balance]}"
    }
  end
end
