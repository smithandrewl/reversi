module game_board;

import std.stdio;
import std.range : iota;
import std.algorithm;

public enum CellState {
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

        foreach (i; 0..8){
           m_cells[i].fill(CellState.FREE);
        }
    }
}