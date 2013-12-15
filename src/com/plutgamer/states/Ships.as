package com.plutgamer.states 
{
	import Box2D.Common.Math.b2Vec2;
	import com.plutgamer.assets.Assets;
	import com.plutgamer.util.ShipDefinition;
	
	public class Ships 
	{
		public static var atomic_easymode:ShipDefinition;
		public static var atomic_hardmode:ShipDefinition;
		
		public static function load_definitions():void
		{
			atomic_easymode = new ShipDefinition();
			atomic_easymode.image = Assets.spacecraft_atomic;
			atomic_easymode.img_size = new b2Vec2(Assets.sc_atom_width, Assets.sc_atom_height);
			atomic_easymode.speed = 8;
			atomic_easymode.angular_speed = 0.2;
			atomic_easymode.fuel = 400;
			atomic_easymode.charge = 600;
			atomic_easymode.fuel_per_tick = 1;
			atomic_easymode.charge_per_tick = 0.75;
			
			atomic_hardmode = new ShipDefinition();
			atomic_hardmode.image = Assets.spacecraft_atomic;
			atomic_hardmode.img_size = new b2Vec2(Assets.sc_atom_width, Assets.sc_atom_height);
			atomic_hardmode.speed = 4;
			atomic_hardmode.angular_speed = 0.1;
			atomic_hardmode.fuel = 450;
			atomic_hardmode.charge = 750;
			atomic_hardmode.fuel_per_tick = 1;
			atomic_hardmode.charge_per_tick = 1;
		}
	}
}