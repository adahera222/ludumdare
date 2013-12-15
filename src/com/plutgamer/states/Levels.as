package com.plutgamer.states 
{
	import Box2D.Common.Math.b2Vec2;
	import com.plutgamer.objects.Astroid;
	import com.plutgamer.util.Globals;
	import com.plutgamer.assets.Assets;
	import com.plutgamer.util.LevelDefinition;
	import org.flixel.FlxGroup;
	
	public class Levels 
	{
		public static var level_hardmode_1:LevelDefinition;
		public static var level_easymode_1:LevelDefinition;
		public static var level_2:LevelDefinition;
		public static var level_3:LevelDefinition;
		public static var level_4:LevelDefinition;
		public static var level_5:LevelDefinition;
		
		public static function load_definitions():void
		{
			level_hardmode_1 = new LevelDefinition();
			level_hardmode_1.name = "Tricky Maneuvers";
			level_hardmode_1.hard = true;
			level_hardmode_1.bg_image = Assets.bg_testlevel;
			level_hardmode_1.ship = Ships.atomic_hardmode;
			level_hardmode_1.start_pos = new b2Vec2(300, 130);
			level_hardmode_1.start_angle = Math.PI * 1.75;
			level_hardmode_1.fuelstation_pos = new b2Vec2(50, 160);
			level_hardmode_1.fuelstation_angle = Math.PI / 2;
			level_hardmode_1.astroid_pos.push([200, 110]);
			
			level_easymode_1 = new LevelDefinition();
			level_easymode_1.name = "Easy start";
			level_easymode_1.hard = false;
			level_easymode_1.bg_image = Assets.bg_testlevel;
			level_easymode_1.ship = Ships.atomic_easymode;
			level_easymode_1.start_pos = new b2Vec2(300, 150);
			level_easymode_1.start_angle = Math.PI * 1.75;
			level_easymode_1.fuelstation_pos = new b2Vec2(100, 50);
			level_easymode_1.fuelstation_angle = Math.PI * 1.6;
			
			level_2 = new LevelDefinition();
			level_2.name = "Turning 101";
			level_2.hard = false;
			level_2.bg_image = Assets.bg_testlevel;
			level_2.ship = Ships.atomic_easymode;
			level_2.start_pos = new b2Vec2(300, 200);
			level_2.start_angle = 0;
			level_2.fuelstation_pos = new b2Vec2(200, 50);
			level_2.fuelstation_angle = Math.PI * 0.5;
			
			level_3 = new LevelDefinition();
			level_3.name = "Asteroids!";
			level_3.hard = false;
			level_3.bg_image = Assets.bg_testlevel;
			level_3.ship = Ships.atomic_easymode;
			level_3.start_pos = new b2Vec2(250, 200);
			level_3.start_angle = Math.PI * 1.5;
			level_3.fuelstation_pos = new b2Vec2(100, 50);
			level_3.fuelstation_angle = 0;
			level_3.astroid_pos.push([200, 110], [250, 90], [100, 100], [300, 120]);
			
			level_4 = new LevelDefinition();
			level_4.name = "Raising the bar";
			level_4.hard = true;
			level_4.bg_image = Assets.bg_testlevel;
			level_4.ship = Ships.atomic_hardmode;
			level_4.fuelstation_pos = new b2Vec2(50, 80);
			level_4.start_angle = Math.PI * 1.5;
			level_4.start_pos = new b2Vec2(300, 180);
			level_4.fuelstation_angle = Math.PI * 1.5;
			level_4.astroid_pos.push([200, 110], [250, 150], [150, 160], [130, 20]);
			
			level_5 = new LevelDefinition();
			level_5.name = "Barrier";
			level_5.hard = true;
			level_5.bg_image = Assets.bg_testlevel;
			level_5.ship = Ships.atomic_hardmode;
			level_5.start_pos = new b2Vec2(50, 80);
			level_5.start_angle = Math.PI * 0.5;
			level_5.fuelstation_pos = new b2Vec2(300, 180);
			level_5.fuelstation_angle = Math.PI * 0.5;
			level_5.astroid_pos.push([150, 110], [200, 20], [210, 60], [170, 230]);
		}
	}
}