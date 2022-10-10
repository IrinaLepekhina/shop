class Creator

  def self.for(lines)
    case lines[0]
    when "film"
      film = Film.from_file(lines)
    when "book"     
      book = Book.from_file(lines)
    else
      raise 'Unsupported type'
    end
  end

end