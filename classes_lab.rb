

# For this part we want you to make a class that represents a CodeClan student.
# Create a Class called Student that takes in a name (String) and a cohort (integer) when an new instance is created.
class Student

  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  # Create a couple of Getter methods, one that returns the name property and one that returns the cohort property of the student.
  def name()
    return @name
  end

  def cohort()
    return @cohort
  end

  # Add in Setter methods to update the students name and what cohort they are in.
  def set_name(name)
    @name = name
  end

  def set_cohort(number)
    @cohort = number
  end


  # Create a method that gets the student to talk (eg. Returns "I can talk!).
  def talk
    return "I can talk!"
  end

  # Create a method that takes in a students favourite programming language and returns it as part of a string (eg. student1.say_favourite_language("Ruby") -> "I love Ruby").

  def favourite_language(language)
    return "I love #{language}"
  end
end




# Part B
#
# Now we would like you to make a class that represents a sports team.
# class SportsTeam
#
# # Make a class to represent a Team that has the properties Team name (String), Players (Array of strings) and a Coach (String).
#   def initialize(team_name, players, coach)
#     @team_name = team_name
#     @players = players
#     @coach = coach
#   end
#
#
# # For each property in the class make a Getter method than can return them.
#   def name
#     return @team_name
#   end
#
#   def players
#     return @players.join(', ')
#   end
#
#   def coach
#     return @coach
#   end
#
# # Create a setter method to allow the coach's name to be updated.
#   def set_coach(coach_name)
#     @coach = coach_name
#   end
#
# end


# Refactor the class to use attr_reader or attr_accessor instead of your own getter and setter methods.
class SportsTeam
  attr_accessor :players, :coach, :points
  attr_reader :team_name

  def initialize(team_name, players, coach)
    @team_name = team_name
    @players = players
    @coach = coach
    @points = 0
  end

# Create a method that adds a new player to the player's array.
  def add_player(new_player)
    @players << new_player
  end

# Add a method that takes in a string of a player's name and checks to see if they are in the players array.
  def is_player_in(player)
    @players.include?(player)
  end

  # Create a method that takes in whether the team has won or lost and updates the points property for a win.
  def update_points(result)
    if result == "Win"
      @points += 2
    end
  end
end




#Extension
# Model a Library as a class.
#
# Create a class for a Library that has an array of books. Each book should be a hash with a title, which is a string, and rental details, which is another hash with a student name and due date.
# This should look something like:
#
#   {
#     title: "lord_of_the_rings",
#     rental_details: {
#      student_name: "Jeff",
#      date: "01/12/16"
#     }
#   }


class Library
  attr_reader :books

  def initialize(books)
    @books = books
  end

# Create a getter for the books
# Create a method that takes in a book title and returns all of the information about that book.
  def get_info_for_title(title)
    for book in @books
      if book[:title] == title
        return book
      end
    end
    return nil
  end

# Create a method that takes in a book title and returns only the rental details for that book.
  def get_rental_details_for_title(title)
    for book in @books
      if book[:title] == title
        return book[:rental_details]
      end
    end
    return nil
  end


  # Create a method that takes in a book title and adds it to our book list (Add a new
   # hash for the book with the student name and date being left as empty strings)
  def add_book_by_title(title)
    new_book = {
      title: title,
      rental_details: {
        student_name: "",
        date: ""
    }}
    @books << new_book
    return @books.length()
  end


  # Create a method that changes the rental details of a book by taking in the title
   # of the book, the student renting it and the date it's due to be returned.
   def change_rental_info(title, student_name, date)
     for book in @books
       if book[:title] == title
         book[:rental_details][:student_name] = student_name
         book[:rental_details][:date] = date
         return book[:rental_details].values().join(" ")
       end
     end

   end


end
