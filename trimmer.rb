require './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0, 5]
  end
end
