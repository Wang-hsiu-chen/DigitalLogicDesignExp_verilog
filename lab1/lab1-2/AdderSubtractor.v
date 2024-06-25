module SignedAddSub(a, b, m, s, v, cout, c0);
input [3:0]a, b;
input m;
output [3:0]s;
output v;
output cout;
output c0;
reg [3:0]s;
reg [2:0]s0;
reg v;
reg cout;
reg c0;

always @* begin
    if (m == 1'b0) begin
        {cout, s} = a + b;
        {c0, s0} = a[2:0] + b[2:0]; 
        v = (c0 & ~cout) | (~c0 & cout);
    end
    else if (m == 1'b1) begin
        {cout, s} = a - b;
        {c0, s0} = a[2:0] - b[2:0]; 
        v = (c0 & ~cout) | (~c0 & cout);
    end
    else begin
        s = 4'b1111;
        v = 1'b1;
        cout = 1'b1;
    end
end
endmodule