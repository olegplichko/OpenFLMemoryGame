package app.ui;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Assets;

/**
 * ...
 * @author mymindspam
 */

class SimplestNMEButton extends Sprite
{
	private var imageName:String;
	private var imagePath:String;
	private var imageBg:Bitmap;	
	private var buttonWidth:Float;
	private var buttonText:String;
	private var label:BitmapNMEText;

	public function new(_imageName:String,_buttonWidth:Float,_buttonText:String="") 
	{
		super();
		buttonWidth = _buttonWidth;
		
		imageName = _imageName;
		imagePath = AppConstants.IMAGEPATH_BUTTONS + "/" + imageName + "." + AppConstants.IMAGE_EXTENSION;
		imageBg = new Bitmap(Assets.getBitmapData(imagePath));		
		this.addChild(imageBg);
		//text field
		buttonText = _buttonText;
		if (buttonText != "") {
			setText(buttonText);
		}
		
	}
	private function setText(value:String):Void {
		label =  new BitmapNMEText(value);
		label.x = buttonWidth * 0.5 - label.width * 0.5;
		label.y = 5;
		this.addChild(label);		
	}
}