package api
{
	import flash.events.KeyboardEvent;
	
	public class Keys
	{
		private var pressLeft:Boolean = false;
		private var pressRight:Boolean = false;
		private var pressUp:Boolean = false;
		private var pressDown:Boolean = false;
		
		private var pressSpace:Boolean = false;
		private var pressEnter:Boolean = false;
		private var pressTilda:Boolean = false;
		
		private var pressP:Boolean = false;
		private var pressQ:Boolean = false;
		private var pressR:Boolean = false;
		
		private var pressA:Boolean = false;
		private var pressW:Boolean = false;
		private var pressS:Boolean = false;
		private var pressD:Boolean = false;
		
		private var referance:Object;
		
		public function Keys (_referance:Object):void
		{
			referance = _referance;
			referance.addEventListener(KeyboardEvent.KEY_DOWN, _keyDown);
			referance.addEventListener(KeyboardEvent.KEY_UP, _keyUp);
		}

		public function left():Boolean
		{
			return pressLeft;
		}
		
		public function right():Boolean
		{
			return pressRight;
		}
		
		public function up():Boolean
		{
			return pressUp;
		}
		
		public function down():Boolean
		{
			return pressDown;
		}
		
		public function space():Boolean
		{
			return pressSpace;
		}
		
		public function q():Boolean
		{
			return pressQ;
		}
		
		public function p():Boolean
		{
			return pressP;
		}
		
		public function r():Boolean
		{
			return pressR;
		}
		
		public function w():Boolean
		{
			return pressW;
		}
		
		public function s():Boolean
		{
			return pressS;
		}
		
		public function a():Boolean
		{
			return pressA;
		}
		
		public function d():Boolean
		{
			return pressD;
		}
		
		public function tilda():Boolean
		{
			return pressTilda;
		}
		
		public function enter():Boolean
		{
			return pressEnter;
		}
		
		private function _keyDown (event:KeyboardEvent):void
		{
			if (event.keyCode == 32)
			{
				pressSpace = true;
			}
			if (event.keyCode == 37)
			{
				pressLeft = true;
			}
			if (event.keyCode == 38)
			{
				pressUp = true;
			}
			if (event.keyCode == 39)
			{
				pressRight = true;
			}
			if (event.keyCode == 40)
			{
				pressDown = true;
			}
			if (event.keyCode == 80)
			{
				pressP = true;
			}
			if (event.keyCode == 81)
			{
				pressQ = true;
			}
			if (event.keyCode == 82)
			{
				pressR = true;
			}
			if (event.keyCode == 65)
			{
				pressA = true;
			}
			if (event.keyCode == 87)
			{
				pressW = true;
			}
			if (event.keyCode == 83)
			{
				pressS = true;
			}
			if (event.keyCode == 68)
			{
				pressD = true;
			}
			if (event.keyCode == 192)
			{
				pressTilda = true;
			}
			if (event.keyCode == 13)
			{
				pressEnter = true;
			}
		}
		
		private function _keyUp(event:KeyboardEvent):void
		{
			if (event.keyCode == 32)
			{
				pressSpace = false;
			}
			if (event.keyCode == 37)
			{
				pressLeft = false;
			}
			if (event.keyCode == 38)
			{
				pressUp = false;
			}
			if (event.keyCode == 39)
			{
				pressRight = false;
			}
			if (event.keyCode == 40)
			{
				pressDown = false;
			}
			if (event.keyCode == 80)
			{
				pressP = false;
			}
			if (event.keyCode == 81)
			{
				pressQ = false;
			}
			if (event.keyCode == 82)
			{
				pressR = false;
			}
			if (event.keyCode == 65)
			{
				pressA = false;
			}
			if (event.keyCode == 87)
			{
				pressW = false;
			}
			if (event.keyCode == 83)
			{
				pressS = false;
			}
			if (event.keyCode == 68)
			{
				pressD = false;
			}
			if (event.keyCode == 192)
			{
				pressTilda = false;
			}
			if (event.keyCode == 13)
			{
				pressEnter = false;
			}
		}
	}
}