module game_board;

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

        for (int i=0; i < 8; i++){
            for (int j = 0; j < 8; j++) {
                if(j % 2 == 0) {
                    if(j% 4 == 0) {
                        m_cells[i][j] = CellState.FREE;
                    } else {
                        m_cells[i][j] = CellState.WHITE;
                    }
                } else {
                    if((i+1) % 3 == 0){
                        m_cells[i][j] = CellState.FREE;
                    } else {
                        m_cells[i][j] = CellState.BLACK;
                    }
                }
                
            }
        }
    }
}