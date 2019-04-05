require 'nokogiri'

module CountLines
  def parse_xml
    if File.exists?("public/macbeth.xml")
      Nokogiri::XML(File.read("public/macbeth.xml"))
    else
      raise "The macbeth.xml seems to be missing. Call 'bin/setup' and try again!"
    end
  end

  def extract_speakers(doc)
    # Hash with 0 as default value, else l.29 wont work
    speakers = Hash.new(0)
    # Get all SPEECH elements, no matter where they are
    speeches = doc.xpath("//SPEECH")
    speeches.each do |speech|
      children = speech.children
      # There is one case in macbeth.xml l.1739 where two characters speak at
      # the same time, therefore leading to multiple speakers in one speech, so
      # we have to filter it
      unfiltered_speaker = children.search('SPEAKER')
      if unfiltered_speaker.count > 1
        speaker = unfiltered_speaker.map(&:text).join(' & ')
      else
        speaker = unfiltered_speaker.text
      end
      count = children.search('LINE').count
      speakers[speaker] += count if speaker != "ALL"
    end
    speakers
  end

  def generate_output(speakers)
    output = []
    output << "Count   |   Speaker"
    output << "--------------------"
    # Sort by value descending before iterating
    speakers.sort_by{|k,v| v}.reverse.each do |speaker, count|
      # ljust for placeholding/alignment, capitalize for uniformisation of names
      output << "#{count.to_s.ljust(4)}    |   #{speaker.capitalize}"
    end
    # We cannot print here yet or else it would pollute test log
    output
  end
end
