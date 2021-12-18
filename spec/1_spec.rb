# frozen_string_literal: true

RSpec.describe Day1 do
  it "returns the expected number of increases from test file" do
    day = Day1.new
    result = day.run_day('./lib/test_inputs/1.input.test')
    expect(result).to eq(5)
  end
end
