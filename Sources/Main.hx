package;

import mokha.Engine;

class Main {
	static function main() {
		Engine.init(games.pong.PongGame, "Pong", 640, 480, 1 / 60);
	}
}
