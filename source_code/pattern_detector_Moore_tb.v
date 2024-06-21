module pattern_detector_Moore_tb;
    reg clk;
    reg restn;
    reg in;
    wire out;

    // generate clock time period = 20ns (frequency = 50MHz)
    always #10 clk = ~clk;
    
    // instantiate the design and connect signals in tb
    pattern_detector_Moore inst(
        .clk(clk),
        .restn(restn),
        .in(in),
        .out(out)
    );

    // drive the stimulus to the design
    initial begin
        // initialize variable th default values at time 0 
        clk <= 0;
        restn <= 0;
        in <= 0;

        // for 5 clocks, deassert reset
        repeat(5) @(posedge clk);
        restn <= 1;

        @(posedge clk)
        in <= 1;

        @(posedge clk)
        in <= 1;

        @(posedge clk)
        in <= 0;

        @(posedge clk)
        in <= 1;

        @(posedge clk)
        in <= 0;

        @(posedge clk)
        in <= 1;

        @(posedge clk)
        in <= 1;

        @(posedge clk)
        in <= 1;

        @(posedge clk)
        in <= 0;

        @(posedge clk)
        in <= 1;

        @(posedge clk)
        in <= 0;

        @(posedge clk)
        in <= 1;

        #100
        $finish;
    end

endmodule