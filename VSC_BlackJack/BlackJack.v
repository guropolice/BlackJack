//main module
module BlackJack(
    input clk, rst,
    input first_card, second_card, third_card, fourth_card,
    output win, lose,
    output [7:0] seg_out,
    output reg [7:0] seg_sel);

    reg [3:0] w_first_card, w_second_card, w_third_card, w_fourth_card;
    wire [3:0] w_ramdom_num;
    wire w_win_pulse, w_lose_pulse;

    random_num_gen u0 (.clk(clk), .rst(rst), .random(w_ramdom_num));

    wire div_clk_seg; 
    reg [3:0] BCD_code;
    div_clk_for_seg d0(.clk(clk),.rst(rst),.div_clk (div_clk_seg ));  
    BCD_to_seg b0(.BCD_code (BCD_code ),.seg_out (seg_out )
);


    always @ (posedge first_card or posedge second_card or posedge third_card or posedge fourth_card) begin
        if (first_card == 1'b1) begin
            w_first_card <= w_ramdom_num;
        end
        
        else if (second_card == 1'b1) begin
            w_second_card <= w_ramdom_num;
        end
        
        else if (third_card == 1'b1) begin
            w_third_card <= w_ramdom_num;
        end
        
        else if (fourth_card == 1'b1) begin
            w_fourth_card <= w_ramdom_num;
        end
            
        else begin
            w_first_card <= w_first_card;
            w_second_card <= w_second_card;
            w_third_card <= w_third_card;
            w_fourth_card <= w_fourth_card;
        end
    end

    always @(posedge div_clk_seg or negedge rst)
        begin
            if(!rst) begin
                seg_sel <= 8'b11111111;
                BCD_code <=0; 
            end
            else begin
                seg_sel [3:0]<= 4'b1111;
                case (seg_sel [7:4] )
                4'b1110: begin
                    seg_sel [7:4]<= 4'b1101;
                    BCD_code <= w_second_card  ;
                end
                4'b1101: begin
                    seg_sel [7:4]<= 4'b1011;
                    BCD_code <= w_third_card  ; 
                end
                4'b1011: begin
                    seg_sel [7:4]<= 4'b0111;
                    BCD_code <= w_fourth_card  ;
                end
                4'b0111: begin
                    seg_sel [7:4]<= 4'b1110;
                    BCD_code <= w_first_card  ;
                end
                    default seg_sel [7:4]<= 4'b1110;
                endcase 
            end
        end


endmodule



/*
wire w_first_card_os;
    wire w_second_card_os;
    wire w_third_card_os;
    wire w_fourth_card_os;
    switch_driver u0(.clk(clk),.rst(rst),.card(first_card),.card_os(w_first_card_os));
    switch_driver u1(.clk(clk),.rst(rst),.card(second_card),.card_os(w_second_card_os));
    switch_driver u2(.clk(clk),.rst(rst),.card(third_card),.card_os(w_third_card_os));
    switch_driver u3(.clk(clk),.rst(rst),.card(fourth_card),.card_os(w_fourth_card_os));

*/



