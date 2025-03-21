/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module x_bit_left_shifter #(
        parameter SHIFT = 4'h8
    ) (
        input wire [31:0] a,
        input wire shift,
        input wire pad,
        output reg [31:0] out
    );
    logic [31:0] R_14181df4_i;
    logic [31:0] RR_14181df4_i;
    logic [31:0] R_6fe0c40c_i;
    logic [31:0] RR_6fe0c40c_i;
    logic [31:0] M_mux_2_32_s0;
    logic [31:0][1:0] M_mux_2_32_in;
    logic [31:0] M_mux_2_32_out;
    
    genvar idx_0_1634244283;
    
    generate
        for (idx_0_1634244283 = 0; idx_0_1634244283 < 32; idx_0_1634244283 = idx_0_1634244283 + 1) begin: forLoop_idx_0_1634244283
            mux_2 mux_2_32 (
                .s0(M_mux_2_32_s0[idx_0_1634244283]),
                .in(M_mux_2_32_in[idx_0_1634244283]),
                .out(M_mux_2_32_out[idx_0_1634244283])
            );
        end
    endgenerate
    
    
    logic [31:0] shifted_bits;
    always @* begin
        shifted_bits = {a[5'h1f - SHIFT:1'h0], {SHIFT{pad}}};
        M_mux_2_32_s0 = {6'h20{shift}};
        for (RR_14181df4_i = 0; RR_14181df4_i < 6'h20; RR_14181df4_i = RR_14181df4_i + 1) begin
      R_14181df4_i = (1'h0) + RR_14181df4_i * (1'h1);
            M_mux_2_32_in[R_14181df4_i][1'h0] = a[R_14181df4_i];
            M_mux_2_32_in[R_14181df4_i][1'h1] = shifted_bits[R_14181df4_i];
        end
        for (RR_6fe0c40c_i = 0; RR_6fe0c40c_i < 6'h20; RR_6fe0c40c_i = RR_6fe0c40c_i + 1) begin
      R_6fe0c40c_i = (0) + RR_6fe0c40c_i * (1);
            out[R_6fe0c40c_i] = M_mux_2_32_out[R_6fe0c40c_i];
        end
    end
    
    
endmodule