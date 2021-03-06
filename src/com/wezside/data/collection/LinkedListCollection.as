package com.wezside.data.collection 
{
	import com.wezside.data.iterator.IIterator;
	import com.wezside.data.iterator.LinkedListIterator;

	import flash.utils.Dictionary;

	/**
	 * @author Wesley.Swanepoel
	 */
	public class LinkedListCollection implements ICollection 
	{
		
		
		private var _length:int = 0;
		private var _current:LinkedListNode;
		private var _collection:Dictionary;


		public function LinkedListCollection() 
		{
			_collection = new Dictionary();
		}			
		
		public function addElement( value:* ):void
		{
			var node:LinkedListNode = new LinkedListNode();
			node.data = value;
			node.next = null;
			node.index = _length;
			_collection[ _length ] = node;
			
			if ( !_current )
			{
				_collection["head"] = new LinkedListNode();
				_current = _collection["head"];
			}
			
			while ( _current.next )
				_current = _current.next;
								
			_current.next = node;
			
			++_length;	
			node = null;
		}
		
		public function getElementAt( index:int ):LinkedListNode
		{
			return _collection[ index.toString() ] as LinkedListNode;
		}
		
		public function removeElement( id:String ):void
		{
			var selectedIndex:int = -1;
			var iterator:IIterator = iterator();
			while ( iterator.hasNext())
			{
				var node:LinkedListNode = iterator.next() as LinkedListNode;
				
				// Update the pointer to move the next one in the list				
				if ( node.next && node.next.data.id == id )
				{
					selectedIndex = node.next.index;
					
					var nextNode:LinkedListNode = iterator.next() as LinkedListNode;
					node.next = nextNode.next;
					nextNode.purge();
					--_length;
				}				 
				else if ( node.data.id == id ) 
				{
					// If the node is the last in the list
					if ( _collection["head"].next.data.id == id )
						_collection["head"].next = null;
						
					selectedIndex = node.index;
					node.purge();				
					--_length;
				}				
			}
			iterator.purge();
			
			if ( selectedIndex > -1 )
			{
				_collection[ selectedIndex.toString() ] = null;
				delete _collection[ selectedIndex.toString() ];
			}
		}		

		public function iterator():IIterator
		{
			return new LinkedListIterator( _collection );
		}
		
		public function find( value:String = "" ):Object
		{		
			var iterator:IIterator = iterator();
				
			// Returns the first item
			if ( value == "" && iterator.hasNext() ) return iterator.next().data;
			
			while ( iterator.hasNext())
			{
				var item:LinkedListNode = iterator.next() as LinkedListNode;
				if ( item.data && item.data.id == value )
					return item.data; 
			}
			LinkedListIterator( iterator ).purge();			
			iterator = null;
			return null;
		}
		
		public function purge():void
		{			
			for each ( var i:LinkedListNode in _collection )
			{
				delete _collection[i];
				_collection[i] = null;
			}
			_collection = null;
			_current.purge();
			_current = null;
		}
		
		public function get length():int
		{
			return _length;
		}
		
		public function toString():String
		{
			var str:String = "";
			var iterator:IIterator = iterator();
			while ( iterator.hasNext())
			{
				var item:* = iterator.next();	
				str += item.toString();
			}
			iterator.purge();
			return str;
		}	
	}
}
