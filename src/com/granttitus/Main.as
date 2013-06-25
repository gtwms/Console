package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import console.Console;
	import api.Keys;
	
	public class Main extends Sprite
	{
		private var con:Console;
		
		public function Main() 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.ENTER_FRAME, update);

			con = new Console();
			con.keywords = new Vector.<String>();
			con.keywords.push("demo one", "demo two", "action one", "action two");
			addChild(con);
		}
		
		private function update(e:Event):void
		{
			if (con.hasCommand())
			{
				// do something with command
				trace("Command: " + con.getCommand());
			}
		}
	}
}
