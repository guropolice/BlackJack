module switch_driver (
    input clk,
    input rst,
    input card,
    output card_os
);

    wire w_d_card;
    DFF d1(.clk(clk),.rst(rst),.d(card),.q(w_d_card));
    assign card_os=card&(!w_d_card);

endmodule