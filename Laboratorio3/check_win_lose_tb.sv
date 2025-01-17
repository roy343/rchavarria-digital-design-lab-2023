module check_win_lose_tb();

    logic [2:0] board_in[4:0][4:0];

   
    logic [2:0 ]ships;
    logic clk, res;

    check_win_lose dut (
        .board_in(board_in),
        .result(res),
        .shipsLeft(ships)
    );


    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;

		  board_in = '{
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{3, 3, 3, 2, 2},
				'{0, 0, 0, 0, 1}
        };

		  #30;

		  board_in = '{
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
				'{0, 0, 0, 0, 0}
        };
		  
		  #10;
		  
		  board_in = '{
            '{5, 5, 5, 5, 5},
            '{0, 0, 7, 0, 0},
            '{0, 4, 4, 6, 0},
            '{3, 3, 3, 2, 2},
				'{0, 7, 0, 0, 6}
        };
		  
		  #10;
		  
		  $stop;
	end
endmodule