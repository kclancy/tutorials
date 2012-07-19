module SIA

	class WordGrid

    @@char_array = Array.new
    @@grid = Array.new

    def initialize (grid_size)
      @grid_size = grid_size      
    end

    def create_grid

      #create range a-z
      char_range = ('a'..'z').to_a

      #fetch char from range using rand
      char_range.each {store_char char_range.fetch(rand(26))} 

      #fill grid array
      populate_grid

    end

    def store_char (char)
      @@char_array.push char
    end

    def populate_grid

      i = 0
      c = 0      
      
      while i < @grid_size do

        j = 0
        tmp_grid = Array.new

        while j < @grid_size do
          tmp_grid[j] = @@char_array.fetch(c)

          j += 1
          c += 1
        end

        @@grid[i] = tmp_grid

        i += 1
      end

    end

    def print_grid

      #top border of grid
      grid_str = "-----------\n"
      
      @@grid.each do

        |elem| 

        i = 1

        elem.each do
          |char|

          #left grid border
          if i%5 == 1
            grid_str += "|"
          end

          grid_str += char

          #if we're at end of line, insert a break and dividing border
          if i%5 == 0
            grid_str += "|\n"
            grid_str += "-----------\n"          
          else
            #char divider
            grid_str += "|"
          end

          i += 1
        end

      end

      #output
      puts grid_str

    end

  end

  grid = SIA::WordGrid.new(5)

  grid.create_grid

  grid.print_grid

end
