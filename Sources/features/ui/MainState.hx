package features.ui;

import mokha.managers.input.KeyboardInputManager;
import mokha.ui.BitmapFont;
import mokha.ui.BitmapText;
import mokha.ui.TextInput;
import mokha.ui.TextArea;
import mokha.ui.Text;
import mokha.Mokha;
import mokha.State;

import kha.Assets;
import kha.Color;

class MainState extends State {
	var keys : KeyboardInputManager;

	var tiInputAll : TextInput;
	var tiInputNumbers : TextInput;

	override public function onCreate() : Void {
		super.onCreate();

		keys = KeyboardInputManager.get();

		var tLabel = new Text("This is a text label. Try typing letters and numbers.", Assets.fonts.slkscr, 16);
		add(tLabel);

		tiInputAll = new TextInput(Assets.fonts.slkscr, 16);
		tiInputAll.body.setPosition(0, 32);
		add(tiInputAll);
		
		tiInputNumbers = new TextInput(Assets.fonts.slkscr, 16);
		tiInputNumbers.body.setPosition(0, 48);
		tiInputNumbers.rule = ~/[0-9]/;
		add(tiInputNumbers);

		var taDescription = new TextArea(200, 100, Assets.fonts.slkscr, 16);
		taDescription.backgroundColor = Color.Blue;
		taDescription.value = "This is a text area.\n\nText might not fit in entirely. In that case it is clipped.";
		taDescription.body.setCentroid(Mokha.renderWidth / 2, Mokha.renderHeight / 2);
		add(taDescription);

		var bfFont = new BitmapFont(Assets.images.mokhafont, 8, 8, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:;_-!\"#$%&/()=?+*×' ");
		var btText = new BitmapText("THIS TEXT IS RENDERED IN A BITMAP FONT, BELIEVE IT OR NOT!", bfFont);
		btText.body.setPosition(0, 100);
		add(btText);
	}

	override public function update() : Void {
		super.update();

		tiInputAll.handleInput(keys);
		tiInputNumbers.handleInput(keys);
	}
}
