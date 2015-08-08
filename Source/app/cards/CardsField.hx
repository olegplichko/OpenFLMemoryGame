package app.cards;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.events.MouseEvent;

/**
 * ...
 * @author mymindspam
 */

class CardsField extends Sprite
{
	inline public static var SUCCESS_PICK:String = "cardsFieldSuccess";
	inline public static var FAIL_PICK:String = "cardsFieldFail";
	
	private var points:Array<Point>;
	private var amount:Int;
	private var inRow:Int;
	
	private var index:Int;
	
	//choose cards
	private var isSuccessPick:Bool;
	private var firstFliped:Card;
	private var secondFliped:Card;
	private var showTimer:Int;
	private var isDisable:Bool;
	private var isShowTimering:Bool;
	
	public function new(_amount:Int, _inRow:Int) 
	{
		super();
		amount = _amount;
		inRow = _inRow;		
		initPoints();
		//reset
		index = 0;
		showTimer = 0;
		isDisable = false;
		isSuccessPick = false;
	}
	
	public function addElement(value:Card):Void {
		addChild(value);
		value.x = points[index].x;
		value.y = points[index].y;
		addHandler(value);
		index++;
	}
	public function addElements(value:Array<Card>):Void {
		trace("addElements:");
		
		var n:Int = value.length;
		var i:Int = index;
		for (i in index...n) {
			
			addChild(value[i]);
			value[i].x = points[index].x;
			value[i].y = points[index].y;
			addHandler(value[i]);
			index++;
		}
	}
	public function reset():Void {
		//clear		
		var card:Card;
		while(this.numChildren!=0){
			card = cast(this.getChildAt(0),Card);
			card.cover.removeEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
			this.removeChild(card);
		}
		//remove handlers
		stage.removeEventListener(Event.ENTER_FRAME, showTimeHandler);
		//reset
		index = 0;
		showTimer = 0;
		isDisable = false;
		isSuccessPick = false;
	}
	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	//private methods >>>>>>>>>>>>>>>>
	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	private function addHandler(value:Card):Void
	{		
		value.mouseEnabled = true;
		value.cover.addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
	}
	
	private function clickHandler(e:MouseEvent):Void 
	{
		if (isDisable) {
			if (isShowTimering) {
				showTimer = 1;
			}
			return;
		}
		var card:Card = cast(e.target.parent, Card);
		trace("CLICK: " + card.getType());
		card.flip(true);
		
		if (firstFliped == null){
			firstFliped = card;	
		}else{
			secondFliped = card;
			if (firstFliped.getType() == secondFliped.getType()) {				
				isSuccessPick = true;
				startShowTimer();				
			}else {				
				startShowTimer();				
			}			
		}
	}
	
	private function startShowTimer(value:Bool=true):Void 
	{
		if(value){
			isDisable = true;
			isShowTimering = true;
			showTimer = AppConstants.CARDS_SHOW_TIME;
			stage.addEventListener(Event.ENTER_FRAME, showTimeHandler);
		}else {			
			showTimer = 0;
			isDisable = false;
			isShowTimering = false;
			stage.removeEventListener(Event.ENTER_FRAME, showTimeHandler);
		}
	}
	
	
	private function showTimeHandler(e:Event):Void 
	{
		showTimer--;
		if (showTimer == 0) {
			startShowTimer(false);
			if (isSuccessPick) {
				firstFliped.flip(false);
				secondFliped.flip(false);
				firstFliped.disable(true);
				secondFliped.disable(true);
				firstFliped = null;
				secondFliped = null;
				isSuccessPick = false;	
				dispatchEvent(new Event(SUCCESS_PICK));
			}
			if (secondFliped != null){
				firstFliped.flip(false);
				secondFliped.flip(false);
				firstFliped = null;
				secondFliped = null;
				dispatchEvent(new Event(FAIL_PICK));
			}
			
		}
	}
	
	private function initPoints():Void
	{
		points =  new Array<Point>();
		var i:Int = 0;
		var point:Point;
		var columnIndex:Int = 0;
		var rowIndex:Int = 0;
		for (i in 0...amount) {
			point = new Point();
			point.x = columnIndex*(AppConstants.CARD_WIDTH + AppConstants.CARD_SPACER);			
			point.y = rowIndex * (AppConstants.CARD_HEIGHT + AppConstants.CARD_SPACER);
			columnIndex++;
			if (columnIndex == inRow) {
				columnIndex = 0;
				rowIndex++;
			}
			points.push(point);			
		}
	}
	
}