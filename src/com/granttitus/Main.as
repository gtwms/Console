package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import console.Console;
	
	public class Main extends Sprite
	{
		private var con:Console;
		
		public function Main() 
		{
			addEventListener(Event.ENTER_FRAME, update);

			con = new Console();
			con.commands.push("demo one", "demo two", "action one", "action two");
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
