module game_control(
    input clk, rst,
    input [1:0] nstate, cstate,
    output reg win_pulse, lose_pulse,
    output reg reset_pulse
);

parameter IDLE = 2'b00;
parameter UNDER18 = 2'b01;
parameter CLEAR18 = 2'b10;
parameter OVER18 = 2'b11;

always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        win_pulse <= 1'b0;
        lose_pulse <= 1'b0;
        reset_pulse <= 1'b0;
    end
    
    else begin
        if (cstate == CLEAR18 && nstate == IDLE) begin
            win_pulse <= 1'b1;
            lose_pulse <= 1'b0;
            reset_pulse <= 1'b1;
        end
        
        else if (cstate == OVER18 && nstate == IDLE) begin
            win_pulse <= 1'b0;
            lose_pulse <= 1'b1;
            reset_pulse <= 1'b1;
        end
        
        else begin
            win_pulse <= win_pulse;
            lose_pulse <= lose_pulse;
        end
    end
end

endmodule