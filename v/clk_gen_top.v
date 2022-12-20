/**
 * BSG Chip -- Toplevel module. For this design, we are simply
 *             creating a wrapper for the fo4 module which is to
 *             be implemented by the students.
 */
module clk_gen_top
  ( input       reset_i
  , input [3:0] select_i
  , output      clk_o
  );

  clk_gen CG ( .* );

endmodule

