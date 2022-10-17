class Book < Product
  attr_accessor :title, :author, :genere

  CSV::Converters[:blank_to_nil] = lambda do |field|
    field && field.empty? ? nil : field
  end

  def self.from_csv(file_path)

    books_collect = []
    
    lines = CSV.read(file_path, headers: true, header_converters: :symbol, converters: [:all, :blank_to_nil]).map {|a| Hash[a]}
    lines.each do |line|
      books_collect << self.new(
        title: line[:title],
        gener: line[:gener],
        author: line[:author],
        price: line[:price].to_i,
        amount: line[:amount].to_i
      )

    end

    books_collect
  end
  
  def initialize(params)
    super
    @title = params[:title]
    @author = params[:author]
    @gener = params[:gener]
  end

  def to_s
    "Книга #{@title}, автор #{@author}, жанр #{@gener}, #{super}."
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @author = params[:author] if params[:author]
    @genere = params[:genere] if params[:genere]
  end

end