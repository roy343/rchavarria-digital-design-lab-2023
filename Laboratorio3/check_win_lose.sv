module check_win_lose (
		input logic [2:0] board_in[4:0][4:0],
		output logic result,
		output logic [2:0] shipsLeft
	);
	
	logic win;
	logic [5:1] ships_found;

    always_comb begin
        win = 1; 
        shipsLeft = 0; 
        ships_found = '0; 

        for (int i = 0; i < 5; i++) begin
            for (int j = 0; j < 5; j++) begin
                if ((0 < board_in[i][j] < 6) && !ships_found[board_in[i][j]]) begin
                    ships_found[board_in[i][j]] = 1;
                    shipsLeft = shipsLeft + 1;
                end
            end
        end
		  
        for (int k = 1; k <= 5; k++) begin
            if (ships_found[k]) begin
                win = 0; 
            end
        end
    end
	
	assign result = win;

endmodule