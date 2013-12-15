package com.plutgamer.states 
{
	import Box2D.Dynamics.Joints.b2WeldJointDef;
	import Box2D.Common.Math.b2Vec2;
	import com.plutgamer.assets.Assets;
	import com.plutgamer.objects.Astroid;
	import com.plutgamer.objects.FuelStation;
	import com.plutgamer.objects.PlayerShip;
	import com.plutgamer.objects.ShipSensor;
	import com.plutgamer.util.DockingHandler;
	import com.plutgamer.util.Globals;
	import com.plutgamer.util.LevelDefinition;
	import org.flixel.FlxCamera;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxObject;
	import org.flixel.plugin.photonstorm.FlxBar;
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.*;
	
	/**
	 * Play state
	 * @author Stijn Brouwer
	 */
	public class PlayState extends FlxState 
	{
		public var phys_world:b2World;
		
		public var level:LevelDefinition;
		
		public var background:FlxGroup;
		public var foreground:FlxGroup;
		public var headsup:FlxGroup;
		
		public var bg:FlxSprite;
		public var player:PlayerShip;
		public var particles:FlxEmitter;
		public var fuelstation:FuelStation;
		public var shipsensor:ShipSensor;
		public var fuelbar:FlxBar;
		public var chargebar:FlxBar;
		
		public var dockinghandler:DockingHandler;
		
		public var camera:FlxCamera;
		
		public var playing:Boolean = true;
		
		public function PlayState(Level:LevelDefinition)
		{
			super();
			
			level = Level;
		}
		
		override public function create():void
		{
			phys_world = new b2World(Globals.phys_gravity, true);
			
			background = new FlxGroup();
			foreground = new FlxGroup();
			headsup = new FlxGroup();
			
			setup_level();
			
			add(background);
			add(foreground);
			add(headsup);
			
			/*camera = new FlxCamera(0, 0, FlxG.width, FlxG.height);
			camera.setBounds(-150, -150, FlxG.width + 150, FlxG.height + 150);
			camera.follow(player, FlxCamera.STYLE_TOPDOWN);
			FlxG.addCamera(camera);*/
		}
		
		public function win():void
		{
			switch_win();
		}
		
		public function switch_win():void
		{
			FlxG.switchState(new WinState());
		}
		
		public function setup_level():void
		{
			bg = new FlxSprite(0, 0, Assets.bg_testlevel);
			bg.scrollFactor.make();
			background.add(bg);
			
			particles = new FlxEmitter();
			particles.maxSize = 64;
			foreground.add(particles);
			
			player = new PlayerShip(level.start_pos.x, level.start_pos.y, level.start_angle, level.ship, particles, phys_world, this);
			foreground.add(player);
			
			shipsensor = new ShipSensor(level.fuelstation_pos.x, level.fuelstation_pos.y, level.fuelstation_angle, 30, 7, phys_world);
			foreground.add(shipsensor);
			
			fuelstation = new FuelStation(level.fuelstation_pos.x, level.fuelstation_pos.y, level.fuelstation_angle, phys_world, shipsensor, this);
			foreground.add(fuelstation);
			
			fuelbar = new FlxBar(FlxG.width / 4 - 150 / 2, FlxG.height / 10 * 9 - 14 / 2, FlxBar.FILL_LEFT_TO_RIGHT, 150, 14);
			fuelbar.scrollFactor.make();
			
			chargebar = new FlxBar(FlxG.width / 4 * 3 - 150 / 2, FlxG.height / 10 * 9 - 14 / 2, FlxBar.FILL_RIGHT_TO_LEFT, 150, 14);
			chargebar.scrollFactor.make();
			
			fuelbar.setRange(0, level.ship.fuel);
			fuelbar.currentValue = level.ship.fuel;
			chargebar.setRange(0, level.ship.charge);
			chargebar.currentValue = level.ship.charge;
			
			dockinghandler = new DockingHandler();
			phys_world.SetContactListener(dockinghandler);
			
			var i:Number = 0;
			var j:Number = level.astroid_pos.length;
			while (i != j)
			{
				var astroid:Astroid = new Astroid(level.astroid_pos[i][0], level.astroid_pos[i][1], phys_world);
				foreground.add(astroid);
				
				i++;
			}
			
			headsup.add(new FlxSprite(FlxG.width / 4 - 150 / 2 - 5, FlxG.height / 10 * 9 - 14 / 2 - 5, Assets.barbg));
			headsup.add(new FlxSprite(FlxG.width / 4 * 3 - 150 / 2 - 5, FlxG.height / 10 * 9 - 14 / 2 - 5, Assets.barbg));
			headsup.add(fuelbar);
			headsup.add(chargebar);
		}
		
		public function consume_energy(Fuel:Boolean):void
		{
			if (Fuel && playing)
			{
				if (fuelbar.currentValue > 0)
					fuelbar.currentValue = fuelbar.currentValue - level.ship.fuel_per_tick;
				else
					no_fuel();
			}
			else if (!Fuel && playing)
			{
				if (chargebar.currentValue > 0)
					chargebar.currentValue = chargebar.currentValue - level.ship.charge_per_tick;
				else
					no_fuel();
			}
		}
		
		private function no_fuel():void
		{
			playing = false;
			player.no_fuel();
			lose();
		}
		
		public function lose():void
		{
			FlxG.switchState(new LoseState);
		}
		
		override public function update():void
		{
			phys_world.Step(FlxG.elapsed, 10, 10);
			super.update();
		}
	}
}