class Book
  attr_reader :author_first_name, :author_last_name, :title
  attr_accessor :publication_date

  def initialize(hash)
    @author_first_name = hash[:author_first_name]
    @author_last_name = hash[:author_last_name]
    @title = hash[:title]
    @publication_date = hash[:publication_date]
  end

  def publication_year
    year = @publication_date.split(',')
    @publication_date = year[1].strip
  end
end
