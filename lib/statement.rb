class Statement

  def show
    'date || credit || debit || balance\n'
  end

  def add(date, credit, debit, balance)
    { date: date, credit: credit, debit: debit, balance: balance}
  end
end
