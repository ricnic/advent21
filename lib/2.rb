class Day2
  def run_day (file)
    h, d, a = 0, 0, 0

    File.foreach(file) { |l|
      incr = l.split[1].to_i

      case l[0,2]
      when "fo"
        h += incr
        d = (a > 0) ? d + (a * incr) : 0 
      when "up"
        a -= incr
      else
        a += incr
      end
    }

    return h*d
  end
end
