package com.plutgamer.states 
{
	import com.plutgamer.assets.Assets;
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	/**
	 * Main menu state
	 * @author Stijn Brouwer
	 */
	public class MenuState extends FlxState 
	{
		public var bg:FlxSprite;
		public var logo:FlxSprite;
		public var testlable:FlxText;
		public var testlable2:FlxText;
		
		override public function create():void
		{
			bg = new FlxSprite(0, 0, Assets.bg_testlevel);
			bg.angle = 180;
			add(bg);
			
			logo = new FlxSprite(0, 0, Assets.mainmenu);
			add(logo);
			
			testlable = new FlxText(FlxG.width / 4, FlxG.height / 3 * 2, FlxG.width / 2, "Press <space> to continue");
			testlable.alignment = "center";
			add(testlable);
			testlable2 = new FlxText(FlxG.width / 4, FlxG.height / 4 * 3, FlxG.width / 2, "Made by Stijn Brouwer for LD48 #28");
			testlable2.alignment = "center";
			add(testlable2);
			FlxG.play(Assets.select);
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new TutorialState());
			}
			
			super.update();
		}
	}
}