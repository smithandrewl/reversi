module framework;

import std.stdio;

class Game {

}

class GameData {
    private int m_width;
    private int m_height;

    this(int width, int height) {
        m_width = width;
        m_height = height;
    }

    int width() {
        return m_width;
    }

    int height() {
        return m_height;
    }
}

enum CellState {
    FREE,
    WHITE,
    BLACK
}

class GameBoard {

}

class GameRenderer {

}

