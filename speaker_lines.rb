require './lib/count_lines.rb'
include CountLines

doc = parse_xml
speakers = extract_speakers(doc)
output = generate_output(speakers)
output.each do |line|
  puts line
end
