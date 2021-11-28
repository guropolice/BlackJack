module LED_3s_gen (
    input clk,
    input rst,
    input start_pulse,
    output reg LED_3s
);
    reg [31:0] w_cnt;

    always @ (posedge clk or negedge rst) begin
        if (!rst) begin
            w_cnt <= 32'b0;
        end
        else begin
            if (w_cnt == 32'd299_999_999)   //99=>299
                w_cnt <= 32'd0;
            else if (start_pulse)
                w_cnt <= 32'd1;
            else if (w_cnt != 0)
                w_cnt <= w_cnt + 32'd1;
            else
                w_cnt <= 32'd0;
        end
    end

     always @ (posedge clk or negedge rst) begin
        if (!rst) begin
            LED_3s <= 1'b0;
        end
        else begin
            if (start_pulse)
                LED_3s <= 1'b1;
            else if (w_cnt == 32'd299_999_999)   //99=>299
                LED_3s <= 1'b0;
            else
                LED_3s <= LED_3s;
        end
    end
endmodule