// clk_gen_tb.v
//
// This file contains the toplevel testbench for testing
// this design: clk_gen_top
//

module clk_gen_tb;  

  /* Dump Test Waveform To VPD File */
  initial begin
    $vcdpluson;
    $vcdplusmemon;
  end

  /* Non-synth clock generator */
  logic clk;
  bsg_nonsynth_clock_gen #(1000) clk_gen_1 (clk);

  /* Device under test (DUT) */

  logic [3:0] dut_cfg;      /* TODO - MAKE THE CORRECT WIDTH */
  logic       dut_reset;
  logic       dut_clk;

  /* TODO - FIX ME TO MATCH YOUR DEVICE */
  clk_gen_top dut
    (.select_i(dut_cfg)
    ,.reset_i(dut_reset)
    ,.clk_o(dut_clk)
    );

  /* Reports Clock Period and Changes */
  bsg_nonsynth_clk_watcher #(.tolerance_p(0)) clk_watcher (.clk_i(dut_clk));

  /* Sequential steps to test the DUT */
  initial begin

    // Start in reset
    dut_reset = 1'b1;

    for (integer i = 0; i < 2**$bits(dut_cfg); i++) begin
        dut_cfg   = i;
        #1000
        $display("### START TESTING CONFIG %b", dut_cfg);
        dut_reset = 1'b0;
        for (integer j = 0; j < 25; j++) begin
            @(posedge dut_clk);
        end
        dut_reset = 1'b1;
        #1000
        $display("### FINISH TESTING CONFIG %b", dut_cfg);
    end

    $finish();

  end

endmodule
