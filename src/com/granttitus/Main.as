package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import console.Console;
	import api.Keys;
	
	public class Main extends Sprite
	{
		private var gConsole:Console;
		private var gConsoleKeyDelay:int;
		
		private var keys:Keys;
		
		public function Main() 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.ENTER_FRAME, update);
			
			keys = new Keys(stage);
			
			gConsole = new Console();
			gConsole.keywords = new Vector.<String>();
			gConsole.keywords.push("demo one", "demo two", "action one", "action two");
			addChild(gConsole);
		}
		
		private function update(e:Event):void
		{
			if (gConsoleKeyDelay < 10)
				gConsoleKeyDelay++;
			if (keys.tilde() && gConsoleKeyDelay >= 10)
			{
				gConsoleKeyDelay = 0;
				gConsole.toggle();
			}
			if (keys.enter() && gConsole.isRunning() && gConsoleKeyDelay >= 10)
			{
				gConsoleKeyDelay = 0;
				if (gConsole.validCommand())
				{
					// do something with command
					trace(gConsole.getText());
				}
				gConsole.toggle();
			}
		}
	}
}
