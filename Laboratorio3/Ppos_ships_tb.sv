module Ppos_ships_tb();

	 logic clk, enable, confirm;
    logic [2:0] x, y;
    logic [2:0] shipQ;
    logic [2:0] board_in[4:0][4:0] = '{
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
				'{0, 0, 0, 0, 0}
        };

   
    logic [2:0] board_out[4:0][4:0];
    logic placed;

    Ppos_ships dut (
        .x(x),
        .y(y),
		  .clk(clk),
        .enable(enable),
        .confirm(confirm),
        .shipQ(shipQ),
        .board_in(board_in),
        .board_out(board_out),
        .placed(placed)
    );


    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        x = 0;
        y = 0;
        enable = 1;
        confirm = 0;
        shipQ = 3;

        #10;

        x = 0;
        y = 0;
        confirm = 1;
        #10;
        confirm = 0;

		  
		  x = 0;
        y = 1;
		  
		  #10;
        x = 1;
        y = 1;
        confirm = 1;
        #10;
        confirm = 0;

        x = 2;
        y = 2;
        confirm = 1;
        #10;
        confirm = 0;
		  
		  #10;
		  $stop;
	end
endmodule