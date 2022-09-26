require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

newteacher = Teacher.new('math', 35, 'Mary')
p newteacher.propper_age?
p newteacher.can_use_services?
p newteacher
