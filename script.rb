class Game
    attr_accessor :player1, :player2, :table, :game_over, :winner
    def initialize(choose)
        if (choose =="X")
            @player1 = "X"
            @player2 = "O"
        elsif  (choose=="O")
            @player1 = "O"
            @player2 = "X"
        end
        @table = ["_","_","_","_","_","_","_","_","_",]
        @game_over = false
        @winner = false
    end
    
    def print_table
        
        i=0
        3.times do
            puts "#{table[i]} #{table[i+1]} #{table[i+2]}"
            i +=3
        end
        
    end

    def input_move(current_player,place)
        table[place-1] = current_player
    end

    def start
        print_table
        round_played = 0
        current_player = player1
        until game_over do

            puts "#{current_player} Plese choose number from 1 to 9"
            place = gets.chomp
            while place == ""
                puts "#{@current_player} Plese choose number from 1 to 9"
                place = gets.chomp
            end

            place = place.to_i
            while (table[place-1] == "O" || table[place-1] == "X")
                puts "Choose another number, this place is busy"
                place = gets.chomp.to_i            
            end

            input_move(current_player,place)
            print_table
            checking_winner(table,current_player)
            round_played += 1
            current_player == player1 ? current_player = player2 : current_player = player1

            if (round_played == 9 || winner == true)
                @game_over = true
            end
    
        end
    end

    def checking_winner(table,current_player)
        if (table[0] == current_player && table[1] == current_player && table[2] == current_player || #rows
            table[3] == current_player && table[4] == current_player && table[5] == current_player ||
            table[6] == current_player && table[7] == current_player && table[8] == current_player || 
            table[0] == current_player && table[3] == current_player && table[6] == current_player || #columns
            table[1] == current_player && table[4] == current_player && table[7] == current_player ||
            table[2] == current_player && table[5] == current_player && table[8] == current_player ||
            table[0] == current_player && table[4] == current_player && table[8] == current_player || #diagonals
            table[2] == current_player && table[4] == current_player && table[6] == current_player )
            @winner = true
            puts "Winner is #{current_player}"
        end
    end

end
puts("Choose 'O' or 'X' ")
moja_igra = Game.new(gets.chomp)
moja_igra.start