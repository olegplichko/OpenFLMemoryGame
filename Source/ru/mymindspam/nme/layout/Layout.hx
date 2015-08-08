package ru.mymindspam.nme.layout;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

/**
 * ...
 * @author mymindspam
 */

class Layout 
{

	public function new() 
	{
		
	}
	public static function hBox(value:Sprite, spacer:Float = 0, _cellSize:Float = 0):Void {
		var i:Int = 0;
		var n:Int = value.numChildren;
		var child:DisplayObject;
		for (i in 0...n) {
			if (_cellSize == 0 && i==0) {
				_cellSize = value.getChildAt(i).width;
			}
			child = value.getChildAt(i);
			child.x = i * (spacer + _cellSize);
		}		
	}
	public static function addToHBox(value:Sprite, child:DisplayObject , spacer:Float = 0, _cellSize:Float = 0):Void {
		if (_cellSize == 0) {
			_cellSize = child.width;
		}
		child.x = value.numChildren * (spacer + _cellSize);
		value.addChild(child);
	}
	
	public static function vBox(value:Sprite, spacer:Float = 0, _cellSize:Float = 0):Void {
		var i:Int = 0;
		var n:Int = value.numChildren;
		var child:DisplayObject;
		for (i in 0...n) {
			if (_cellSize == 0 && i==0) {
				_cellSize = value.getChildAt(i).height;
			}
			child = value.getChildAt(i);
			child.y = i * (spacer + _cellSize);
		}		
	}
	
	public static function addToVBox(value:Sprite, child:DisplayObject , spacer:Float = 0, _cellSize:Float = 0):Void {
		if (_cellSize == 0) {
			_cellSize = child.height;
		}
		child.y = value.numChildren * (spacer + _cellSize);
		value.addChild(child);
	}
	
	public static function grid(value:Sprite, inRow:Int, spacer:Float = 0, _cellWidth:Float = 0, _cellHeight:Float = 0):Void {
		var i:Int = 0;
		var n:Int = value.numChildren;
		var child:DisplayObject;
		var rowIndex:Int = 0;
		var columnIndex:Int = 0;
		for (i in 0...n) {
			if (i == 0) {
				if(_cellWidth == 0){ 
					_cellWidth = value.getChildAt(i).width;
				}
				if (_cellHeight == 0) {
					_cellHeight = value.getChildAt(i).height;
				}
			}
			child = value.getChildAt(i);
			child.x = columnIndex * (_cellWidth + spacer);
			child.y = rowIndex * (_cellHeight + spacer);
			columnIndex++;
			if (columnIndex == inRow) {
				columnIndex = 0;
				rowIndex++;
			}
		}		
	}
	
	public static function left(obj:Sprite, value:Float):Void {
		obj.x = value;
	}
	
	public static function right(obj:Sprite, value:Float, w:Float = 0, parentW:Float = 0):Void {
		obj.x = ((obj.parent.width+parentW) - obj.width - w) - value;
	}
	
	public static function top(obj:Sprite, value:Float):Void {
		obj.y = value;
	}
	
	public static function bottom(obj:Sprite, value:Float, h:Float = 0, parentH:Float = 0):Void {
		obj.y = ((obj.parent.height+parentH) - obj.height - h) - value;
	}
}