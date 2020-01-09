class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

  def add_boss(boss)
    @boss = boss
    if boss.is_a?(Manager)
      boss.employees << self
    end
  end
end