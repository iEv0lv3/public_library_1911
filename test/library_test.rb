require 'minitest/autorun'
require 'minitest/pride'
require './lib/library'
require './lib/author'
require './lib/book'

class LibraryTest < Minitest::Test
  def test_library_exists
    dpl = Library.new('Denver Public Library')

    assert_instance_of Library, dpl
  end

  def test_library_attributes
    dpl = Library.new('Denver Public Library')

    assert_equal 'Denver Public Library', dpl.name
    assert_equal [], dpl.books
    assert_equal [], dpl.authors
  end

  def test_library_can_add_authors
    dpl = Library.new('Denver Public Library')
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
    professor = charlotte_bronte.write("The Professor", "1857")    
    villette = charlotte_bronte.write("Villette", "1853")    
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 
    
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    authors = dpl.authors

    assert_includes(authors, charlotte_bronte)
    assert_includes(authors, harper_lee)
  end

  def test_library_can_add_books_from_authors
    dpl = Library.new('Denver Public Library')
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
    professor = charlotte_bronte.write("The Professor", "1857")    
    villette = charlotte_bronte.write("Villette", "1853")    
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 
    
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    authors = dpl.authors
    books = dpl.books

    assert_includes(books, professor)
    assert_includes(books, villette)
  end

  def test_library_publication_time_frame
    dpl = Library.new('Denver Public Library')
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
    professor = charlotte_bronte.write("The Professor", "1857")    
    villette = charlotte_bronte.write("Villette", "1853")    
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 
    
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    authors = dpl.authors
    books = dpl.books
    require 'pry'; binding.pry

    assert_equal ({:start=>"1847", :end=>"1857"}), dpl.publication_time_frame_for(charlotte_bronte)
  end
end
