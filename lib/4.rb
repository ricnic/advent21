class Day4
  def Day4.find_winner (n, boards)
    boards.each { |board|
      board.each { |row| 
        row.delete(n)
        if row.length < 1
          win_sum = 0
          board.each { |x| win_sum += x.sum }

          return win_sum * n
        end
      }
    }

    return nil
  end

  def run_day (file)
    size, board = 5, 0
    draws, hboards, vboards = [], [], []

    File.read(file).split.map.with_index { |(x), i| 
      if i == 0
        draws = x.split(',').map(&:to_i)
      else
        # Populate boards
        ind = (i - 1)
        h_ind = (ind / size) % size
        v_ind = i % size
        
        hboards[board] ||= []
        vboards[board] ||= []

        (hboards[board][h_ind] ||= []) << x.to_i
        (vboards[board][v_ind] ||= []) << x.to_i
        
        board +=1 if (i % (size*size) == 0)
      end
    }

    total = nil

    draws.each { |n|
      total = Day4.find_winner(n, hboards)
      return total if total

      total = Day4.find_winner(n, vboards)
      return total if total
    }
    
    # Find the first board that fills a horizonal or vertical line
    # Looks like we can remove the winning numbers and look for empty lists
  end
end