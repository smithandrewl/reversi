module game;

import game_renderer;
import game_data;

class Game {
    private GameData     m_gameData;
    private GameRenderer m_gameRenderer;

    this(GameData gameData, GameRenderer gameRenderer) {
        this.m_gameData     = gameData;
        this.m_gameRenderer = gameRenderer;
    }

    void update() { }

    void draw() {
        m_gameRenderer.draw(m_gameData);
    }
}