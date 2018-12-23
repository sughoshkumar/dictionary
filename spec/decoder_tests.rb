require_relative "../app/models/concerns/decoder"
require 'rspec'

RSpec.describe Decoder do
  it 'Convert 6686787825 to combinations of words' do
     expect(Decoder.converter('6686787825')).to match_array( [["noun", "struck"], ["onto", "struck"],  ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"] )
  end

  it 'Convert 2282668687 to combinations of words' do
     expect(Decoder.converter('2282668687')).to match_array( [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], ["acta", "mounts"], "catamounts"] )
  end

  it 'Numbers will never contain a 0 or 1' do
    expect {Decoder.converter('01')}.to raise_error(RuntimeError, "Numbers will never contain a 0 or 1")
  end

 end