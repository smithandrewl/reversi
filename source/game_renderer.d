module game_renderer;

import derelict.sdl2.sdl;
import game_data;

class GameRenderer {
    private SDL_Surface* m_sdlSurface;

    this(SDL_Surface * sdlSurface) {
        m_sdlSurface = sdlSurface;
    }
    void draw(GameData gameData) { }
}