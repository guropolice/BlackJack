module reset_to_zero (
    input clk,
    input rst,
    input reset_pulse,
    output reg [3:0] first_card,second_card,third_card,fourth_card
);
    reg [31:0] w_cnt;

    always @ (posedge clk or negedge rst) begin
        if (!rst) w_cnt <= 32'b0;
        
        else begin
            if (w_cnt == 32'd299_999_999) w_cnt <= 32'd0;
            else if (reset_pulse) w_cnt <= 32'd1;
            else if (w_cnt != 0) w_cnt <= w_cnt + 32'd1;
            else w_cnt <= 32'd0;  //cnt가 0일때
        end
    end

        
    always @ (posedge clk or negedge rst) begin
        if (!rst) begin
            first_card <= first_card;
            second_card <= second_card;
            third_card <= third_card;
            fourth_card <= fourth_card;
        end

        else begin
                    if (w_cnt<32'd99_999_999)begin
                            first_card <= first_card;
                            second_card <= second_card;
                            third_card <= third_card;
                            fourth_card <= fourth_card;
                        end 
                        else if (w_cnt>=32'd99_999_999)begin
                            first_card <= 1'b0;
                            second_card <= 1'b0;
                            third_card <= 1'b0;
                            fourth_card <= 1'b0;
                        end
                        else begin
                            first_card <= first_card;
                            second_card <= second_card;
                            third_card <= third_card;
                            fourth_card <= fourth_card;
                        end 
                            
                    
        end
    end
endmodule