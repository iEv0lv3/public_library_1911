class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
  end

  def publication_time_frame_for(author)
    early = earliest_publication_date(author)
    late = latest_publication_date(author)
    range = early.merge(late)
    range
  end

  def earliest_publication_date(author)
    start_year = { start: nil}
    author.books.min_by do |book|
      if book.publication_date.length != 4
        start_year[:start] = book.publication_year.to_i
      else
        start_year[:start] = book.publication_date.to_i
      end
    end
    start_year
  end

  def latest_publication_date(author)
    end_year = { end: nil }
    author.books.max_by do |book|
      if book.publication_date.length != 4
        end_year[:end] = book.publication_year.to_i
      else
        end_year[:end] = book.publication_date.to_i
      end
      if book.publication_date.to_i > end_year[:end]
        end_year[:end] = book.publication_date.to_i
      end
    end
    end_year
  end
end
