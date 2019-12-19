module framework;

import std.stdio;

import derelict.sdl2.sdl;

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

    CellState get(int row, int col) {
        return m_cells[row][col];
    }

    void set(int row, int col, CellState value) {
        m_cells[row][col] = value;
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

class GameRenderer {
    private SDL_Surface* m_sdlSurface;
    this(SDL_Surface * sdlSurface) {
        m_sdlSurface = sdlSurface;
    }
    void draw(GameData gameData) {
    }


}

class Game {
    private GameData m_gameData;
    private GameRenderer m_gameRenderer;

    this(GameData gameData, GameRenderer gameRenderer) {
        this.m_gameData = gameData;
        this.m_gameRenderer = gameRenderer;
    }

    void update() {

    }

    void draw() {
        m_gameRenderer.draw(m_gameData);
    }
}