module GameBoardTests;

import std.stdio;
import dunit.toolkit;

unittest {

    printf("d should end with d\n");

    "d".assertEndsWith("d");
}

unittest {
    printf("e should end with d\n");

    "e".assertEndsWith("d");
}