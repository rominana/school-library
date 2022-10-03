require './person'
require './student'
require './teacher'
require './book'
require './rental'
require './methods'

class App
  include Methods
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def select_option(option)
    case option
    when 1
      list_all_books(books)
    when 2
      list_all_people(people)
    when 3
      @people << create_person
    when 4
      @books << create_book
    when 5
      @rentals << create_rental(books, people)
    when 6
      list_rentals(rentals)
    else
      puts 'Invalid option, please select an option from 1 to 7'
    end
  end
end
