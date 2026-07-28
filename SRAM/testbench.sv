//test bench of the sram 
module tb_SRAM();
//declaration of the ports
reg clk=0;
reg wr_en;
  reg [9:0] data_in;
  reg [9:0] address;
  wire [9:0] data_out ;
//dut instantaious by using the name based order.
  SRAM_design dut (.clk(clk),
                   .wr_en(wr_en),
                   .data_in(data_in),
                   .data_out(data_out),
                   .address(address));
//process
integer i;
integer j;
always #10 clk= ~clk;

//test case one
initial
begin
  $monitor("wr_en= %0d, address=%0d   , data_in=%0d   , data_out=%0d ",wr_en ,address,data_in,data_out,$time);
 wr_en=1;
 address=1;
 data_in=200;
#10;
 address=2;
 data_in=150;
#10
 address=4;
 data_in=45;
#10;
 address=50;
 data_in=35;
#10;
 wr_en=0;
 address=2; 
#10;
 address=4;
#10;
address=50;
#10;
address=120;
#10;
end
initial
 begin
  $dumpfile("dump.vcd");
  $dumpvars(0,tb_SRAM);
#20000;
$finish;
end
endmodule 



//third test case
   /*task randr();
    output reg [9:0] a;
     begin
      wr_en=1;
      for(i=0;i<=1023;i=i+1)
        begin
          @(negedge clk)
          address=i;
          data_in=i;
           a=data_in;
          $display("address= %0d , data_in= %0d, a = %0d ", address, data_in , a , $time );
        end
          end
  endtask
  task red_check();
    reg [7:0] a;
      begin
       wr_en=0;
        for(j=0;j<=1023;j=j+1)
           begin
             @(negedge clk)
             address=j;
              #1;
             $display("address=%0d,data_out=%0d", address, data_out);
             if(a!=data_out)
               $display("there is a bug");
           end
      end
  endtask*/
 /* task randwe_re();
    output reg [9:0] a;
        begin
          @(negedge clk)
             begin
            wr_en=1;
          data_in=$urandom();
               address=$urandom(5);
            a=data_in;
          $display("address=%0d , data_in=%0d,wr_en=%0d",address,data_in,wr_en,$time);
             end
          @(negedge clk)
            begin
            wr_en=0;
            address=$urandom(5);
              $display("data_out=%0d,address=%0d",data_out,address, $time);
              if(a==data_out)
            $display("there is no error ");
            end
         end
  endtask      */

/// second testcase
/* wr_en=1;
  for(i=0;i<=1023;i=i+1)
     begin
       address=i;
      data_in=i;
       $display("address=%0d , data_in=%0d ", address, data_in ,$time);
      #5;
     end
 #10;
 wr_en=0;
  for(j=0;j<=1023;j=j+1)
    begin
     address=j;
      $display("data_out=%0d , address=%0d ",data_out, address ,$time);
    #50;
  end
end
  reg[7:0] a;
 // randr(a);
 // red_check();
  repeat(100)// i kept 100 repeations but it is giving only 2 rpeations why?
   begin
  randwe_re(a);
   end
end
//another test case is to change the address location.how to do it ??????
initial
 begin
  $dumpfile("dump.vcd");
  $dumpvars(0,tb_SRAM);
#20000;
$finish;
end
endmodule */