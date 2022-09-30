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
      person = create_person
      @people << person
    when 4
      book = create_book
      @books << book
    when 5
      rental = create_rental(books, people)
      @rentals << rental
    when 6
      list_rentals(rentals)
    else
      puts 'Invalid option, please select an option from 1 to 7'
    end
  end
end
