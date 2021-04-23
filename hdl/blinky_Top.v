
module blinky_Top
  (input wire  clk,
   output wire q);

   blinky #(.clk_freq_hz (100_000_000)) blinky
     (.clk (clk),
      .q   (q));

endmodule

