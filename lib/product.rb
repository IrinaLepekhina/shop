class Product
  
  def initialize(price, amount)
    @price = price
    @amount = amount
  end

  def price
    @price
  end

  def update(*params)
  end

  def info
  end

  def add_product
  end

  def show
    " #{info} - #{@price} руб. (осталось #{@amount})"
  end

  def self.showcase(collection)
    puts "Что хотите купить?\n\n"

    collection.each_with_index do |product, index|
      puts "#{index}: #{product.show}"
    end

    puts "x. Покинуть магазин\n\n"
  end

  def buy
    if @amount > 0
      puts "* * *"
      puts "Вы купили товар #{info}"
      puts "* * *\n\n"

      @amount -= 1
      price
    else
      puts "К сожалению, больше нет"
      0
    end
  end

end