package app;
import app.ui.SimplestNMEButton;
import openfl.events.Event;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

/**
 * ...
 * @author mymindspam
 */

class MainMenu extends Sprite
{
	inline public static var NEW_GAME:String = "mainMenuNewGame"; 
	
	private var newGameButton:SimplestNMEButton;
	public function new() 
	{
		super();
		initView();
	}
	
	private function initView() 
	{
		newGameButton = new SimplestNMEButton("buttonBg",AppConstants.MAIN_MENU_WIDTH,"Play");

		addChild(newGameButton);
		newGameButton.addEventListener(MouseEvent.CLICK, newGameClickHandler);
	}
	
	private function newGameClickHandler(e:MouseEvent):Void 
	{
		dispatchEvent(new Event(NEW_GAME));
	}
	
}