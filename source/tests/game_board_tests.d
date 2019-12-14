module game_board_tests;

import std.stdio;
import dunit.toolkit;

unittest {
    "d".assertEndsWith("d", "d should end with d");
}

unittest {
    "e".assertEndsWith("d","e should end with d");
}