package console
{
	import flash.text.*;
	import flash.events.*;
	import flash.display.*;
	
	public class Console extends Sprite
	{
		public var keywords:Vector.<String>;
		
		private var characters:Vector.<LinkedList>;
		
		private var inputTextField:TextField;
		private var inputTextFormat:TextFormat;
		private var inputFont:DINPro;
		private var inputAt:int;
		private var inputPrevSize:int;
		
		private var suggestionTextFormat:TextFormat;
		private var suggestionStartTextFormat:TextFormat;
		
		private var running:Boolean;
		
		public function Console() 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			characters = new Vector.<LinkedList>(256, true);
			
			buildTable();
			
			inputFont = new DINPro();
			inputTextFormat = new TextFormat();
			inputTextFormat.font = inputFont.fontName;
			inputTextFormat.color = 0x00FF00;
			inputTextFormat.underline = false;
			inputTextField = new TextField();
			inputTextField.defaultTextFormat = inputTextFormat;
			inputTextField.type = TextFieldType.INPUT;
			inputTextField.background = true;
			inputTextField.border = true;
			inputTextField.width = stage.stageWidth;
			inputTextField.height = 20;
			inputTextField.backgroundColor = 0x000000;
			inputTextField.selectable = false;
			inputTextField.addEventListener(Event.CHANGE, textChange);
			inputAt = -1;
			inputPrevSize = 0;
			
			suggestionTextFormat = new TextFormat();
			suggestionTextFormat.font = inputFont.fontName;
			suggestionTextFormat.color = 0xAAFFAA;
			suggestionTextFormat.underline = false;
			
			suggestionStartTextFormat = new TextFormat();
			suggestionStartTextFormat.font = inputFont.fontName;
			suggestionStartTextFormat.color = 0xAAFFAA;
			suggestionStartTextFormat.underline = true;
			
			running = false;
		}
		
		private function buildTable():void
		{
			for (var a:int = 0; a < keywords.length; a++)
			{
				if (keywords[a].charCodeAt() >= characters.length)
				{
					continue;
				}
				if (characters[keywords[a].charCodeAt()] == null)
				{
					characters[keywords[a].charCodeAt()] = new LinkedList();
				}
				characters[keywords[a].charCodeAt()].addString(keywords[a]);
			}
		}
		
		private function textChange(e:Event):void
		{
			if (!running)
				return;
				
			inputTextField.text = inputTextField.text.toLowerCase();
			inputTextField.setTextFormat(inputTextFormat);
			
			// remove ` from input
			if (inputTextField.text.charAt(inputTextField.length - 1) == "`")
			{
				inputTextField.text = inputTextField.text.substring(0, inputTextField.length - 2);
			}
			
			// if user deletes one character, delete all text
			if (inputTextField.text.length < inputPrevSize)
			{
				inputTextField.text = "";
				inputAt = -1;
				inputPrevSize = 0;
			}
			
			// remove suggestion text if user is typing
			if (inputAt != -1)
			{
				inputTextField.text = inputTextField.text.substring(0, inputAt + 1);
			}
			
			// add suggestion text if user is typing
			if (inputTextField.text.length > 0 && characters[inputTextField.text.charCodeAt()] != null)
			{
				var node:Node = null;
				var foundMatch:Boolean = false; // whether a match exists
				outerloop: for (var a:int = 0; a < characters[inputTextField.text.charCodeAt()].getSize(); a++)
				{
					if (node == null)
					{
						node = characters[inputTextField.text.charCodeAt()].getHead();
					}
					else
					{
						node = node.getNext();
					}
					if (node == null)
					{
						break;
					}
					
					// make sure each character in string matches, not just most recent
					for (var b:int = 0; b < inputTextField.text.length; b++)
					{
						if (inputTextField.text.charAt(b) != node.getData().charAt(b))
						{
							continue outerloop;
						}
					}

					// if found match, apply suggestion and end search
					if (inputTextField.text.charAt(inputTextField.text.length - 1) == node.getData().charAt(inputTextField.text.length - 1))
					{
						foundMatch = true;
						inputAt = inputTextField.text.length;
						inputTextField.appendText((node.getData().substring(inputAt)));
						
						if (inputAt <= inputTextField.text.length - 1)
						{
							inputTextField.setTextFormat(suggestionStartTextFormat, inputAt, inputAt + 1);
						}
						
						if (inputAt < inputTextField.text.length - 1)
						{
							inputTextField.setTextFormat(suggestionTextFormat, inputAt + 1, inputTextField.text.length);
						}
						
						break;
					}
				}
				
				if (!foundMatch)
				{
					inputAt = -1;
				}
			}
			inputPrevSize = inputTextField.text.length;
		}
		
		public function toggle():void
		{
			if (running)
			{
				running = false;
				inputAt = -1;
				inputPrevSize = 0;
				removeChild(inputTextField);
			}
			else
			{
				running = true;
				inputTextField.text = "";
				addChild(inputTextField);
				stage.focus = inputTextField;
			}
		}
		
		public function validCommand():Boolean
		{
			if (inputTextField.text.length <= 0 || inputTextField.text.charCodeAt() >= characters.length)
			{
				return false;
			}
			if (characters[inputTextField.text.charCodeAt()] != null)
			{
				var node:Node = characters[inputTextField.text.charCodeAt()].getHead();
				if (node == null)
				{
					return false;
				}
				for (var a:int = 0; a < characters[inputTextField.text.charCodeAt()].getSize(); a++)
				{
					if (inputTextField.text == node.getData())
					{
						return true;
					}
					node = node.getNext();
					if (node == null)
					{
						return false;
					}
				}
			}
			return false;
		}
		
		public function isRunning():Boolean
		{
			return running;
		}
		
		public function getText():String
		{
			return inputTextField.text;
		}
	}
}
