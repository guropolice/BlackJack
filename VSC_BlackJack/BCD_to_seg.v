//segment
module BCD_to_seg(
    input [3:0] BCD_code,
    output reg [7:0] seg_out
    );
    
    parameter seg0=8'b00000011; parameter seg1=8'b10011111;
    parameter seg2=8'b00100101; parameter seg3=8'b00001101;
    parameter seg4=8'b10011001; parameter seg5=8'b01001001;
    parameter seg6=8'b01000001; parameter seg7=8'b00011111;
    parameter seg8=8'b00000001; parameter seg9=8'b00011001;
    parameter err=8'b01100001;
    
    assign seg_sel = 8'b00000000;  //자릿수
    
    always @(*)
        begin
            case(BCD_code )
                0: seg_out = seg0 ;
                1: seg_out = seg1 ;
                2: seg_out = seg2 ;
                3: seg_out = seg3 ;
                4: seg_out = seg4 ;
                5: seg_out = seg5 ;
                6: seg_out = seg6 ;
                7: seg_out = seg7 ;
                8: seg_out = seg8 ;
                9: seg_out = seg9 ;
                default : seg_out =8'bx;
            endcase 
        end
endmodule 