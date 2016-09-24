package features.camera;

import features.camera.states.PlayState;

import mokha.Game;
import mokha.Mokha;

class CameraGame extends Game {
	public function new() : Void {
		super(Mokha.windowWidth, Mokha.windowHeight, PlayState);
	}
}