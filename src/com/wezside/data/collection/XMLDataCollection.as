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
package com.wezside.data.collection 
{
	import com.wezside.data.iterator.ArrayIterator;
	import com.wezside.data.iterator.IIterator;
	import com.wezside.data.mapping.IXMLDataItem;

	/**
	 * @author Wesley.Swanepoel
	 */
	public class XMLDataCollection implements ICollection 
	{
		
		private var _collection:Array;
		private var xmlDataIterator:IIterator;

		public function XMLDataCollection() 
		{
			_collection = [];	
			xmlDataIterator = iterator();
		}
		
		public function iterator():IIterator
		{
			return new ArrayIterator( _collection );
		}

		public function addElement( value:IXMLDataItem ):void 
		{
			_collection.push( value );	
		}

		public function find( value:String = "" ):Object 
		{			
			xmlDataIterator.reset();
			while ( xmlDataIterator.hasNext() )	
			{
				var item:IXMLDataItem = IXMLDataItem( xmlDataIterator.next() );
				if ( item.nodeName == value )
					return item;
			}
			return null;
		}
		
		public function get length():int
		{
			return _collection.length;			
		}
		
		public function purge():void
		{
			xmlDataIterator.purge();
			xmlDataIterator = null;
			_collection = null;
		}
		
		public function toString():String
		{
			var str:String = "";
			xmlDataIterator.reset();
			while ( xmlDataIterator.hasNext())
			{
				var item:* = xmlDataIterator.next();	
				str += item.toString();
			}
			return str;
		}
	}
}
