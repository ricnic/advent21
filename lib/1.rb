class Day1
  def run_day (file)
    input = File.read(file).split.map(&:to_i)

    increased = 0;

    input.each_with_index do |(v), ind|
      if (ind != 0)
        if (v > input[ind-1])
          increased += 1
        end
      end
    end

    return increased
  end
end
