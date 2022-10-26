class Film < Product

  def info
    "Фильм «#{@title}», #{@year}, реж. #{@director}"
  end

  def add_product(doc, product)
    new_product = doc.root.add_element("product", "price" => "#{@price}", "amount" => "#{@amount}")
    new_product.add_element(
      "film",
      'title' => "#{@title}",
      'director' => "#{@director}",
      'year' => "#{@year}"
    )

    doc
    puts "Продукт добавлен"
  end
  
  def update(title, year, director)
    super
  
    @title = title if title
    @year = year if year
    @director = director if director
  end
end



