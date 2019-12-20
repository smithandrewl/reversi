module game_renderer;

import derelict.sdl2.sdl;
import game_data;

class GameRenderer {

    private SDL_Renderer* m_renderer;

    private int m_frame_delay = 1000/60;
    private const int padding = 15;
    
    private int m_cell_width;
    private int m_cell_height;

    this(SDL_Renderer *sdlRenderer) {
        m_renderer = sdlRenderer;
    }
    void draw(GameData gameData) {

        m_cell_width = (gameData.width - (2 * padding)) / 8;
        m_cell_height = (gameData.height - (2 * padding)) / 8;

        auto frameStart = SDL_GetTicks();

        SDL_SetRenderDrawColor(m_renderer, 0, 0, 0, 255);
        SDL_RenderClear(m_renderer);
        
        SDL_Rect rect;
        rect.h = gameData.height - (2 * padding);
        rect.w = gameData.width - (2 * padding);
        rect.x = padding;
        rect.y = padding;

       SDL_SetRenderDrawColor(m_renderer, 11, 75, 11, 255);
       SDL_RenderFillRect(m_renderer, &rect);

        SDL_SetRenderDrawColor(m_renderer, 0,0,0, 255);
        for(int row = 0; row < 7; row ++) {
            for(int col = 0; col < 7; col ++) {
                SDL_RenderDrawLine(
                    m_renderer,
                    padding + (m_cell_width * (col + 1)),   //x1,
                    padding,//y1,
                    padding + (m_cell_width * (col + 1)),//x2,
                    gameData.height - padding//y2
                );       
            }

            SDL_RenderDrawLine(
                m_renderer,
                padding,
                padding + (m_cell_height * (row + 1)),
                gameData.width - padding,
                padding + (m_cell_height * (row + 1))
            );
        }

       SDL_RenderPresent(m_renderer);

       auto frameTime = SDL_GetTicks() - frameStart;

        if (m_frame_delay > frameTime) {
            SDL_Delay(m_frame_delay - frameTime);
        }

    }
}