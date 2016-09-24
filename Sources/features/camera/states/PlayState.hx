package features.camera.states;

import features.camera.entities.Box;

import mokha.groups.Group;
import mokha.managers.input.KeyboardInputManager;
import mokha.Camera;
import mokha.Mokha;
import mokha.State;

import kha.graphics2.Graphics;
import kha.Color;

class PlayState extends State {
	var keyboard : KeyboardInputManager;
	var camera : Camera;
	var boxes : Group<Box>;
	var target : Box;

	override public function onCreate() : Void {
		super.onCreate();

		keyboard = KeyboardInputManager.get();

		camera = new Camera();

		boxes = new Group<Box>();
		for (i in 0...1000) {
			var x = Math.random() * Mokha.windowWidth * 2 - Mokha.windowWidth / 2;
			var y = Math.random() * Mokha.windowHeight * 2 - Mokha.windowHeight / 2;
			boxes.add(new Box(x, y));
		}

		target = new Box(500, 500);
		target.color = Color.Green;
		camera.target = target;
	}

	override public function onDestroy() : Void {
		super.onDestroy();
	}

	override public function update() : Void {
		super.update();

		if (keyboard.keysPressed.get("up")) {
			target.y -= 2;
		}
		if (keyboard.keysPressed.get("right")) {
			target.x += 2;
		}
		if (keyboard.keysPressed.get("down")) {
			target.y += 2;
		}
		if (keyboard.keysPressed.get("left")) {
			target.x -= 2;
		}
		
		camera.update();
		boxes.update();
		target.update();
	}

	override public function draw(g : Graphics) : Void {
		super.draw(g);

		camera.draw(g);
		boxes.draw(g);
		target.draw(g);
	}
}