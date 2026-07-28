//to design an singlport SRAM which is size of 1KB
module SRAM_design (
    input clk,
    input wr_en, 
  input [9:0] data_in,
  output reg [9:0] data_out,
  input  [9:0] address      //previous design //[10:0] address
);
  reg [9:0] mem [1023:0];   //previous //[1023:0] locations

  always @(posedge clk)
begin
    if(wr_en)
        mem[address]<=data_in;
    else
       data_out<=mem[address];
end
endmodule