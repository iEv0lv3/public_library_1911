class Author
  attr_reader :first_name, :last_name
  attr_accessor :books

  def initialize(hash)
    @first_name = hash[:first_name]
    @last_name = hash[:last_name]
    @books = []
  end

  def name
    @first_name.concat(' ' + @last_name)
  end

  def write(title, date)
    info = {title: title, publication_date: date, author_first_name: @first_name, author_last_name: @last_name}
    book = Book.new(info)
    @books << book
  end
end
