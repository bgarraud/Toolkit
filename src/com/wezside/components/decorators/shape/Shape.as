/**
 * Copyright (c) 2010 Wesley Swanepoel
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.wezside.components.decorators.shape 
{
	import com.wezside.components.IUIDecorator;
	import com.wezside.components.UIElement;
	import com.wezside.data.iterator.IIterator;

	import flash.display.Sprite;

	/**
	 * @author Wesley.Swanepoel
	 */
	public class Shape extends Sprite implements IShape 
	{

		private var _cornerRadius:int = 0;
		private var _borderColor:uint = 0xffffff;
		private var _borderAlpha:int = 1;
		private var _borderThickness:int = 0;
		private var _colours:Array = [];
		private var _alphas:Array = [];
		private var _width:Number = 0;
		private var _height:Number = 0;
		private var _bottomRightRadius:int = 0;
		private var _bottomLeftRadius:int = 0;
		private var _topRightRadius:int = 0;
		private var _topLeftRadius:int = 0;

		protected var decorated:IUIDecorator;

		public function Shape( decorated:IUIDecorator = null ) 
		{					
			this.decorated = decorated;
		}
		
		public function iterator( type:String = null ):IIterator
		{
			return decorated.iterator( UIElement.ITERATOR_CHILDREN );
		}
		
		public function arrange():void
		{
			clear();
			draw();
		}
				
		public function draw():void
		{
		}		
				
		public function clear():void
		{
			graphics.clear();
		}		
		
		public function get colours():Array
		{
			return _colours;
		}
		
		public function set colours(value:Array):void
		{
			_colours = value;
		}
		
		public function get alphas():Array
		{
			return _alphas;
		}
		
		public function set alphas(value:Array):void
		{
			_alphas = value;
		}
		
		public function get cornerRadius():int
		{
			return _cornerRadius;
		}
		
		public function set cornerRadius(value:int):void
		{
			_cornerRadius = value;
		}
		
		public function get borderAlpha():int
		{
			return _borderAlpha;
		}
		
		public function get borderThickness():int
		{
			return _borderThickness;
		}
		
		public function set borderAlpha(value:int):void
		{
			_borderAlpha = value;
		}
		
		public function set borderThickness(value:int):void
		{
			_borderThickness = value;
		}
		
		public function get borderColor():uint
		{
			return _borderColor;
		}
		
		public function set borderColor( value:uint ):void
		{
			_borderColor = value;
		}

		override public function set width(value:Number):void 
		{
			_width = value;
		}
		
		override public function get width():Number 
		{
			return _width;
		}
		
		override public function set height(value:Number):void 
		{
			_height = value;
		}
		
		override public function get height():Number 
		{
			return _height;
		}
		
		public function get topLeftRadius():int
		{
			return _topLeftRadius;
		}
		
		public function set topLeftRadius( value:int ):void
		{
			_topLeftRadius = value;
		}
		
		public function get topRightRadius():int
		{
			return _topRightRadius;
		}
		
		public function set topRightRadius( value:int ):void
		{
			_topRightRadius = value;
		}
		
		public function get bottomLeftRadius():int
		{
			return _bottomLeftRadius;
		}
		
		public function set bottomLeftRadius( value:int ):void
		{
			_bottomLeftRadius = value;
		}
		
		public function get bottomRightRadius():int
		{
			return _bottomRightRadius;
		}
		
		public function set bottomRightRadius( value:int ):void
		{
			_bottomRightRadius = value;
		}

	}
}
