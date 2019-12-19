module game_data;

class GameData {
    private int  m_width;
    private int  m_height;
    private bool m_game_over;

    this(int width, int height) {
        m_width     = width;
        m_height    = height;
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