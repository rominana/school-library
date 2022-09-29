class Classroom
  attr_accessor :label
  # conection
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  # add student to classroom
  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
