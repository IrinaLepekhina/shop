# frozen_string_literal: true

class Music < Product
  def info
    "Альбом «#{@title}», жанр #{@genere}, исполнитель #{@artist_name}"
  end

  def add_product(doc, _product)
    new_product = doc.root.add_element('product', 'price' => @price.to_s, 'amount' => @amount.to_s)
    new_product.add_element(
      'music',
      'title' => @title.to_s,
      'artist_name' => @artist_name.to_s,
      'genere' => @genere.to_s
    )

    doc
    puts 'Продукт добавлен'
  end

  def update(title, artist_name, genere)
    super

    @title = title if title
    @artist_name = artist_name if artist_name
    @genere = genere if genere
  end
end
