module generator_LFSR_64bit #(
    parameter integer clk_n = 8
)(
    input wire i_clk,
    input wire i_rst,
    input wire [63:0] i_seed,
    output wire [63:0] o_lfsr,
    output wire o_keystream
);

wire lck_reg;
wire [63:0] lfsr_reg;
wire keystream_reg;

Division_clock #(.n(clk_n)) DIV (
    .i_clk(i_clk),
    .o_clk(lck_reg)
);

LFSR_64bit lfsr_64bit (
    .i_clk(lck_reg),
    .i_reset(i_rst),
    .i_seed(i_seed),
    .o_lfsr(lfsr_reg),
    .o_keystream(keystream_reg)
);

assign o_lfsr = lfsr_reg;
assign o_keystream = keystream_reg;

endmodule