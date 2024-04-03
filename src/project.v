/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_rng_3_lucaz97 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

      approx approx_inst (
      .clk(clk),
      .rst_n(rst_n),
      .is_random_rsc_dat(uo_out[0]),
      .is_random_triosy_lz(),
      .valid_rsc_dat(uo_out[1]),
      .valid_triosy_lz(),
      .epsilon_rsc_dat(ui_in[0]),
      .epsilon_triosy_lz()
    );
    //    excursions excursions_inst (
    //   .clk(clk),
    //   .rst_n(rst_n),
    //   .is_random_rsc_dat(uo_out[2]),
    //   .is_random_triosy_lz(),
    //   .valid_rsc_dat(uo_out[3]),
    //   .valid_triosy_lz(),
    //   .epsilon_rsc_dat(ui_in[0]),
    //   .epsilon_triosy_lz()
    // );
  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[7:2] = 0;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

endmodule


// ------------------------------------------------------------------
//  Design Unit:    approx
// ------------------------------------------------------------------


module approx (
  clk, rst_n, is_random_rsc_dat, is_random_triosy_lz, valid_rsc_dat, valid_triosy_lz,
      epsilon_rsc_dat, epsilon_triosy_lz
);
  input clk;
  input rst_n;
  output is_random_rsc_dat;
  output is_random_triosy_lz;
  output valid_rsc_dat;
  output valid_triosy_lz;
  input epsilon_rsc_dat;
  output epsilon_triosy_lz;



  // Interconnect Declarations for Component Instantiations 
  approx_core approx_core_inst (
      .clk(clk),
      .rst_n(rst_n),
      .is_random_rsc_dat(is_random_rsc_dat),
      .is_random_triosy_lz(is_random_triosy_lz),
      .valid_rsc_dat(valid_rsc_dat),
      .valid_triosy_lz(valid_triosy_lz),
      .epsilon_rsc_dat(epsilon_rsc_dat),
      .epsilon_triosy_lz(epsilon_triosy_lz)
    );
endmodule
