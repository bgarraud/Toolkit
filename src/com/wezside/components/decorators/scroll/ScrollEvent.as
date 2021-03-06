package com.wezside.components.decorators.scroll 
{
	import flash.events.Event;

	/**
	 * @author Wesley.Swanepoel
	 */
	public class ScrollEvent extends Event 
	{

		public var percent:Number;
		public var scrollValue:int;
		public var prop:String;
		public static const CHANGE:String = "scrollValueChange"; 

		
		public function ScrollEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, percent:Number = 0, scrollValue:int = 0, prop:String = "y" )
		{
			super( type, bubbles, cancelable );
			this.percent = percent;
			this.scrollValue = scrollValue;
			this.prop = prop;
		}
		
		override public function clone():Event 
		{
			return new ScrollEvent( type, false, false, percent, scrollValue, prop );
		}
	}
}
