module paintScreen_tb();

    // Inputs
    logic [9:0] next_x;
    logic [9:0] next_y;
    logic [2:0] playerBoard[4:0][4:0];
    logic [2:0] EnvBoard[4:0][4:0];

    // Output
    logic [7:0] pixel_color;

    // Instantiate the module under test
    paintScreen dut (
        .next_x(next_x),
        .next_y(next_y),
        .playerBoard(playerBoard),
        .EnvBoard(EnvBoard),
        .pixel_color(pixel_color)
    );

    // Clock generation
    always begin
        #5 next_x = next_x + 1;
        if (next_x == 639) begin
            next_x = 0;
            next_y = next_y + 1;
        end
        if (next_y == 479) begin
            $finish;
        end
    end

    // Initial values
    initial begin
        next_x = 0;
        next_y = 0;
        // Initialize playerBoard and EnvBoard with some values
        // (you can change these values as needed for your testing)
        playerBoard = '{
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
				'{0, 0, 0, 0, 0}
        };
		  EnvBoard = '{
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
            '{0, 0, 0, 0, 0},
				'{0, 0, 0, 0, 0}
        };
    end

    // Monitor to display results
    always @(pixel_color) begin
        $display("next_x = %d, next_y = %d, pixel_color = %h", next_x, next_y, pixel_color);
    end

endmodule