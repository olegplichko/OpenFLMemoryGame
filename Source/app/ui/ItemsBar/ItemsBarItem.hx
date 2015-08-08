package app.ui.itemsBar;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;

/**
 * ...
 * @author mymindspam
 */

class ItemsBarItem extends Sprite
{
	private var itemName:String;
	private var hasEptyImage:Bool;
	private var image:Bitmap;
	private var image_empty:Bitmap;
	
	private var imagePath:String;
	private var image_emptyPath:String;
	private var isEmpty:Bool;
	public function new(_itemName:String,_hasEptyImage:Bool = false) 
	{
		super();
		hasEptyImage = _hasEptyImage;
		itemName = _itemName;
		initView();		
		setEmpty(false);
	}
	public function setEmpty(value:Bool):Void {
		if (isEmpty == value) return;
		isEmpty = value;
		image.visible = !isEmpty;
		image_empty.visible = isEmpty;
	}
	
	private function initView():Void
	{	
		imagePath = AppConstants.IMAGEPATH_BARS + "/" + itemName+"."+AppConstants.IMAGE_EXTENSION;
		image = new Bitmap(Assets.getBitmapData(imagePath));
		if (hasEptyImage) {
			image_emptyPath = AppConstants.IMAGEPATH_BARS + "/" + itemName+"_empty"+"."+AppConstants.IMAGE_EXTENSION;
			image_empty = new Bitmap(Assets.getBitmapData(image_emptyPath));
		}else {
			image_empty = new Bitmap();
		}
		
		this.addChild(image);
		this.addChild(image_empty);
	}
	
}