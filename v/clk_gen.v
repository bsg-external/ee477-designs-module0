/**
 *  Clk Gen Module -- Students should implement their tunable clock generator
 *  circuit here! The input and output port list has been created for you. Do
 *  not modify the port list, this will break the rest of the lab :)
 *
 *  <SKY130_ROOT>/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
 *
 *  First open the .lib file above and select the standard cells you want to use.
 *
 *  <SKY130_ROOT>/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v
 *
 *  Then open the .v file above to see the behavioural verilog models for the 
 *  selected standard cells. This will be helpful to figure out the names of 
 *  the cells as well as the names of the input and output pins.
 */
module clk_gen
  ( input       reset_i
  , input [3:0] select_i
  , output      clk_o
  );

  // TODO: Implement the clock generator! Remeber your specs:
  //    1. Minimum Period of 25 FO4
  //    2. Maximum Period of 50 FO4
  //    3. 16 evenly spaced steps (use all 4 bits of select_i)
  //    4. We want a sharp output slew
  //    5. Must have a reset that stops the ring oscillator

  // Example cell instance (use this as the reset for the ring oscillator)
  sky130_fd_sc_hd__or2_1 Xreset(
      .A(reset_i)
    , .B() // TODO: connect to the end of the ring oscillator
    , .X() // TODO: connect to the start of the ring oscillator
  );


endmodule

