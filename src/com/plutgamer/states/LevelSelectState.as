package com.plutgamer.states 
{
	import com.plutgamer.assets.Assets;
	import com.plutgamer.objects.PlayerShip;
	import com.plutgamer.util.Globals;
	import com.plutgamer.util.LevelDefinition;
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	public class LevelSelectState extends FlxState 
	{
		public var bg:FlxSprite;
		public var logo:FlxSprite;
		public var testlable:FlxText;
		public var headerlable:FlxText;
		public var testlable2:FlxText;
		public var levels:Array = [];
		public var current:int = 0;
		public var last:int = 0;
		
		override public function create():void
		{
			bg = new FlxSprite(0, 0, Assets.bg_testlevel);
			bg.angle = 180;
			add(bg);
			
			logo = new FlxSprite(0, 0, Assets.mainmenu);
			add(logo);
			
			levels.push(Levels.level_easymode_1);
			levels.push(Levels.level_2);
			levels.push(Levels.level_3);
			levels.push(Levels.level_4);
			levels.push(Levels.level_5);
			levels.push(Levels.level_hardmode_1);
			current = Globals.last_level;
			last = levels.length;
			
			headerlable= new FlxText(FlxG.width / 4, FlxG.height / 3, FlxG.width / 2, "LEVEL SELECT");
			headerlable.alignment = "center";
			add(headerlable);
			
			testlable = new FlxText(FlxG.width / 4, FlxG.height / 3 * 2, FlxG.width / 2, "Press <space> to load this level");
			testlable.alignment = "center";
			add(testlable);
			
			testlable2 = new FlxText(FlxG.width / 4, FlxG.height / 2, FlxG.width / 2, "Something went wrong");
			testlable2.alignment = "center";
			add(testlable2);
			
			update_level();
			
			FlxG.play(Assets.select);
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("D") || FlxG.keys.justPressed("RIGHT"))
			{
				current = (current + 1) % last;
				update_level();
			}
			if (FlxG.keys.justPressed("A") || FlxG.keys.justPressed("LEFT"))
			{
				current = (current - 1) % last;
				update_level();
			}
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				Globals.last_level = current;
				FlxG.switchState(new PlayState(((LevelDefinition)(levels[current]))));
			}
			
			super.update();
		}
		
		public function update_level():void
		{
			if (current < 0)
			{
				current = last - 1;
			}
			testlable2.text = current + 1 + ". " + ((LevelDefinition)(levels[current])).name;
			testlable2.color = ((LevelDefinition)(levels[current])).hard ? 0xFF3700 : 0x00C8FF;
		}
	}
}