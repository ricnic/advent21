class Day3
  def Day3.to_dec(bin)
    bin.reverse.chars.map.with_index do |d, i|
      d.to_i * 2**i
    end.sum
  end

  def Day3.trim_report(vert, hori, use_min)
    ind = 0

    while hori.length > 1 do
      zeros = vert[ind].count('0')
      ones = vert[ind].count('1')

      char = '1'

      if use_min
        char = '0' if (zeros == ones || zeros < ones)
      else
        char = '0' if zeros > ones
      end

      hori.replace(hori.select { |cl| cl.chars[ind] == char })

      # recreate the vertical array
      vert = []
      hori.map { |x| 
        x.chars.each_with_index { |(c), i|
          vert[i] ? vert[i].push(c) : vert[i] = [].push(c)
        } 
      }

      ind += 1
    end

    return hori
  end

  def run_day (file)
    bin, oxy, co2 = [], [], []

    File.read(file).split.map { |x| 
      oxy.push(x)
      co2.push(x)
      x.chars.each_with_index { |(c), i|
        bin[i] ? bin[i].push(c) : bin[i] = [].push(c)
      } 
    }

    oxy = Day3.trim_report(bin, oxy, false)
    c02 = Day3.trim_report(bin, co2, true)

    oxy_dec = Day3.to_dec(oxy[0])
    co2_dec = Day3.to_dec(co2[0])

    life_support = oxy_dec * co2_dec
  end
end