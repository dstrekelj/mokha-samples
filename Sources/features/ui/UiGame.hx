package features.ui;

import mokha.managers.input.KeyboardInputManager;
import mokha.Game;

class UiGame extends Game {
	var keys : KeyboardInputManager;

	public function new() : Void {
		super({
			state: MainState
		});

		keys = KeyboardInputManager.get();
	}

	override public function update() : Void {
		super.update();
		
		keys.update();
	}
}
