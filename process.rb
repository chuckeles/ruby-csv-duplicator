# get filename
filename = ARGV[0]

# check
unless File.readable?(filename)
  puts "file #{filename} not readable!"
  return
end

result = ""

# process lines
File.foreach(filename) do |line|
  line_split = line.split(";")

  # duplicate if necessary
  number = line_split.last.to_i
  if number > 0
    number.times do
      line_split.first(line_split.size - 1).each do |cell|
        result << cell << ";"
      end

      result << "\n"
    end
  else
    line_split.first(line_split.size - 1).each do |cell|
      result << cell << ";"
    end

    result << "\n"
  end
end

# done, write
File.write("!#{filename}", result)

puts File.readlines("!#{filename}").length
