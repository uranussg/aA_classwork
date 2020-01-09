require_relative 'employee'
class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary)
    super(name, title, salary)
    @employees = []
  end

  def bonus(multiplier)   
    @employees.inject(0) { |acc, employee| acc += employee.salary } * multiplier
    # employees.map(&:salary).sum * multiplier
  end

  def add_boss(boss)
    boss.employees += employees
    super
  end
end


david = Employee.new('David', 'TA', 10000)
shawna = Employee.new('Shawna', 'TA', 12000)
darren = Manager.new('Darren', 'TA manager', 78000)
ned = Manager.new('Ned', 'Founder', 1000000)
david.add_boss(darren)
shawna.add_boss(darren)
darren.add_boss(ned)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) 