module game_board_tests;

import std.stdio;
import dunit.toolkit;
import std.conv;

import game;
import game_data;
import game_board;

unittest {
    GameData gameData = new GameData(800, 600);

    800.assertEqual(
        gameData.width,
        "Width accessor returned "
            ~ to!string(gameData.width)
            ~ " instead of 800"
    );

    600.assertEqual(
        gameData.height,
        "Height accessor returned "
            ~ to!string(gameData.height)
            ~ " instead of 600"
    );
}

unittest {
    GameData gameData = new GameData(800, 600);

    gameData.isGameOver.assertEqual(
        false,
        "The game was marked as being over just after construction"
    );
}

unittest {
    GameData gameData = new GameData(800, 600);

    gameData.isGameOver = true;

    gameData.isGameOver.assertEqual(
        true,
        "The game was marked as not being over after being set to over"
    );
}

unittest {
    GameBoard gameBoard = new GameBoard();

    bool correct = true;

    foreach(i; 0 .. 8) {
        if(!correct) {
            break;
        }

        foreach(j; 0 .. 8) {
            if(gameBoard.get(i, j) != CellState.FREE) {
                correct = false;
                break;
            }
        }
    }

    correct.assertEqual(
        true,
        "After initialization, the game board had non-free cells"
    );
}