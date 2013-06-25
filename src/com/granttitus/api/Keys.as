package api
{
	import flash.events.KeyboardEvent;
	
	public class Keys
	{
		private var reference:Object;
		private var _keys:Vector.<Boolean>;
		
		public function Keys (_reference:Object):void
		{
			reference = _reference;
			reference.addEventListener(KeyboardEvent.KEY_DOWN, listenerKeyDown);
			reference.addEventListener(KeyboardEvent.KEY_UP, listenerKeyUp);

			_keys = new Vector.<Boolean>(256);
		}

		private function listenerKeyDown (event:KeyboardEvent):void
		{
			_keys[event.keyCode] = true;
		}
		
		private function listenerKeyUp(event:KeyboardEvent):void
		{
			_keys[event.keyCode] = false;
		}

		public function get keyDown()
		{
			return _keys;
		}

		public function left():Boolean
		{
			return _keys[37];
		}
		
		public function right():Boolean
		{
			return _keys[39];
		}
		
		public function up():Boolean
		{
			return _keys[38];
		}
		
		public function down():Boolean
		{
			return _keys[40];
		}
		
		public function space():Boolean
		{
			return _keys[32];
		}
		
		public function q():Boolean
		{
			return _keys[81];
		}
		
		public function p():Boolean
		{
			return _keys[80];
		}
		
		public function r():Boolean
		{
			return _keys[82];
		}
		
		public function w():Boolean
		{
			return _keys[87];
		}
		
		public function s():Boolean
		{
			return _keys[83];
		}
		
		public function a():Boolean
		{
			return _keys[65];
		}
		
		public function d():Boolean
		{
			return _keys[68];
		}
		
		public function tilde():Boolean
		{
			return _keys[192];
		}
		
		public function enter():Boolean
		{
			return _keys[13];
		}
	}
}