package pong.entities;

import mokha.shapes.Rectangle;
import mokha.Entity;
import mokha.Mokha;

import kha.graphics2.Graphics;
import kha.Color;

class Paddle extends Entity {
	public var bounds : Rectangle;
	public var dy : Int;

	public function new() : Void {
		super(0, 0, 16, 64);
		
		this.bounds = new Rectangle(0, 0, Mokha.renderWidth, Mokha.renderHeight);
	}

	override public function update() : Void {
		super.update();

		if (this.y < this.bounds.y) this.y = this.bounds.y;
		if (this.y + this.height > this.bounds.y + this.bounds.height) this.y = this.bounds.height - this.height;
	}

	override public function draw(g : Graphics) : Void {
		super.draw(g);
		g.color = Color.White;
		g.fillRect(this.x, this.y, this.width, this.height);
	}

	override public function destroy() : Void {
		super.destroy();

		this.bounds = null;
	}

	public function move(y : Float, dy : Int) : Void {
		this.y = y - this.height / 2;
		this.dy = dy;
	}
}