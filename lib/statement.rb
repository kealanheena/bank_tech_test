require 'formatter'

class Statement

  include Formatter

  def initialize
    @transactions = []
  end

  def show
    format(@transactions)
  end

  def add(date, credit, debit, balance)
    @transactions.unshift({ date: date, credit: credit, debit: debit, balance: balance })
  end
end
