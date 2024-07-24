class BaseballPlayer
  def initialize(name, hits, walks, at_bats)
    @name = name
    @hits = hits
    @walks = walks
    @at_bats = at_bats
  end

  def batting_average()
    (@hits.to_f/@at_bats)
  end

  def on_base_percentage()
    ((@hits + @walks).to_f/@at_bats)
  end

end

babe = BaseballPlayer.new("Babe Ruth", 330, 110, 1125)
p babe.batting_average()
p babe.on_base_percentage

class Person
  attr_accessor :first, :last

  def initialize(first, last)
    @first = first
    @last = last
  end

  def full_name()
    @first + " " + @last
  end
end

tess = Person.new("Tess", "Duke")
p tess.first
p tess.last
tess.first= "Contessa"
p tess.first
p tess.full_name

module MathHelpers
  def exponent(x, y)
    x**y
  end
end

class Calculator
  include MathHelpers
  def square_root(z)
    exponent(z, 0.5)
  end
end

number = Calculator.new
p number.square_root(25)