package games.pong;

import games.pong.states.PlayState;

import mokha.Game;
import mokha.Mokha;

class PongGame extends Game {
	public function new() : Void {
		super(Mokha.windowWidth, Mokha.windowHeight, PlayState);
	}
}