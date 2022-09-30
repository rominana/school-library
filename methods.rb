require './student'
require './person'
require './teacher'
require './book'
require './rental'

module Methods
  def list_all_books(books)
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
    puts '> No books added for the moment' if books.empty?
  end

  def list_all_people(people)
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    puts '> No people added for the moment' if people.empty?
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person = gets.chomp.to_i
    case person
    when 1
      data = create_student
      student = Student.new(classroom: nil, age: data[:age], name: data[:name], parent_permission: data[:permission])
      puts 'Student created successfully!'
      student
    when 2
      data = create_teacher
      teacher = Teacher.new(specialization: data[:specialization], age: data[:age], name: data[:name],
                            parent_permission: true)
      puts 'Teacher created successfully!'
      teacher
    else
      puts '> Invalid option, please select (1) to create a student or (2) to create a teacher'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [y/n]: '
    permission = gets.chomp.capitalize
    permission = permission == 'Y'
    { age: age, name: name, permission: permission }
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    { age: age, name: name, specialization: specialization }
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts '> Book created successfully!'
    book
  end

  def create_rental(books, people)
    puts 'Select a book from the folowing list by number '
    list_all_books(books)
    book = gets.chomp.to_i
    puts 'Select a person from the folowing list by number (not id) '
    list_all_people(people)
    person = gets.chomp.to_i
    print 'Date in [YYYY/MM/DD] format: '
    date = gets.chomp
    if (book <= books.length && book >= 0) && (person <= people.length && person >= 0)
      rental = Rental.new(date, books[book], people[person])
      puts '> Rental created successfully!'
      rental
    else
      puts '> Invalid book or person option'
    end
  end

  def list_rentals(rentals)
    print 'ID of person: '
    id = gets.chomp.to_i
    print("Rentals:\n")
    rentals.map do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
