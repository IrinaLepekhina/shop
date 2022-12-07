# frozen_string_literal: true

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = File.dirname(__FILE__)

require 'rexml/document'
require 'csv'
require "#{current_path}/lib/product.rb"
require "#{current_path}/lib/book.rb"
require "#{current_path}/lib/film.rb"
require "#{current_path}/lib/music.rb"
require "#{current_path}/lib/product_collection.rb"
require "#{current_path}/lib/table_reader.rb"
require "#{current_path}/lib/product_writer.rb"

collection = ProductCollection.from_dir("#{current_path}/data").to_a.flatten

puts "Какой товар добавить?\n\n"

product_types = Product.product_types
product_types.each_with_index do |p, i|
  puts "#{i}: #{p.name}"
end

puts "\nДля выхода, жми \"х\""

choice = 1
# # STDIN.gets.encode("UTF-8").chomp
# # ProductWriter.get_attr - STDIN.gets.encode("UTF-8").chomp

product = nil

if choice != 'x' && choice.to_i < product_types.size && choice.to_i >= 0
  product_new_class = product_types[choice].to_s

  product = ProductWriter.new.get_attr(product_new_class)
  collection.push(product)
end

file_path = "#{current_path}/data/products.xml"

product.save_to_xml(file_path, product)
