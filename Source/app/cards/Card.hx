package app.cards;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;


/**
 * ...
 * @author mymindspam
 */

class Card extends Sprite
{
	private var isDisabled:Bool;
	//image
	private var image:Bitmap;
	private var imagePath:String;
	private var imageContainer:Sprite;

	//bgImage
	private var bgImage:Bitmap;
	
	//card backImage
	private var backImage:Bitmap;
	
	//fix card cover
	public var cover:Sprite;
	
	private var isFliped:Bool;
	private var _type:String;
	private var isTyped:Bool;
	public function new() 
	{
		super();
		isTyped = false;
		isFliped =  false;
		initView();
		//reset
		isDisabled = false;
	}
	
	
	
	public function getType():String {
		return _type;	 
	}
	public function setType(value:String):Void {
		if (isTyped) return;
		_type = value;
		
		setImageByType();
		isTyped = true;
	}
	
	public function disable(value:Bool):Void {
		isDisabled = value;
		this.visible = !value;
	}
	public function flip(value:Bool):Void 
	{
		if(!isDisabled){
			isFliped = value;
			backImage.visible = !isFliped;
		}
	}
	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	//private methods >>>>>>>>>>>>>>>>
	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	private function initView() 
	{
		bgImage = new Bitmap(Assets.getBitmapData(AppConstants.IMAGEPATH_CARD_BG));
		backImage = new Bitmap(Assets.getBitmapData(AppConstants.IMAGEPATH_CARD_BACK));
		//cover
		cover = Utils.cover(AppConstants.CARD_WIDTH,AppConstants.CARD_HEIGHT);
		
		imageContainer = new Sprite();
		this.addChild(bgImage);
		this.addChild(imageContainer);
		imageContainer.x = (AppConstants.CARD_WIDTH - AppConstants.CARD_IMAGE_WIDTH)* 0.5;
		imageContainer.y = (AppConstants.CARD_HEIGHT - AppConstants.CARD_IMAGE_HEIGHT) * 0.5;
		this.addChild(backImage);
		this.addChild(cover);
		//backImage.visible = false;
	}
	
	
	
	private function setImageByType():Void {
		imagePath = "assets/cardImages/" + _type + "." + AppConstants.IMAGE_EXTENSION;
		image = new Bitmap(Assets.getBitmapData(imagePath));
		imageContainer.addChild(image);
	}
	
}