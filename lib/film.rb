# frozen_string_literal: true

class Film < Product
  def info
    "Фильм «#{@title}», #{@year}, реж. #{@director}"
  end

  def add_product(doc, _product)
    new_product = doc.root.add_element('product', 'price' => @price.to_s, 'amount' => @amount.to_s)
    new_product.add_element(
      'film',
      'title' => @title.to_s,
      'director' => @director.to_s,
      'year' => @year.to_s
    )

    doc
    puts 'Продукт добавлен'
  end

  def update(title, year, director)
    super

    @title = title if title
    @year = year if year
    @director = director if director
  end
end
