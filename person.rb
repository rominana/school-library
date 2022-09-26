class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..100)
  end

  def propper_age?
   if @age >= 18
    return true
   else 
    return false
   end
  end

  def can_use_services?
    propper_age? || @parent_permission
  end
end
