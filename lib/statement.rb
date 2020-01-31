class Statement

  def initialize
    @transactions = []
  end

  def show
    statement = 'date || credit || debit || balance\n'
    @transactions.each { |transaction|
      statement << ("#{transaction[:date]} || #{'%.2f' % transaction[:credit]} ||" \
                    " #{'%.2f' % transaction[:debit]} || #{'%.2f' % transaction[:balance]}" + '\n')
    }
    statement
  end

  def add(date, credit, debit, balance)
    @transactions.unshift({ date: date, credit: credit, debit: debit, balance: balance })
  end
end
