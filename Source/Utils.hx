package;


import app.cards.Card;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Loader;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;


class Utils {

	public static function shuffleArray(array_arr:Array<Card>):Array<Card> {
		//TODO random not working for html5
		var n:Int = array_arr.length;
		var i:Int = 0;
		for (i in 0...n) {
			var randomNum_num:Float = Math.floor(Math.random() * n);
			var arrayIndex:Card = array_arr[i];
			array_arr[i] = array_arr[cast(randomNum_num,Int)];
			array_arr[cast(randomNum_num, Int)] = arrayIndex;			
		}
		return array_arr;
	}
	
	public static function cover(w:Float, h:Float):Sprite {
		var sprite:Sprite = new Sprite();
		sprite.graphics.beginFill(0x000000, 0);
		sprite.graphics.drawRect(0, 0, w, h);
		sprite.graphics.endFill();
		return sprite;
	}
}
