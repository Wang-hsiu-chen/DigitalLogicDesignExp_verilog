module lab1_3(a, b, c, o);
input [2:0] a, b, c; //three input variables (2 bits signed num)
output [2:0] o; // minimum output (2 bits signed num)
reg [2:0] o;

always @* begin
    o = a;
    if (o[2] < b[2]) //a[2]==0, b[2]==1
        o = b;
    else if (o[2] > b[2]); //a[2]==1, b[2]==0
    else begin //a[2] == b[2]
        if (o[1:0] < b[1:0]);
        else
            o = b;
    end

    if (o[2] < c[2]) //b[2]==0, c[2]==1
        o = c;
    else if (o[2] > c[2]); //b[2]==1, c[2]==0
    else begin //b[2] == c[2]
        if (o[1:0] < c[1:0]);
        else
            o = c;
    end
end
endmodule