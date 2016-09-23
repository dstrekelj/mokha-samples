package pong.entities;

import pong.entities.Paddle;

import mokha.shapes.Rectangle;
import mokha.Entity;
import mokha.Mokha;

import kha.math.FastVector2;
import kha.graphics2.Graphics;
import kha.Color;

class Ball extends Entity {
	static inline var VELOCITY_DEF : Float = 4.0;
	static inline var VELOCITY_INC : Float = 0.5;
	static inline var VELOCITY_MAX : Float = 16.0;

	public var bounds : Rectangle;

	var direction : FastVector2;
	var velocity : Float;

	public function new() : Void {
		super(0, 0, 16, 16);

		this.bounds = new Rectangle(0, 0, Mokha.renderWidth, Mokha.renderHeight);
		
		this.direction = new FastVector2(0, 0);
		this.velocity = VELOCITY_DEF;
	}

	override public function update() : Void {
		super.update();

		this.move();

		if (this.direction.x > 0 && this.x > Mokha.renderWidth / 2 || this.direction.x < 0 && this.x < Mokha.renderWidth / 2) {
			this.isCollideable = true;
		}

		if (this.y < this.bounds.y) {
			this.y = this.bounds.y;
			this.directTo(this.direction.x, -this.direction.y);
		}
		
		if (this.y + this.height > this.bounds.y + this.bounds.height) {
			this.y = this.bounds.y + this.bounds.height - this.height;
			this.directTo(this.direction.x, -this.direction.y);
		}

		if (!this.bounds.overlapsRectangle(this.hitbox)) {
			this.kill();
		}
	}

	override public function draw(g : Graphics) : Void {
		super.draw(g);

		g.color = Color.Yellow;
		g.fillRect(this.x, this.y, this.width, this.height);
		g.color = Color.White;
	}

	override public function destroy() : Void {
		super.destroy();
		
		this.bounds = null;
	}

	override public function revive() : Void {
		super.revive();
		this.velocity = VELOCITY_DEF;
	}

	public function directTo(x : Float, y : Float) : Void {
		this.direction.x = x;
		this.direction.y = y;
		this.direction.normalize();
	}

	public function handlePaddleCollision(p : Paddle) : Void {
		if (p.dy > 0) {
			this.directTo(-this.direction.x, 1);
		} else if (p.dy < 0) {
			this.directTo(-this.direction.x, -1);
		} else {
			this.directTo(-this.direction.x, 0);
		} 

		if (this.velocity < VELOCITY_MAX) {
			this.velocity += VELOCITY_INC;
		}

		this.isCollideable = false;
	}

	function move() : Void {
		this.x += this.direction.x * this.velocity;
		this.y += this.direction.y * this.velocity;
	}
}