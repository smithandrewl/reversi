import std.stdio;

import derelict.sdl2.sdl;

import game;
import game_data;
import game_renderer;

import std.conv;

void main()
{
	DerelictSDL2.load();

	// Initialise SDL
	if (SDL_Init(SDL_INIT_VIDEO) != 0) {
		writeln("SDL_Init: ", SDL_GetError());
	}

	GameData gameData = new GameData(800, 600);

	// Create a window
	SDL_Window* appWin = SDL_CreateWindow(
		"Reversi",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		gameData.width,
		gameData.height,
		SDL_WINDOW_OPENGL
	);

	if (appWin is null) {
		writefln("SDL_CreateWindow: ", SDL_GetError());
		return;
	}

	/* Create a Render */
    SDL_Renderer *render = SDL_CreateRenderer(appWin, -1, SDL_RENDERER_ACCELERATED );
    if (render is null) {
        writefln("SDL_CreateRenderer Error: ", SDL_GetError());
    }

	GameRenderer gameRenderer = new GameRenderer(render);

	Game game = new Game(
		gameData,
		gameRenderer
	);

	// Polling for events
	SDL_Event event;
	bool quit = false;

	while(!quit) {
		while (SDL_PollEvent(&event)) {
			if (event.type == SDL_QUIT) {
				quit = true;
			}
		}

		game.update();
		game.draw();
	}

	// Close and destroy the window
	if (appWin !is null) {
		SDL_DestroyWindow(appWin);
	}

	SDL_Quit();
}
