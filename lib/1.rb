class Day1
  def run_day (file)
    input = File.read(file).split.map(&:to_i)

    a, b, incr = [], [], 0;

    input.each { |i|
      a.push(i) if (a.length < 3)
      b.push(i) if (a.length > 1 && b.length < 3)        
      if a.length == 3 && b.length == 3
        incr += 1 if b.sum > a.sum
        a.replace(b)
        b.shift
      end
    }

    return incr
  end
end
