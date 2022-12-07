# frozen_string_literal: true

class Book < Product
  def info
    "Книга #{@title}, жанр #{@genere}, автор #{@author}"
  end

  def add_product(doc, _product)
    new_product = doc.root.add_element('product', 'price' => @price.to_s, 'amount' => @amount.to_s)
    new_product.add_element(
      'book',
      'title' => @title.to_s,
      'genere' => @genere.to_s,
      'author' => @author.to_s
    )

    doc
    puts 'Продукт добавлен'
  end

  def update(title, genere, author)
    super

    @title = title if title
    @genere = genere if genere
    @author = author if author
  end
end
