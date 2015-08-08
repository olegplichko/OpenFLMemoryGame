package app;
import openfl.events.Event;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.Assets;

/**
 * ...
 * @author mymindspam
 */

class MainStage extends Sprite
{
	private var game:Game;
	private var mainMenu:MainMenu;
	private var isFirstGame:Bool;
	private var winScore:Int;
	private var loseScore:Int;
	
	private var bgImage:Bitmap;
	
	private var winLoseLabel:TextField;
	public function new() 
	{
		super();
		//bgImage
		bgImage = new Bitmap(Assets.getBitmapData("assets/ui/mainMenuBg.png"));
		addChild(bgImage);
		
		//reset
		isFirstGame = true;
		
		//main menu
		mainMenu =  new MainMenu();
		this.addChild(mainMenu);
		mainMenu.y = 100;
		mainMenu.x = AppConstants.STAGE_WIDTH*0.5-AppConstants.MAIN_MENU_WIDTH*0.5;
		mainMenu.addEventListener(MainMenu.NEW_GAME, newGameHandler);
		
		//game
		game =  new Game();	
		game.x = 5;
		game.y = 5;
		this.addChild(game);		
		game.visible = false;
		game.addEventListener(Game.GAME_OVER, gameOverHandler);
		game.addEventListener(Game.GAME_WIN, gameWinHandler);
		
		//winLose
		winScore = 0;
		loseScore = 0;
		winLoseLabel = new TextField();
		winLoseLabel.x = AppConstants.STAGE_WIDTH - 120;
		winLoseLabel.y = AppConstants.STAGE_HEIGHT - 30;
		addChild(winLoseLabel);
		updateScorePanel();
		
	}	
	
	private function gameWinHandler(e:Event):Void 
	{
		game.visible = false;
		mainMenu.visible = true;
		winScore++;
		updateScorePanel();
	}
	
	private function updateScorePanel():Void 
	{
		winLoseLabel.text = "wins: " + winScore + " " + "losses: " + loseScore;
	}
	
	private function gameOverHandler(e:Event):Void 
	{
		game.visible = false;
		mainMenu.visible = true;
		loseScore++;
		updateScorePanel();
	}
	
	private function newGameHandler(e:Event):Void 
	{
		game.visible = true;
		mainMenu.visible = false;
		//reset
		if (!isFirstGame) {
			game.reset();
		}else {
			isFirstGame = false;
		}
	}
}