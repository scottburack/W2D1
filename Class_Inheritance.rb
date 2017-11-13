class Employee
  attr_reader :name,:salary,:title 
  attr_accessor :boss

  def initialize(name, salary, title, boss = nil)
    @name,@salary,@title = name, salary, title
    self.boss = boss
  end
  
  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?
    boss
  end
  
  def bonus(multiplier)
    self.salary * multiplier
  end
  
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, salary, title, boss = nil)
    super(name,salary,title,boss)
    @employees = []
  end
  
  def add_employee(subordinate)
    employees << subordinate
    subordinate
  end
  
  def bonus(multiplier)
    self.total * multiplier
  end
  
  protected
  def total
    total = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total += employee.total + employee.salary
      else
        total += employee.salary
      end
    end
    total
  end
  
end
