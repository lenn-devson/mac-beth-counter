require 'spec_helper'
include CountLines

describe 'count lines' do
  # let is thread-safe, but a overkill in this case, since the read wont change
  # most probably, so I used the faster 'unsafe' method.

  # # let(:doc)       {parse_xml}
  # # let(:speakers)  {extract_speakers(doc)}
  # # let(:output)    {generate_output(speakers)}

  # Defining those before examples makes them order independent, so tests can be
  # random-seeded
  doc = parse_xml
  speakers = extract_speakers(doc)
  output = generate_output(speakers)

  it 'finds the macbeth file' do
    expect(File).to exist('public/macbeth.xml')
  end

  it 'parses macbeth into a hash' do
    expect(doc).to be_a(Nokogiri::XML::Document)
  end

  it 'extracts speech keys' do
    expect(speakers).to be_a(Hash)
    expect(speakers.values).to all(be_a(Integer))
  end

  it 'outputs speakers with respective counts' do
    expect(output).to be_an(Array)
    expect(output).to all(be_a(String))
  end
end
