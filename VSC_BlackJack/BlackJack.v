//main module
module BlackJack (
    input clk,
    input rst,
    input first_card,second_card,third_card,fourth_card,  //switch
    output win, //LED
    output lose, //LED
    output [7:0] seg_out,
    output reg [7:0] seg_sel
);
    wire w_first_card_os;
    wire w_second_card_os;
    wire w_third_card_os;
    wire w_fourth_card_os;
    switch_driver u0(.clk(clk),.rst(rst),.card(first_card),.card_os(w_first_card_os));
    switch_driver u1(.clk(clk),.rst(rst),.card(second_card),.card_os(w_second_card_os));
    switch_driver u2(.clk(clk),.rst(rst),.card(third_card),.card_os(w_third_card_os));
    switch_driver u3(.clk(clk),.rst(rst),.card(fourth_card),.card_os(w_fourth_card_os));

    wire w_win_pulse;
    wire w_lose_pulse;
    
endmodule







