class Viking
  attr_accessor :name, :age, :health, :strength

  def initialize(name, age, health, strength)
    @name = name
    @age = age
    @health = health
    @strength = strength
  end

  def self.create_warrior(name)
    age = rand * 20 + 15
    health = [age * 5, 120].min
    strength = [age / 2, 10].min
    Viking.new(name, health, age, strength)
  end

  def take_damage(damage)
    @health -= damage
  end

  def attack(enemy)
    enemy.take_damage(strength)
  end

  def sleep
    @health += 5 unless health >= 100
  end

end