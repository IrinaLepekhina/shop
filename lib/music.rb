class Music < Product
  def info
    "Альбом «#{@title}», жанр #{@genere}, исполнитель #{@artist_name}"
  end

  def update(title, artist_name, genere)
    super

    @title = title if title
    @artist_name = artist_name if artist_name
    @genere = genere if genere
  end
end
