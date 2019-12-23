module game_renderer;

import derelict.sdl2.sdl;

import game_data;

import game_board;

class GameRenderer {

    private SDL_Renderer* m_renderer;

    // Render no more than 60 times a second.
    private const int m_frame_delay = 1000/60;

    // The size, in pixels, of the padding around the game board.
    private const int padding       = 25;
    
    private int m_cell_width;
    private int m_cell_height;

    private int frameStart;

    this(SDL_Renderer *sdlRenderer) {
        m_renderer = sdlRenderer;
    }

    private void drawBoardCells(GameData gameData) {

        // The width and height of the game board cells.
        m_cell_width  = (gameData.width  - (2 * padding)) / 8;
        m_cell_height = (gameData.height - (2 * padding)) / 8;

        SDL_SetRenderDrawColor(m_renderer, 36,127,67, 255);
        
        foreach(row; 0 .. 7) {
            foreach(col; 0 .. 7) {

                // Draw a vertical line for this column of the 
                // game board.
                SDL_RenderDrawLine(
                    m_renderer,
                    padding + (m_cell_width * (col + 1)),
                    padding,
                    padding + (m_cell_width * (col + 1)),
                    gameData.height - padding
                );       
            }

            // Draw a horizontal line for this row of the game board.
            SDL_RenderDrawLine(
                m_renderer,
                padding,
                padding        + (m_cell_height * (row + 1)),
                gameData.width - padding,
                padding        + (m_cell_height * (row + 1))
            );
        }
    }

    private void drawBoardFrame(GameData gameData) {
        SDL_SetRenderDrawColor(m_renderer, 36,127, 67, 255);

        // Draw the left border of the game board frame.
        SDL_RenderDrawLine(
            m_renderer,
            padding,
            0,
            padding,
            gameData.height
        );

        // Draw the right border of the game board frame.
        SDL_RenderDrawLine(
            m_renderer,
            gameData.width - padding,
            0,
            gameData.width - padding,
            gameData.height
        );

        // Draw the top border of the game board frame.
        SDL_RenderDrawLine(
            m_renderer,
            0,
            padding,
            gameData.width,
            padding
        
        );

        // Draw the bottom border of the game board frame.
        SDL_RenderDrawLine(
            m_renderer,
            0,
            gameData.height - padding,
            gameData.width,
            gameData.height - padding

        );
       
    }
    private void drawBoard(GameData gameData) {

        m_cell_width  = (gameData.width  - (2 * padding)) / 8;
        m_cell_height = (gameData.height - (2 * padding)) / 8;

        frameStart = SDL_GetTicks();

        SDL_SetRenderDrawColor(m_renderer, 0, 0, 0, 255);
        SDL_RenderClear(m_renderer);
        
        SDL_Rect rect;
        rect.h = gameData.height - (2 * padding);
        rect.w = gameData.width  - (2 * padding);
        rect.x = padding;
        rect.y = padding;

       SDL_SetRenderDrawColor(m_renderer,0, 54, 18, 255);
       SDL_RenderFillRect(m_renderer, &rect);
    }

    void drawGamePiece(GameData gameData, int row, int col) {
       SDL_Rect rect;

        rect.h = m_cell_height / 2;
        rect.w = m_cell_width  / 2;

        rect.x = padding + (m_cell_width * col)  + m_cell_width / 4;
        rect.y = padding + (m_cell_height * row) + m_cell_height / 4;

       switch(gameData.gameBoard.get(row, col)) {
           case CellState.WHITE:
               SDL_SetRenderDrawColor(m_renderer, 255,255,255,255);
               break;
           case CellState.BLACK:
               SDL_SetRenderDrawColor(m_renderer, 0,0,0,255);
               break;
           default:
               return;
       }

       SDL_RenderFillRect(m_renderer, &rect);               
    }

    void drawGamePieces(GameData gameData) {
        foreach(row; 0 .. 8) {
            foreach(col; 0 .. 8) {
                drawGamePiece(gameData, row, col);
            }
        }
    }

    void draw(GameData gameData) {
        drawBoard(gameData);
        drawBoardCells(gameData);
        drawGamePieces(gameData);
        drawBoardFrame(gameData);

        SDL_RenderPresent(m_renderer);

        auto frameTime = SDL_GetTicks() - frameStart;

        if (m_frame_delay > frameTime) {
            SDL_Delay(m_frame_delay - frameTime);
        }

    }
}