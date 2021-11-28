//segment 분주
module div_clk_for_seg(
    input clk,
    input rst,
    output reg div_clk
);
    reg [11:0] temp_clk;
    
    always @(posedge clk or negedge rst )
    begin
        if(!rst) begin
            temp_clk <=0;
            div_clk <=0; 
        end 
        else begin
            if(temp_clk <999) begin
                temp_clk <=temp_clk +1;
                div_clk <=0; 
            end 
            else if(temp_clk >=999 && temp_clk <1999) begin
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