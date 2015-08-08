package app;
import app.cards.Card;
import app.cards.CardsField;
import app.ui.PlayerPanel;
import openfl.events.Event;
import openfl.display.Sprite;
import ru.mymindspam.nme.layout.Layout;


/**
 * ...
 * @author mymindspam
 */

class Game extends Sprite
{
	inline public static var GAME_OVER:String = "gameGameOver";
	inline public static var GAME_WIN:String = "gameGameWin";
	
	//cards
	private var cardsAmount:Int;
	private var cards:Array<Card>;
	private var cardsField:CardsField;
	
	//player props
	private var hp:Int;
	private var score:Int;
	//ui
	private var playerPanel:PlayerPanel;
	
	
	public function new() 
	{
		super();
		//reset
		hp = AppConstants.DEF_HP;
		score = 0;
		
		initUi();
		cardsAmount = AppConstants.CARD_TYPES.length * 2;
		initCards();
		
		updatePlayerPanel();
		//this.addChild(new Card());
	}	
	public function reset():Void {
		hp = AppConstants.DEF_HP;
		score = 0;
		updatePlayerPanel();
		resetCards();
	}
	
	
	
	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	//private methods >>>>>>>>>>>>>>>>
	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	private function initUi():Void 
	{
		playerPanel = new PlayerPanel();
		this.addChild(playerPanel);
		//playerPanel.x = AppConstants.STAGE_WIDTH - 200;
		trace("playerPanel", playerPanel.width);
		Layout.right(playerPanel, 10,140,AppConstants.STAGE_WIDTH);
	}
	private function updatePlayerPanel():Void 
	{
		playerPanel.setHp(hp);
		playerPanel.setScore(score);
	}
	private function initCards():Void
	{
		//container
		cardsField =  new CardsField(cardsAmount,AppConstants.CARDS_IN_ROW);
		this.addChild(cardsField);
		cardsField.addEventListener(CardsField.SUCCESS_PICK, successPickHandler);
		cardsField.addEventListener(CardsField.FAIL_PICK, failPickHandler);
		
		//cards
		cards = new Array<Card>();
		var n:Int = cardsAmount;
		var card:Card;
		var i:Int = 0;
		var typeIndex:Int;
		for (i in 0...n) {
			card = new Card();			
			typeIndex = Math.round((i + 1) * 0.5) - 1;		
			card.setType(AppConstants.CARD_TYPES[typeIndex]);
			cards.push(card);			
		}
		//shuffle
		cards = Utils.shuffleArray(cards);
		//add to field
		cardsField.addElements(cards);	
	}
		
	private function resetCards():Void 
	{
		var i:Int = 0;
		for (i in 0...cardsAmount) {
			cards[i].disable(false);
		}
		//shuffle
		cards = Utils.shuffleArray(cards);
		cardsField.reset();
		cardsField.addElements(cards);		
	}
	private function failPickHandler(e:Event):Void 
	{
		hp--;
		if (hp == 0) {
			dispatchEvent(new Event(GAME_OVER));
		}
		updatePlayerPanel();
	}
	
	private function successPickHandler(e:Event):Void 
	{
		score++;
		if (score == AppConstants.CARD_TYPES.length) {
			dispatchEvent(new Event(GAME_WIN));
		}			
		updatePlayerPanel();
	}
	
}