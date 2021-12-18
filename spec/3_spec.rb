# frozen_string_literal: true

RSpec.describe Day3 do
  it "returns the expected power consumption" do
    day = Day3.new
    result = day.run_day('./lib/test_inputs/3.input.test')
    expect(result).to eq(198)
  end
end