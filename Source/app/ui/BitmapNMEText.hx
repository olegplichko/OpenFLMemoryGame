package app.ui;
import openfl.display.Bitmap;
import openfl.Assets;

/**
 * ...
 * @author mymindspam
 */

class BitmapNMEText extends Bitmap
{
	
	public function new(text:String) 
	{
		super(Assets.getBitmapData("assets/BitmapTexts/"+text+".png"));
	}
	
}