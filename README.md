Wezside Components/Utilities
============================

This is a hub for components I've written and re-use quite often. These include Actionscript and MXML components.

Latest release
=======

* Compiled with Flex 4 SDK build 10434 

Components [Build 0.1.0000]
=======

* [Accordion](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/sample/accordion/AccordionAdvanced.mxml "Accordion") [Build 0.1.0032]
* [Media Player](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/sample/media/MediaSample.as "MediaPlauer") [Build 0.1.001]

Utilities [Build 0.1.0015]
=======

* [StateManager](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/sample/stateManager/StateTest.as "StateManager") 
* [TimelineManager](http://github.com/wezside/Toolkit/blob/master/src/com/wezside/sample/timelineManager/TimelineSample.as "TimelineManager")



Accordion
---------

A bare-bones Accordion component. Extend Accordion and AccordionItem to customise this component and add animations when 
state changes.

		var itemA:IAccordionItem = new AccordionItem();
		itemA.header = headerDisplayObject;
		itemA.content = contentDisplayObject; 
			
		var acc:Accordion = new Accordion();
		acc.addItem( itemA );
		addChild( acc );

Media Player
------------

A simple media player that loads three Youtube videos or an image. 

		var item1:Media = new Media();
		item1.url = "http://www.youtube.com/watch?v=MWe07krS8_E";
		 
		var item2:Media = new Media();
		item2.url = "http://www.youtube.com/watch?v=uXyUtJYIdQA"; 
		 
		var item3:Media = new Media();
		item3.url = "http://www.youtube.com/watch?v=MWe07krS8_E"; 
				
		var mediaItems:Array = [];
		mediaItems.push( item1 );
		mediaItems.push( item2 );
		mediaItems.push( item3 );
	
		player = new MediaPlayer();
		player.bgWidth = 350;			
		player.bgHeight = 200;			
		player.dataprovider = mediaItems;
		addChild(player); 
		
StateManager
------------

A useful class to manage application state. The reserved property on an IState instance is used for 
application state that will only affect itself. Reserved states are not mutually exclusive, they are allowed to co-exist 
with non-reserved and other reserved states. 

		var sm:StateManager = new StateManager();
		sm.addState( "Credentials", true );
		sm.addState( "Register" );
		sm.addState( "List" );
		sm.addState( "Search" );
		sm.addState( "Results" );
		
		sm.state = "Credentials";				// State == 1
		sm.state = "Credentials";				// State == 0
		sm.state = "Credentials";				// State == 1
		sm.state = "Register";				// State == 3
		sm.previousState()					// Result is "Credentials"	
		sm.state = "Credentials";				// State == 2


TimelineManager
---------------

A simple class to deal with timeline animations. Manage timeline animations playback, removal and 
end frame behaviour. A play policy exist to allow for playing back multiple animations at once or 
in sequence starting at a specific animation or simply play a single (default) animation.

		var manager:TimelineManager = new TimelineManager();
		manager.push( id, mc );
		manager.push( id, mc );
		manager.push( id, mc );
		manager.push( id, mc );
		manager.playPolicy = TimelineManager.PLAY_POLICY_SEQUENTIAL; 
		manager.play();
