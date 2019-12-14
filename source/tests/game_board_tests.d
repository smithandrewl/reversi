module game_board_tests;

import std.stdio;
import dunit.toolkit;
import std.conv;

import framework;
unittest {
    GameData gameData = new GameData(800, 600);
    800.assertEqual(gameData.width, "Width accessor returned " ~ to!string(gameData.width) ~ " instead of 800");
    600.assertEqual(gameData.height, "Height accessor returned " ~ to!string(gameData.height) ~ " instead of 600");
}