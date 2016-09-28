package features.ui;

import mokha.managers.input.KeyboardInputManager;
import mokha.ui.TextInput;
import mokha.ui.TextArea;
import mokha.ui.Text;
import mokha.Mokha;
import mokha.State;

import kha.graphics2.Graphics;
import kha.Assets;
import kha.Color;

class UiState extends State {
	var keys : KeyboardInputManager;
	var tLabel : Text;
	var taDescription : TextArea;
	var tiInputAll : TextInput;
	var tiInputNumbers : TextInput;

	override public function onCreate() : Void {
		super.onCreate();

		keys = KeyboardInputManager.get();

		tLabel = new Text("This is a text label.", Assets.fonts.slkscr, 32);

		taDescription = new TextArea(200, 100, Assets.fonts.slkscr, 20);
		taDescription.backgroundColor = Color.Blue;
		taDescription.value = "This is a text area.\n\nText might not fit in entirely. In that case it is clipped.";
		taDescription.setCenterPosition(Mokha.renderWidth / 2, Mokha.renderHeight / 2);

		tiInputAll = new TextInput(Assets.fonts.slkscr, 32);
		tiInputAll.setPosition(0, Mokha.renderHeight - 64);
		
		tiInputNumbers = new TextInput(Assets.fonts.slkscr, 32);
		tiInputNumbers.setPosition(0, Mokha.renderHeight - 32);
		tiInputNumbers.rule = ~/[0-9]/;
	}

	override public function update() : Void {
		super.update();

		tiInputAll.handleInput(keys);
		tiInputNumbers.handleInput(keys);

		tLabel.update();
		taDescription.update();
		tiInputAll.update();
		tiInputNumbers.update();
	}

	override public function draw(g : Graphics) : Void {
		super.draw(g);

		tLabel.draw(g);
		taDescription.draw(g);
		tiInputAll.draw(g);
		tiInputNumbers.draw(g);
	}
}