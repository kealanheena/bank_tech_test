module Formatter
  def format(transactions)
    statement = "date || credit || debit || balance\n"
    transactions.each { |transaction|
      statement << "#{transaction[:date]} || #{'%.2f' % transaction[:credit]} ||" \
                   " #{'%.2f' % transaction[:debit]} || #{'%.2f' % transaction[:balance]}\n"
    }
    statement
  end
end
