if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = File.dirname(__FILE__)

require current_path + '/lib/product'
require current_path + '/lib/book'
require current_path + '/lib/film'

movie = Film.new(price: 990, amount: 5, name: "Леон")

puts "Фильм #{movie.name} стоит #{movie.price} руб."