if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = File.dirname(__FILE__)

require 'rexml/document'
require 'csv'
require current_path + '/lib/product.rb'
require current_path + '/lib/book.rb'
require current_path + '/lib/film.rb'
require current_path + '/lib/music.rb'
require current_path + '/lib/product_collection.rb'
require current_path + '/lib/table_reader.rb'
require current_path + '/lib/product_writer.rb'

collection = ProductCollection.from_dir(current_path + '/data').to_a.flatten

puts "Какой товар добавить?\n\n"

types = []
collection.each do |product|
  types << product.class
end

# вставить константу типов
types.uniq!
types.each_with_index do |product, index|
  puts "#{index}: #{product}"
end

puts "\nДля выхода, жми \"х\""

choice = 0
# STDIN.gets.encode("UTF-8").chomp
# ProductWriter.get_attr - STDIN.gets.encode("UTF-8").chomp

product = nil

if choice != "x" && choice.to_i < types.size && choice.to_i >= 0
  product_new_class = types[choice].to_s
  product = ProductWriter.new.get_attr(product_new_class)
  collection.push(product)
end

file_path = current_path + '/data/products.xml'

unless File.exist?(file_path)
  abort "Файл #{file_path} не найден"
end

file = File.new(file_path, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

product.add_product(doc, product)

file = File.new(file_path, "w:UTF-8")
doc.write(file, 2)
file.close