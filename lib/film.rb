class Film < Product
  attr_accessor :title, :year, :director

  CSV::Converters[:blank_to_nil] = lambda do |field|
    field && field.empty? ? nil : field
  end

  def self.from_csv(file_path)
    films_collect = []
    
    lines = CSV.read(file_path, headers: true, header_converters: :symbol, converters: [:all, :blank_to_nil]).map {|a| Hash[a]}

    lines.each do |line|
      films_collect << self.new(
        title: line[:title],
        director: line[:director],
        year: line[:year].to_i,
        price: line[:price].to_i,
        amount: line[:amount].to_i
      )
    end

    films_collect
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм «#{@title}», #{@year}, реж. #{@director}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

end