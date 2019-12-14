module framework;

import std.stdio;

class Game {

}

class GameData {
    private int m_width;
    private int m_height;
    private bool m_game_over;

    this(int width, int height) {
        m_width = width;
        m_height = height;
        m_game_over = false;
    }

    int width() {
        return m_width;
    }

    int height() {
        return m_height;
    }

    bool isGameOver() {
        return m_game_over;
    }

    void isGameOver(bool status) {
        m_game_over = status;
    }
}

enum CellState {
    FREE,
    WHITE,
    BLACK
}

class GameBoard {
    private CellState[][] m_cells;

    CellState[][] cells() {
        return m_cells;
    }

    this() {
        m_cells = new CellState[][](8,8);

        for (int i=0; i < 8; i++){
            for (int j = 0; j < 8; j++) {
                m_cells[i][j] = CellState.FREE;
            }
        }
    }
}
