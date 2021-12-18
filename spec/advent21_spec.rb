# frozen_string_literal: true

RSpec.describe Advent21 do
  it "has a version number" do
    expect(Advent21::VERSION).not_to be nil
  end

  it "allows an appropriate day" do
    expect(Advent21.get_day '12').to eq('12')
  end

  it "defaults to 1 for inappropriate day" do
    expect(Advent21.get_day '25').to eq('1')
  end

  it "knows when it is in test mode" do
    expect(Advent21.get_is_test 'y').to be true
  end

  it "defaults to false for inappropriate test input" do
    expect(Advent21.get_is_test 'why').to be false
  end

  it "generates expected file path" do
    file_path = (Advent21.get_input_file '2', true).chars.last(25).join

    expect(file_path).to eq('/test_inputs/2.input.test')
  end
end
