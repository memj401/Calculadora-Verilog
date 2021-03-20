module full_adder(
    output cout,
    output sum,
    input ain,
    input bin,
    input cin
    );


    
    assign sum = ain^bin^cin;
    assign cout = (ain&bin) | (ain&cin) | (bin&cin);
endmodule