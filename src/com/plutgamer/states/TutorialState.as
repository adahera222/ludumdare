package com.plutgamer.states 
{
	import com.plutgamer.assets.Assets;
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	public class TutorialState extends FlxState 
	{
		public var bg:FlxSprite;
		public var logo:FlxSprite;
		public var tutlable1:FlxText;
		public var tutlable2:FlxText;
		public var tutlable3:FlxText;
		public var tutlable4:FlxText;
		
		override public function create():void
		{
			bg = new FlxSprite(0, 0, Assets.bg_testlevel);
			bg.angle = 180;
			add(bg);
			
			logo = new FlxSprite(0, 0, Assets.mainmenu);
			add(logo);
			
			tutlable1 = new FlxText(0, FlxG.height / 24 * (0 + 12), FlxG.width, "You need to dock to the nearby space station, ");
			tutlable1.alignment = "center";
			add(tutlable1);
			tutlable2 = new FlxText(0, FlxG.height / 24 * (1 + 12), FlxG.width, "but you only have one little tank of fuel left.");
			tutlable2.alignment = "center";
			add(tutlable2);
			tutlable3 = new FlxText(0, FlxG.height / 24 * (3 + 12), FlxG.width, "To control your spaceship, use WASD or the arrow keys.");
			tutlable3.alignment = "center";
			add(tutlable3);
			tutlable4 = new FlxText(0, FlxG.height / 24 * (4 + 12), FlxG.width, "Easy, right? Look out for asteroids though!");
			tutlable4.alignment = "center";
			add(tutlable4);
			FlxG.play(Assets.select);
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.play(Assets.select);
				FlxG.switchState(new LevelSelectState());
			}
			
			super.update();
		}
	}
}