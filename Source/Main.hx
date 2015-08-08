package;


import openfl.display.Sprite;
import app.MainStage;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		var mainStage:MainStage = new MainStage();
		
		addChild(mainStage);
		
	}
	
	
}