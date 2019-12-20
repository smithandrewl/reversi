module game_renderer;

import derelict.sdl2.sdl;
import game_data;

class GameRenderer {

    private SDL_Surface* m_sdlSurface;
    private int m_colour;

    this(SDL_Surface * sdlSurface) {
        m_sdlSurface = sdlSurface;

        // Define a colour for the surface, based on RGB values
        m_colour = SDL_MapRGB(sdlSurface.format, 0x00, 0x00, 0x00);
    }
    void draw(GameData gameData) {
        // Fill the window surface with the colour
        SDL_FillRect(m_sdlSurface, null, m_colour);
    }
}