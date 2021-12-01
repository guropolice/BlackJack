module state_machine(
input clk, rst,
input [3:0] first_card, second_card, third_card, fourth_card,
output reg [1:0] nstate, cstate);

reg [6:0] sum;

parameter IDLE = 2'b00;
parameter UNDER18 = 2'b01;
parameter CLEAR18 = 2'b10;
parameter OVER18 = 2'b11;

// assign sum = first_card + second_card + third_card + fourth_card;

always @ (posedge clk or negedge rst) begin
    if (!rst)
        cstate <= IDLE;
    else
        cstate <= nstate;
end 

always @ (*) begin
    if (!rst)
        nstate = IDLE;
    
    else begin
        case (cstate)
            IDLE : begin
                if (first_card + second_card + third_card + fourth_card == 0)
                    nstate = IDLE;
                else
                    nstate = UNDER18;
            end
            
            UNDER18 : begin
                if ((first_card + second_card + third_card + fourth_card) > 0 && (first_card + second_card + third_card + fourth_card) < 18)
                    nstate = UNDER18;
                else if (first_card + second_card + third_card + fourth_card == 18)
                    nstate = CLEAR18;
                else
                    nstate = OVER18;
            end
            
            CLEAR18 : nstate = IDLE;
            
            OVER18 : nstate = IDLE;
            
            default : nstate = IDLE;
        endcase
    end
end

endmodule