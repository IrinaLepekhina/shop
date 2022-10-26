class Book < Product

  def info
    "Книга #{@title}, жанр #{@genere}, автор #{@author}"
  end

  def add_product(doc, product)
    new_product = doc.root.add_element("product", "price" => "#{@price}", "amount" => "#{@amount}")
    new_product.add_element(
      "book",
      'title' => "#{@title}",
      'genere' => "#{@genere}",
      'author' => "#{@author}"
    )

    doc
    puts "Продукт добавлен"
  end

  def update(title, genere, author)
    super

    @title = title if title
    @genere = genere if genere
    @author = author if author
  end
end