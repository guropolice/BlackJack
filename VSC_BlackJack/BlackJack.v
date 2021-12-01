module BlackJack(
    input clk, rst,
    input [3:0] card,
    output win, lose,
    output [7:0] seg_out,
    output reg [7:0] seg_sel
);

    wire div_clk_seg;
    wire [3:0] first_number, second_number, third_number, fourth_number;
    wire [1:0] w_nstate, w_cstate;
    reg [3:0] BCD_code;

    div_clk_for_seg u0 (.clk(clk), .rst(rst), .div_clk(div_clk_seg));  
    BCD_to_seg      u1 (.BCD_code(BCD_code), .seg_out(seg_out));
    random_num_gen  u2 (.start(card[3]), .clk(clk), .rst(rst), .number(first_number));
    random_num_gen  u3 (.start(card[2]), .clk(clk), .rst(rst), .number(second_number));
    random_num_gen  u4 (.start(card[1]), .clk(clk), .rst(rst), .number(third_number));
    random_num_gen  u5 (.start(card[0]), .clk(clk), .rst(rst), .number(fourth_number));
    state_machine   u6 (.clk(clk), .rst(rst), .first_card(first_number), .second_card(second_number), .third_card(third_number), .fourth_card(fourth_number), .nstate(w_nstate), .cstate(w_cstate));

    wire w_win_pulse, w_lose_pulse;
    game_control    u7 (.clk(clk), .rst(rst), .nstate(w_nstate), .cstate(w_cstate), .win_pulse(w_win_pulse ), .lose_pulse(w_lose_pulse ),.reset_pulse(w_reset_pulse));

    LED_1s_gen      u8(.clk (clk),.rst(rst),.start_pulse (w_win_pulse ),.LED_1s(win ));
    LED_1s_gen      u9(.clk (clk),.rst(rst),.start_pulse (w_lose_pulse  ),.LED_1s(lose  ));

    wire w_reset_pulse;
    reset_to_zero  u10(.clk(clk),.rst(rst),.reset_pulse(w_reset_pulse),.first_card(first_number), .second_card(second_number), .third_card(third_number), .fourth_card(fourth_number));

    always @ (posedge div_clk_seg or negedge rst) begin
        if (!rst) begin
            seg_sel <= 8'b11111111;
            BCD_code <= 0;
        end
        
        else begin
            seg_sel [3:0] <= 4'b1111;
            
            case (seg_sel [7:4])
                4'b1110 : begin
                    seg_sel [7:4] <= 4'b1101;
                    BCD_code <= card[1] ? third_number : 0;
                end
                
                4'b1101 : begin
                    seg_sel [7:4] <= 4'b1011;
                    BCD_code <= card[2] ? second_number : 0;
                end
                
                4'b1011 : begin
                    seg_sel [7:4] <= 4'b0111;
                    BCD_code <= card[3] ? first_number : 0;
                end
                
                4'b0111 : begin
                    seg_sel [7:4] <= 4'b1110;
                    BCD_code <= card[0] ? fourth_number : 0;
                end
                
                default seg_sel [7:4]<= 4'b1110;
            endcase
        end
    end

endmodule