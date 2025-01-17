`timescale 1ns / 1ps

module pCounter_tb();
    
    logic clk = 0, r;
	 logic [5:0] val2 = 2'b11;
	 logic [5:0] val4 = 4'b1111;
	 logic [5:0] val6 = 6'b001010;
    logic [1:0] out2;
	 logic [3:0] out4;
	 logic [5:0] out6;
    
    pCounter #(2) counter_2bit (
        .clk(clk),
        .r(r),
		  .val(val2),
        .out(out2)
    );
	 
	 pCounter #(4) counter_4bit (
        .clk(clk),
        .r(r),
		  .val(val4),
        .out(out4)
    );
	 
	 pCounter #(6) counter_6bit (
        .clk(clk),
        .r(r),
		  .val(val6),
        .out(out6)
    );

    initial begin
        forever #2 clk = ~clk;
    end
    
    initial begin
        r = 1; 
        #1 r = 0; 
		  #6 r = 1; 
        #1 r = 0; 
    end
	 
    initial begin
        #20 $stop; 
    end

endmodule