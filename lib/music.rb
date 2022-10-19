class Music < Product
  attr_accessor :title, :artist_name, :genere

  CSV::Converters[:blank_to_nil] = lambda do |field|
    field && field.empty? ? nil : field
  end

  def self.from_csv(file_path)
    music_collect = []
    
    lines = CSV.read(file_path, headers: true, header_converters: :symbol, converters: [:all, :blank_to_nil]).map {|a| Hash[a]}

    lines.each do |line|
      music_collect << self.new(
        title: line[:title],
        artist_name: line[:artist_name],
        genere: line[:genere],
        price: line[:price].to_i,
        amount: line[:amount].to_i
      )
    end

    music_collect
  end

  def initialize(params)
    super

    @title = params[:title]
    @artist_name = params[:artist_name]
    @genere = [:genere]
  end

  def to_s
    "Альбом «#{@title}», жанр #{@genere}, исполнитель #{@artist_name}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @artist_name = params[:artist_name] if params[:artist_name]
    @genere = params[:genere] if params[:genere]
  end
end
