class Book < Product
  def info
    "Книга #{@title}, жанр #{@genere}, автор #{@author}"
  end

  def update(title, genere, author)
    super

    @title = title if title
    @genere = genere if genere
    @author = author if author
  end
end