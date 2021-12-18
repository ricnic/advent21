# frozen_string_literal: true

RSpec.describe Day2 do
  it "returns the expected horizontal and depth multiple" do
    day = Day2.new
    result = day.run_day('./lib/test_inputs/2.input.test')
    expect(result).to eq(900)
  end
end