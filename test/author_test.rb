require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test
  def test_author_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"}) 

    assert_instance_of Author, charlotte_bronte
  end

  def test_author_attributes
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal 'Charlotte', charlotte_bronte.first_name
    assert_equal 'Bronte', charlotte_bronte.last_name
  end

  def test_author_full_name_can_be_displayed
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal 'Charlotte Bronte', charlotte_bronte.name
  end

  def test_author_can_have_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal [], charlotte_bronte.books
  end

  def test_author_can_write_and_add_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_same jane_eyre, charlotte_bronte.books
  end

  def test_author_can_write_and_add_multiple_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")

    books = charlotte_bronte.books

    assert_includes([books], jane_eyre)
    assert_includes([books], villette)
  end
end
