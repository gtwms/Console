package console
{
	public class Node 
	{
		private var _next:Node;
		private var _data:String;
		
		public function Node(_d:String) 
		{
			_data = _d;
		}
		
		public function getData():String
		{
			return _data;
		}
		
		public function getNext():Node
		{
			return _next;
		}
		
		public function setNext(_n:Node):void
		{
			_next = _n;
		}
	}
}
