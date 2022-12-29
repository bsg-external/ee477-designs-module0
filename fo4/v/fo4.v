//  FO4 Module -- Students should implement the FO4 circuit that they see in
//  the Module 0 handout. Note that we already have a 2-input OR gate
//  instantiated in this design. This both serves as an example of how a gate
//  is instantiated as well as implements a reset which allows us to put the
//  ring oscillator into a known state for digital simulations.
//
//  First, you must figure out what logic gates are available to us in the
//  standard cell library. The best place to figure this out is the liberty
//  file which can be found at:
//
//      <SKY130_ROOT>/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib
//
//  Open this file above to see the gates available in this cell library. This
//  will be helpful to figure out the names of the gates as well as the name of
//  the pins for the gates. Using this information you can instantiate the
//  cells you need for the circuit.
//
//  NOTE: This file is 100K lines, be sure to use the search function of your
//  text editor. Search for "cell " to find the each gate available in this
//  cell library. Under each cell definition, search for "pin " to find the
//  pins of the gate (you can ignore pg_pins, we do not need to work with
//  supply nets within this verilog file). Inside the pin definition will be
//  the "direction " to determine if it is an input or output of the gate.
//  Output pins will also have a "function " which is the boolean logic
//  expression for the gate.
//

module fo4
    ( input  wire reset_i       // reset input
    , output wire probe_in_o    // first output probe
    , output wire probe_out_o   // second output probe
    );

    // TODO: Implement the FO4 ring below! Make sure that:
    //    1. The ring ends at the B pin of the reset OR gate below.
    //    2. The ring begins with the X pin of the reset OR gate below.
    //    3. Connect the probe_in_o pin to the input of the inverter you want
    //       to measure the propgation delay through. (NOTE: you should choose
    //       an inverter several stages away from the reset gate, so the fo4
    //       will not be influenced by it.)
    //    4. Connect the probe_out_o pin to the output of the inverter you want
    //       to measure the propgation delay through.

    // Reset Gate (DO NOT REMOVE OR RENAME)
    sky130_fd_sc_hd__or2_1
    reset
        (.A(reset_i)
        ,.B(/* TODO: SET ME */)
        ,.X(/* TODO: SET ME */)
        );

endmodule

