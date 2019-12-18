require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'

class BookClassTest < Minitest::Test
  def test_book_exists
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_instance_of Book, book
  end

  def test_book_can_have_attributes
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_equal 'Harper', book.author_first_name
    assert_equal 'Lee', book.author_last_name
    assert_equal 'To Kill a Mockingbird', book.title
    assert_equal 'July 11, 1960', book.publication_date
  end

  def test_book_has_publication_year
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_equal '1960', book.publication_year
  end
end
