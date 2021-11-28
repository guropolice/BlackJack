module state_machine (
    input clk,
    input rst,
    input [3:0] first_card,second_card,third_card,fourth_card,
    output reg [1:0] nstate,
    output reg [1:0] cstate
);
    parameter IDLE = 2'b00;  //카드 0개
    parameter S100 = 2'b01;  //카드 1개
    parameter S200 = 2'b10;  //카드 2개
    parameter S300 = 2'b11;  //카드 3개

    always @(posedge clk or negedge rst) begin
        if(!rst)
            cstate<=IDLE;
        else
            cstate<=nstate;
    end 

    always @(*) begin
        if(!rst)
            nstate<=IDLE;
        else begin
            case (cstate)
                IDLE: begin
                    if(first_card) nstate=S100;
                    else nstate = IDLE;
                end 
                S100: begin
                    if(first_card && second_card && first_card+second_card<17) nstate=S200;
                    else if(first_card && second_card && first_card+second_card==17) nstate=IDLE;
                    else nstate = S100;
                end
                S200: begin
                    if(first_card && second_card && third_card && first_card+second_card+third_card<17) nstate=S300;
                    else if(first_card && second_card && third_card && first_card+second_card+third_card==17) nstate=IDLE;
                    else nstate = S200;
                end
                S300: begin
                    if(fourth_card) nstate=IDLE;
                    else nstate = S300;
                end
                default: nstate=IDLE;
            endcase
        end
    end
endmodule