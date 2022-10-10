class AssortReader
  
  def read_from_files(file_name)
    begin
      file = File.new(file_name, 'r:UTF-8')
      lines = file.readlines.map { |l| l.chomp }
      file.close

      return lines
      
    rescue SystemCallError => e
      #puts e.message
      raise OpenException.new
    end
  end
end
