package;

import mokha.Engine;

class Main {
	static function main() {
		Engine.init(features.camera.CameraGame, "Pong", 640, 480, 1 / 60);
	}
}
