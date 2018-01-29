require('minitest/rg')
require('minitest/autorun')
require_relative('../classes_lab')

class TestStudent < MiniTest::Test

  def test_student_name
    student = Student.new("Danny", 4)
    assert_equal("Danny", student.name())
  end

  def test_cohort_number
    student = Student.new("Danny", 4)
    assert_equal(4, student.cohort())
  end

  def test_set_student_name
    student = Student.new("Danny", 4)
    result = student.set_name("Daniel")
    assert_equal("Daniel", result)
  end

  def test_set_cohort_number
    student = Student.new("Danny", 4)
    result = student.set_cohort(6)
    assert_equal(6, result)
  end

  def test_student_talk
    student = Student.new("Danny", 4)
    result = student.talk()
    assert_equal("I can talk!", result)
  end


  def test_favourite_programming_language
    student = Student.new("Danny", 4)
    result = student.favourite_language("Ruby")
    assert_equal("I love Ruby", result)
  end
end

class TestSportsTeam < MiniTest::Test

  def test_team_name
    sports_team = SportsTeam.new("Celtic",["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths"] ,"Brendan Rodgers")
    assert_equal("Celtic", sports_team.team_name())
  end

  def test_players
    sports_team = SportsTeam.new("Celtic",["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths"] ,"Brendan Rodgers")
    assert_equal(["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths"], sports_team.players())
  end

  def test_coach_name
    sports_team = SportsTeam.new("Celtic",["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths"] ,"Brendan Rodgers")
    assert_equal("Brendan Rodgers", sports_team.coach())
  end

  def test_set_coach_name
    sports_team = SportsTeam.new("Celtic",["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths"] ,"Brendan Rodgers")
    sports_team.coach = ("Neil Lennon")
    assert_equal("Neil Lennon", sports_team.coach())
  end

  def test_add_player_to_players
    sports_team = SportsTeam.new("Celtic",["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths"] ,"Brendan Rodgers")
    sports_team.add_player("Moussa Dembele")
    assert_equal(["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths", "Moussa Dembele"], sports_team.players())
  end

  def test_is_player_included
    sports_team = SportsTeam.new("Celtic",["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths"] ,"Brendan Rodgers")
    result = sports_team.is_player_in("Scott Brown")
    assert_equal(true, result)
  end

  def test_update_points
    sports_team = SportsTeam.new("Celtic",["Craig Gordon", "Scott Brown", "James Forrest", "Leigh Griffiths"] ,"Brendan Rodgers")

    assert_equal(2, sports_team.update_points("Win"))
  end

end


class TestLibrary < MiniTest::Test
  def test_library_has_books
    library = Library.new([])#keep thing simple we will say the library has no books
    assert_equal([], library.books())
  end

  def test_get_info_for_title
    # arrange
    book = {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "29/01/2018"
      }
    }

    book2 = {
      title: "50 Shades of Grey",
      rental_details: {
        student_name: "Ed",
        date: "21/12/2017"
      }
    }
    library = Library.new([book, book2])
    book_info = library.get_info_for_title("50 Shades of Grey")
    assert_equal(book2, book_info)
  end


  def test_get_info_for_rental_details
    book = {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "29/01/2018"
      }
    }

    book2 = {
      title: "50 Shades of Grey",
      rental_details: {
        student_name: "Ed",
        date: "21/12/2017"
      }
    }
    library = Library.new([book, book2])
    rental_details = library.get_rental_details_for_title("50 Shades of Grey")
    assert_equal(book2[:rental_details], rental_details)
  end

  def test_add_book
    book = {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "29/01/2018"
      }
    }


    library = Library.new([book])
    result = library.add_book_by_title("Harry Potter")
    assert_equal(2, result)
  end

  def test_change_rental_info_by_title
    book = {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "29/01/2018"
      }
    }
    library = Library.new([book])
    result = library.change_rental_info("lord_of_the_rings", "Danny", "29/01/2018")
    assert_equal("Danny 29/01/2018", result)
  end






end
