# frozen_string_literal: true

require_relative "advent21/version"
require_relative "1"
require_relative "2"
require_relative "3"
require_relative "4"

module Advent21
  class Error < StandardError; end

  def Advent21.get_day (arg)
    return (arg && arg.to_i > 0 && arg.to_i < 25) ? arg : '1'
  end
  
  def Advent21.get_is_test (arg)
    return (arg || 'n') === 'y'
  end
  
  def Advent21.get_input_file (day, is_test)
    file_path = is_test ? __dir__ + '/test_inputs/' : __dir__ + '/inputs/'
    file_ext = is_test ? '.input.test' : '.input'
    file = file_path + day + file_ext
  end

  def Advent21.run
    if (!ARGV[0])
      puts 'No advent day supplied - provide day number between 1 and 24'
      day = get_day gets.chomp
    else 
      day = get_day ARGV[0]
    end
  
    if (!ARGV[1])
      puts 'Is this a test run (y/n)?'
      is_test = get_is_test gets.chomp
    else 
      is_test = get_is_test ARGV[1]
    end

    input_file = get_input_file day, is_test
    day_class = Object.const_get('Day' + day).new

    day_class.send('run_day', input_file)
  end
end