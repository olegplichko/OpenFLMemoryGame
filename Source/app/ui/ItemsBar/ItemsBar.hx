package app.ui.itemsBar;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author mymindspam
 */

class ItemsBar extends Sprite
{
	private var amount:Int;
	private var items:Array<ItemsBarItem>;
	private var itemName:String;
	private var itemWidth:Float;
	private var spacer:Float;
	
	private var value:Int;
	public function new(_itemName:String,_amount:Int,_itemWidth:Float,_spacer:Float) 
	{
		super();
		itemName = _itemName;
		amount = _amount;
		itemWidth = _itemWidth;
		spacer = _spacer;
		//reset
		value = 0;
		initView();
	}
	public function setValue(_value:Int):Void {
		value = _value;
		var i:Int = 0;		
		for (i in 0...amount) {
			if (i < value) {
				items[i].setEmpty(false);
			}else {
				items[i].setEmpty(true);
			}
		}
	}
	
	private function initView():Void 
	{
		items =  new Array<ItemsBarItem>();
		var i:Int = 0;
		var item:ItemsBarItem;
		for (i in 0...amount) {
			item = initItem();
			items.push(item);
			item.x = i * (itemWidth + spacer);
			this.addChild(item);
		}
	}
	
	private function initItem():ItemsBarItem 
	{		
		var item:ItemsBarItem =  new ItemsBarItem(itemName,true);
		return item;
	}
	
}