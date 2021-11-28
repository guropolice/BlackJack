//clk 1초
module div_clk_to_1Hz(
    input clk,
    input rst,
    output reg div_clk
);
    reg [31:0] temp_clk;
    
    always @(posedge clk or negedge rst)
    begin
        if(!rst) begin
            temp_clk <= 0;
            div_clk <=0; 
        end 
        else begin
            if(temp_clk <49_999_999) begin
                temp_clk <=temp_clk +1;
                div_clk <= 0; 
            end 
            
            else if(temp_clk >= 49_999_999 && temp_clk <99_999_999) begin
                temp_clk <= temp_clk +1;
                div_clk <=1; 
            end
            
            else begin
                temp_clk <=0;
                div_clk <=0; 
            end 
        end
    end 
endmodule 