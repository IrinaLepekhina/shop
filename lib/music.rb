class Music < Product

  def info
    "Альбом «#{@title}», жанр #{@genere}, исполнитель #{@artist_name}"
  end

  def add_product(doc, product)
    new_product = doc.root.add_element("product", "price" => "#{@price}", "amount" => "#{@amount}")
    new_product.add_element(
      "music",
      'title' => "#{@title}",
      'artist_name' => "#{@artist_name}",
      'genere' => "#{@genere}"
    )

    doc
    puts "Продукт добавлен"
  end

  def update(title, artist_name, genere)
    super

    @title = title if title
    @artist_name = artist_name if artist_name
    @genere = genere if genere
  end
end
