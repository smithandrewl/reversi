module game_renderer;

import derelict.sdl2.sdl;
import game_data;

class GameRenderer {

    private SDL_Renderer* m_renderer;
    private int m_colour;

    private int m_frame_delay = 1000/60;

    this(SDL_Renderer *sdlRenderer) {
        m_renderer = sdlRenderer;

        // Define a colour for the surface, based on RGB values
        //m_colour = SDL_MapRGB(sdlSurface.format, 0x00, 0x00, 0x00);
    }
    void draw(GameData gameData) {
        // Fill the window surface with the colour
        //SDL_FillRect(m_renderer, null, m_colour);

        auto frameStart = SDL_GetTicks();
        SDL_SetRenderDrawColor(m_renderer, 0, 0, 0, 255);
        SDL_RenderClear(m_renderer);
        SDL_Rect rect;
        rect.h = gameData.height - 30;
        rect.w = gameData.width - 30;
        rect.x = 15;
        rect.y = 15;

       SDL_SetRenderDrawColor(m_renderer, 11, 75, 11, 255);
       SDL_RenderFillRect(m_renderer, &rect);
       SDL_RenderPresent(m_renderer);

       auto frameTime = SDL_GetTicks() - frameStart;

        if (m_frame_delay > frameTime) {
            SDL_Delay(m_frame_delay - frameTime);
        }

    }
}