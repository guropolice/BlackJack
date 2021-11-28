module BlackJack (

);
    wire [3:0]random_num;
    random_num=$urandom_range(20,30);
    
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

//DFF
module DFF (
    input clk,
    input rst,
    input d,
    output reg q
);
     always @(negedge clk or negedge rst)
        begin
            if(rst == 0) begin
                q<=0; 
            end 
            else begin
                q<=d; 
            end
        end
endmodule



