import std.stdio;

import derelict.sdl2.sdl;

import game;
import game_data;
import game_renderer;

import std.conv;

void main()
{
	DerelictSDL2.load();

	//  padding around image in pixels
	const int padding = 10;

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

	// Get the window surface
	SDL_Surface *winSurf = SDL_GetWindowSurface(appWin);

	GameRenderer gameRenderer = new GameRenderer(winSurf);

	Game game = new Game(
	gameData,
	gameRenderer
	);

	if (winSurf is null) {
		writeln("SDL_GetWindowSurface: ", SDL_GetError());
	}

	// Copy loaded image to window surface
	SDL_Rect dstRect;
	dstRect.x = padding;
	dstRect.y = padding;

	// Polling for events
	SDL_Event event;
	bool quit = false;

	while(!quit) {
		while (SDL_PollEvent(&event)) {
			if (event.type == SDL_QUIT) {
				quit = true;
			}

			if (event.type == SDL_KEYDOWN) {
				quit = true;
			}
		}


		game.update();
		game.draw();

		// Copy the window surface to the screen
		SDL_UpdateWindowSurface(appWin);
	}

	// Close and destroy the window
	if (appWin !is null) {
		SDL_DestroyWindow(appWin);
	}
	SDL_Quit();
}
