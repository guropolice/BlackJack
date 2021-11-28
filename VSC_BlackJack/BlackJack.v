//main module
module BlackJack (
    input clk,
    input rst,
    input [3:0]first_card,second_card,third_card,fourth_card,  
    output win, //LED
    output lose, //LED
    ouput [7:0] seg_out,
    output reg [7:0] seg_sel
);
    //random number
    wire [3:0]random_num;
    random_num=$urandom_range(1,9);
    
endmodule

//RANDOM NUM GENERATOR
module Random_Num (
    input clk,
    input rst,
    output reg [3:0] random   //output reg [3:0] random
);
    always @(posedge clk or posedge rst) begin
        if(rst)
            random<=1;
        else if(random==10)
            begin
                random<=1;
            end
        else
            begin
                random<=random+1;
            end
    end
endmodule





