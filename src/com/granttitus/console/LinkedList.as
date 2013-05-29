package console
{
	public class LinkedList 
	{
		private var head:Node;
		private var tail:Node;
		private var size:int;
		
		public function LinkedList() 
		{
			head = null;
			tail = null;
			size = 0;
		}
		
		public function addString(_data:String):void
		{
			var node:Node = new Node(_data);
			size++;
			
			if (head == null)
			{
				head = node;
			}
			
			if (tail == null)
			{
				tail = node;
			} 
			else 
			{
				tail.setNext(node);
				tail = tail.getNext();
			}
		}
		
		public function getHead():Node
		{
			return head;
		}
		
		public function getSize():int
		{
			return size;
		}
	}
}
