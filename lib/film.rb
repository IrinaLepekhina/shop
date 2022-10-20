class Film < Product
  def info
    "Фильм «#{@title}», #{@year}, реж. #{@director}"
  end
  
  def update(title, year, director)
    super
  
    @title = title if title
    @year = year if year
    @director = director if director
  end
end



