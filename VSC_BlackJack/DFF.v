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