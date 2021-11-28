module game_control (
    input clk,
    input rst,
    input [3:0] first_card,second_card,third_card,fourth_card,   //1~9 숫자 받음
    output reg [1:0] nstate,
    output reg [1:0] cstate,
    output reg win_pulse,
    output reg lose_pulse
);
    parameter IDLE = 2'b00;  //카드 0개
    parameter S100 = 2'b01;  //카드 1개
    parameter S200 = 2'b10;  //카드 2개
    parameter S300 = 2'b11;  //카드 3개

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            win_pulse <= 1'b0;
            lose_pulse <= 1'b0;
        end
        else begin
            if(first_card+second_card==17) begin
                win_pulse <= 1'b1;
                lose_pulse <= 1'b0;
            end
            else if(first_card+second_card+third_card==17) begin
                win_pulse <= 1'b1;
                lose_pulse <= 1'b0;
            end
            else if(first_card+second_card+third_card>17) begin
                win_pulse <= 1'b0;
                lose_pulse <= 1'b1;
            end
            else if(first_card+second_card+third_card+fourth_card==17) begin
                win_pulse <= 1'b1;
                lose_pulse <= 1'b0;
            end
            else if(first_card+second_card+third_card+fourth_card>17) begin
                win_pulse <= 1'b0;
                lose_pulse <= 1'b1;
            end
            else begin
                win_pulse <= 1'b0;
                lose_pulse <= 1'b0;
            end
        end
    end
endmodule