require './person'

class Student < Person
  attr_accessor :parent_permission

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

newstudent = Student.new('A-1', 10, 'Joe', parent_permission: false)
p newstudent.play_hooky
p newstudent.can_use_services?
p newstudent.propper_age?
p newstudent
