package app.ui;
import app.ui.itemsBar.ItemsBar;
import openfl.display.Sprite;


/**
 * ...
 * @author mymindspam
 */

class PlayerPanel extends Sprite
{
	//char props
	private var hp:Int;
	private var score:Int;
	
	private var hpBar:ItemsBar;
	private var scoreBar:ItemsBar;
	public function new() 
	{
		super();
		initView();
	}
	
	public function setScore(value:Int):Void {
		scoreBar.setValue(value);
	}
	public function setHp(value:Int):Void {
		hpBar.setValue(value);
	}
	
	private function initView() 
	{
		//hp
		hpBar =  new ItemsBar("heart", 3, 16, 3);
		this.addChild(hpBar);
		//score
		scoreBar =  new ItemsBar("star", AppConstants.CARD_TYPES.length, 16, 3);
		this.addChild(scoreBar);
		scoreBar.y = 20;
	}
	
}