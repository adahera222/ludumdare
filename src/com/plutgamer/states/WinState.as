package com.plutgamer.states 
{
	import com.plutgamer.assets.Assets;
	import com.plutgamer.util.Globals;
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	public class WinState extends FlxState 
	{
		public var bg:FlxSprite;
		public var testlable:FlxText;
		
		override public function create():void
		{
			bg = new FlxSprite(0, 0, Assets.bg_testlevel);
			bg.angle = 180;
			add(bg);
			
			testlable = new FlxText(FlxG.width / 4, FlxG.height / 3, FlxG.width / 2, "YOU WIN");
			testlable.alignment = "center";
			add(testlable);
			
			Globals.last_level = (Globals.last_level + 1) % 6;
			
			FlxG.flash(0xffffff, 0.5);
			FlxG.play(Assets.win);
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new LevelSelectState());
			}
			
			super.update();
		}
	}
}