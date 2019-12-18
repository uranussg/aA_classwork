require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end
    
    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        @funding > other_startup.funding
    end
    
    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else  
            raise 'invalid title'
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else  
            raise "we don't have enough money"
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        @employees.map {|employee| @salaries[employee.title] }.sum / self.size.to_f
    end

    def close 
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |k,v|
            if !self.valid_title?(k)
                @salaries[k] = v
            end
        end

        @employees += other_startup.employees
        other_startup.close
    end



end


