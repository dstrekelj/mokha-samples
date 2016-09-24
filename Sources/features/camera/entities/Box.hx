package features.camera.entities;

import mokha.Entity;

import kha.graphics2.Graphics;
import kha.Color;

class Box extends Entity {
	public var color : Color;

	public function new(x : Float, y : Float) : Void {
		super(0, 0, 16, 16);
		
		setCenterPosition(x, y);
		color = Color.Red;
	}

	override public function draw(g : Graphics) : Void {
		super.draw(g);

		g.color = color;
		g.fillRect(x, y, width, height);
		g.color = Color.White;
	}
}