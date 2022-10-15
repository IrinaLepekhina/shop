class Book < Product
  attr_accessor :title, :author, :genere

  def self.from_file(file_path)
    
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[1],
      genre: lines[2],
      author: lines[3],
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end
  
  def initialize(params)
    super
    @title = params[:title]
    @author = params[:author]
    @genere = params[:genere]
  end

  def to_s
    "Книга #{@title}, автор #{@author}, жанр #{@genere}, #{super}."
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @author = params[:author] if params[:author]
    @genere = params[:genere] if params[:genere]
  end

end