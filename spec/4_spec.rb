# frozen_string_literal: true

RSpec.describe Day4 do
  it "returns the expected score of winning board" do
    day = Day4.new
    result = day.run_day('./lib/test_inputs/4.input.test')
    expect(result).to eq(4512)
  end
end