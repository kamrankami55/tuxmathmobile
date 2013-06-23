
/*=======================================================================================================
												LICENSE 
  =======================================================================================================
  
				The contents of this file are subject to the Mozilla Public
				License Version 2.0 (the "License"); you may not use this file
				except in compliance with the License. You may obtain a copy of
				the License at http://www.mozilla.org/MPL/2.0/

				Software distributed under the License is distributed on an "AS
				IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
				implied. See the License for the specific language governing
				rights and limitations under the License.

				The Original Code is "Tuxmath"
				
				Copyright (C) 2012 by Tux4kids.  All Rights Reserved.
				Author : Deepak Aggarwal
  =======================================================================================================*/

package tuxkids;

import nme.Lib;
import nme.Assets;
import tuxkids.GameConstant;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.geom.Matrix;

/**
 * ...
 * @author Deepak Aggarwal
 */

/**
 * Class for resizing images based on the resolution.
 */
class Image 
{
	public static function resize(filepath:String, size:Float , maintainAspectRatio:Bool = false)
	{
		var width:Float = GameConstant.stageWidth * size;
		var height:Float = GameConstant.stageHeight * size;
		var image:BitmapData = Assets.getBitmapData(filepath,false);
		if(maintainAspectRatio == true){
			var originalRatio:Float = image.width/image.height; 
			if(width/height > originalRatio){
				width = height*originalRatio;
			}
			else{
				height = width/originalRatio;
			}
		}
		//image.width = width;
		//image.height = height;
		var matrix:Matrix = new Matrix();
        	matrix.scale(width/image.width, height/image.height);
		var scaledImage = new BitmapData(Std.int(width),
		    Std.int(height), true, 0x000000);
		scaledImage.draw(image, matrix, null, null, true);
		return scaledImage;
	}
	
	public static function resizeToDimension(filepath:String, width:Float , height:Float)
	{
		var image:BitmapData = Assets.getBitmapData(filepath,false);
		var originalRatio:Float = image.width/image.height; 
		if(width/height > originalRatio){
			width = height*originalRatio;
		}
		else{
			height = width/originalRatio;
		}
		//image.width = width;
		//image.height = height;
		var matrix:Matrix = new Matrix();
        	matrix.scale(width/image.width, height/image.height);
		var scaledImage = new BitmapData(Std.int(width),
		    Std.int(height), true, 0x000000);
		scaledImage.draw(image, matrix, null, null, true);
		return scaledImage;
	}
	
	public static function resizeRelativeToImageDimension(filepath:String, size:Float)
	{
		var image:BitmapData = Assets.getBitmapData(filepath,false);
		var width:Float = image.width*size;
		var height:Float = image.height*size;
		var originalRatio:Float = image.width/image.height; 
		if(width/height > originalRatio){
			width = height*originalRatio;
		}
		else{
			height = width/originalRatio;
		}
		//image.width = width;
		//image.height = height;
		var matrix:Matrix = new Matrix();
        	matrix.scale(width/image.width, height/image.height);
		var scaledImage = new BitmapData(Std.int(width),
		    Std.int(height), true, 0x000000);
		scaledImage.draw(image, matrix, null, null, true);
		return scaledImage;
	}
}