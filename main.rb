# the main method to process a .csv file
def process(filename)

  puts "processing file #{filename}"

  # check file
  unless File.readable?(filename)
    puts 'file not readable!'
    return
  end

  result = []

  lineSum = 0

  # duplicate lines
  File.foreach(filename) do |line|
    split = line.rpartition(',')
    text = split.first
    number = split.last

    lineSum += number.to_i

    number.to_i.times do
      result << text
    end
  end

  # convert to text and write
  text = result.join("\n")

  File.write("out/#{filename}", text)

  # check lines
  fileNum = File.readlines("out/#{filename}").length
  puts "checking lines: #{fileNum == lineSum ? 'okay' : 'WRONG'} (#{fileNum})"

end

# process files
process('Datove_stitky.csv')
process('Smerove_stitky.csv')
