module game_data;

import game_board;

class GameData {
    private GameBoard m_gameBoard;
    private int  m_width;
    private int  m_height;
    private bool m_game_over;

    this(int width, int height) {
        m_width     = width;
        m_height    = height;
        m_game_over = false;
        m_gameBoard = new GameBoard();
    }

    GameBoard gameBoard() {
        return m_gameBoard;
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