package ;

/**
 * ...
 * @author mymindspam
 */

class AppConstants 
{
	inline public static var STAGE_WIDTH:Int = 640;
	inline public static var STAGE_HEIGHT:Int = 480;
	inline public static var DEF_HP:Int = 3;
	inline public static var CARD_TYPE_FIRST:String = "cloudiness";
	inline public static var CARD_TYPE_SECOND:String = "fog";
	inline public static var CARD_TYPE_THIRD:String = "rain";
	inline public static var CARD_TYPE_FOURTH:String = "snow";
	inline public static var IMAGE_EXTENSION:String = "png";
	public static var CARD_TYPES:Array<String> = [CARD_TYPE_FIRST, CARD_TYPE_SECOND,CARD_TYPE_THIRD,CARD_TYPE_FOURTH];
	
	inline public static var IMAGEPATH_CARD_BG:String = "assets/card/cardBg.png";
	inline public static var IMAGEPATH_CARD_BACK:String = "assets/card/cardBack.png";
	
	inline public static var IMAGEPATH_BUTTONS:String = "assets/ui/buttons";
	inline public static var IMAGEPATH_BARS:String = "assets/ui/bars";
	inline public static var CARD_IMAGE_WIDTH:Float = 128;
	inline public static var CARD_IMAGE_HEIGHT:Float = 128;
	
	inline public static var CARD_WIDTH:Float = 130;
	inline public static var CARD_HEIGHT:Float = 150;
	inline public static var CARD_SPACER:Float = 10;
	inline public static var CARDS_IN_ROW:Int = 3;
	inline public static var CARDS_SHOW_TIME:Int = 120;
	
	inline public static var MAIN_MENU_WIDTH:Int = 140;
	public function new() 
	{
		
	}
	
}