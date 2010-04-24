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
package com.wezside.components.layout 
{
	import com.wezside.components.IUIDecorator;
	import com.wezside.components.UIElement;
	import com.wezside.components.UIElementEvent;
	import com.wezside.data.iterator.IIterator;

	import flash.display.DisplayObject;

	/**
	 * @author Wesley.Swanepoel
	 */
	public class PaddedLayout extends Layout 
	{

		
		public function PaddedLayout( decorated:IUIDecorator )
		{
			super( decorated );
		}

		
		override public function arrange( event:UIElementEvent = null ):void
		{
			super.arrange();

			var iterator:IIterator = decorated.iterator( UIElement.ITERATOR_CHILDREN );
			iterator.next();
			while ( iterator.hasNext())
			{
				var child:DisplayObject = iterator.next() as DisplayObject;
				child.x += left;
				child.y += top;
			}
	
			if ( decorated is ILayout )
			{
				width = ILayout( decorated ).width;
				height = ILayout( decorated ).height;
			}
		}

		override public function iterator( type:String = null ):IIterator
		{
			return decorated.iterator( UIElement.ITERATOR_CHILDREN );
		}

	}
}