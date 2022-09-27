require './nameable'

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(component)
    super()
    @nameable = component
  end

  def correct_name
    @nameable.correct_name
  end
end
