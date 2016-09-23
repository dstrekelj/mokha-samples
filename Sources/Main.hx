package;

import mokha.Engine;

class Main {
	static function main() {
		Engine.init(pong.PongGame, "Pong", 640, 480, 1 / 60);
	}
}
