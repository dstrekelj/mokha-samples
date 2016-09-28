package features.ui;

import mokha.Game;
import mokha.Mokha;

class UiFeature extends Game {
	public function new() : Void {
		super(Mokha.windowWidth, Mokha.windowHeight, features.ui.UiState);
	}
}