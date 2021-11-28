//RANDOM NUM GENERATOR
module random_num_gen (
    input clk,
    input rst,
    //input card,
    output reg [3:0]random_num
);
    always @(posedge clk or negedge rst) begin
        if(!rst)
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

/*
//random number
    wire [3:0]random_num;
    random_num=$urandom_range(1,9);
*/