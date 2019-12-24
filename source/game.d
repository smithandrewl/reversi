module game;

import game_renderer;
import game_data;
import std.stdio: stdout;

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

    void leftClick(int x, int y) {
        stdout.writefln("Left click at screen pos (%d, %d)", x, y);

    }
}