/**
 * BSG Chip -- Toplevel module. For this design, we are simply creating a
 *             wrapper for the fo4 module which is to be implemented by the
 *             students.
 */
module fo4_top
    ( input  wire reset_i
    , output wire probe_in_o
    , output wire probe_out_o
    );

    fo4 FO4 ( .* );

endmodule

