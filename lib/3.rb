class Day3
  def Day3.to_dec(bin)
    bin.reverse.chars.map.with_index do |d, i|
      d.to_i * 2**i
    end.sum
  end

  def run_day (file)
    bin, gam, eps = [], [], []

    File.read(file).split.map { |x| 
      x.chars.each_with_index { |(c), i|
        bin[i] ? bin[i].push(c) : bin[i] = [].push(c)
      } 
    }

    bin.each { |b|
      gam.push(b.max_by { |p| b.count(p) })
      eps.push(b.min_by { |p| b.count(p) })
    }

    gam_dec = Day3.to_dec(gam.join)
    eps_dec = Day3.to_dec(eps.join)
    power_consumption = gam_dec * eps_dec
  end
end