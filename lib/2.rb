class Day2
  def run_day (file)
    h, d = 0, 0

    File.foreach(file) { |l|
      incr = l.split[1].to_i

      case l[0,2]
      when "fo"
        h += incr
      when "up"
        d -= incr
      else
        d += incr
      end
    }

    return h*d
  end
end
