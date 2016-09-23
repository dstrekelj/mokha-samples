package pong.states;

import pong.entities.Ball;
import pong.entities.Paddle;

import mokha.managers.input.MouseInputManager;
import mokha.shapes.Rectangle;
import mokha.tools.collision.Collider;
import mokha.ui.Text;
import mokha.Mokha;
import mokha.State;

import kha.graphics2.Graphics;
import kha.Assets;
import kha.Color;

class PlayState extends State {
	var mouse : MouseInputManager;
	var bounds : Rectangle;
	var ball : Ball;
	var paddleL : Paddle;
	var paddleR : Paddle;
	var scoreL : Text;
	var scoreLValue : Int;
	var scoreR : Text;
	var scoreRValue : Int;

	override public function onCreate() : Void {
		super.onCreate();
		
		this.mouse = MouseInputManager.get();

		this.bounds = new Rectangle(0, 0, Mokha.renderWidth, Mokha.renderHeight);

		this.ball = new Ball();
		this.ball.bounds = bounds;
		this.ball.setCenterPosition(Mokha.renderWidth / 2, Mokha.renderHeight / 2);
		this.ball.directTo(1, 0);

		this.paddleL = new Paddle();
		this.paddleL.bounds = bounds;
		this.paddleL.setCenterPosition(Mokha.renderWidth / 10, Mokha.renderHeight / 2);

		this.paddleR = new Paddle();
		this.paddleR.bounds = bounds;
		this.paddleR.setCenterPosition(Mokha.renderWidth * 9 / 10, Mokha.renderHeight / 2);

		this.scoreLValue = 0;

		this.scoreL = new Text(Assets.fonts.slkscr, 128);
		this.scoreL.setValue(Std.string(scoreLValue));
		this.scoreL.foregroundColor = Color.fromValue(0xff444444);
		this.scoreL.setCenterPosition(Mokha.renderWidth * 1 / 4, Mokha.renderHeight / 2);

		this.scoreRValue = 0;

		this.scoreR = new Text(Assets.fonts.slkscr, 128);
		this.scoreR.setValue(Std.string(scoreRValue));
		this.scoreR.foregroundColor = Color.fromValue(0xff444444);
		this.scoreR.setCenterPosition(Mokha.renderWidth * 3 / 4, Mokha.renderHeight / 2);
	}

	override public function onDestroy() : Void {
		super.onDestroy();

		this.bounds = null;
		this.ball.destroy();
		this.paddleL.destroy();
		this.paddleR.destroy();
	}

	override public function update() : Void {
		super.update();

		trace(mouse.dy);

		this.paddleL.move(mouse.y, mouse.dy);
		this.paddleR.move(mouse.y, mouse.dy);

		this.paddleL.update();
		this.paddleR.update();
		this.ball.update();

		if (Collider.detectOverlap(this.ball, this.paddleL)) {
			this.ball.handlePaddleCollision(this.paddleL);
		}

		if (Collider.detectOverlap(this.ball, this.paddleR)) {
			this.ball.handlePaddleCollision(this.paddleR);
		}

		if (!this.ball.isActive) {
			if (this.ball.x < this.bounds.x) {
				this.scoreRValue += 1;
				this.scoreR.setValue(Std.string(scoreRValue));
				this.scoreR.setCenterPosition(Mokha.renderWidth * 3 / 4, Mokha.renderHeight / 2);
				this.ball.directTo(1, 0);
			}
			
			if (this.ball.x + this.ball.width > this.bounds.x + this.bounds.width) {
				this.scoreLValue += 1;
				this.scoreL.setValue(Std.string(scoreLValue));
				this.scoreL.setCenterPosition(Mokha.renderWidth * 1 / 4, Mokha.renderHeight / 2);
				this.ball.directTo(-1, 0);
			}
			
			this.ball.revive();
			this.ball.setCenterPosition(Mokha.renderWidth / 2, Mokha.renderHeight / 2);
		}
	}

	override public function draw(g : Graphics) : Void {
		super.draw(g);

		this.scoreL.draw(g);
		this.scoreR.draw(g);

		this.paddleL.draw(g);
		this.paddleR.draw(g);
		this.ball.draw(g);
	}
}