module game;

import game_renderer;
import game_data;
import std.stdio: stdout;
import game_board: CellState;

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

        int padding = 25;

        int m_cell_width  = (m_gameData.width  - (2 * padding)) / 8;
        int m_cell_height = (m_gameData.height - (2 * padding)) / 8;

        int cellX = (x - padding) / m_cell_width;
        int cellY = (y - padding) / m_cell_height;


        if(m_gameData.gameBoard.get(cellY, cellX) == CellState.FREE ) {
            m_gameData.gameBoard.set(cellY, cellX, CellState.WHITE);
        } else if(m_gameData.gameBoard.get(cellY, cellX) == CellState.WHITE) {
            m_gameData.gameBoard.set(cellY, cellX, CellState.BLACK);
        } else if(m_gameData.gameBoard.get(cellY, cellX) == CellState.BLACK) {
            m_gameData.gameBoard.set(cellY, cellX, CellState.FREE);
        }

    }
}