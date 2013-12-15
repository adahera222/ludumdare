package com.plutgamer.objects 
{
	import com.plutgamer.assets.Assets;
	import com.plutgamer.states.PlayState;
	import com.plutgamer.util.Globals;
	import com.plutgamer.util.ShipDefinition;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxParticle;
	import org.flixel.FlxSound;
	
	import org.flixel.FlxG;
	
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.*;
	import Box2D.Common.Math.b2Vec2;
	
	/**
	 * The player's ship
	 * @author Stijn Brouwer
	 */
	public class PlayerShip extends PhysicsObject 
	{
		public var ship_definition:ShipDefinition;
		public var state:PlayState;
		public var wasthrusting:Boolean = false;
		public var thrustplaying:Boolean = false;
		public var thrustsound:FlxSound;
		
		public var engine_emitter:FlxEmitter;
		public var flame_particle:FlxParticle;
		
		public var has_fuel:Boolean = true;
		
		public function PlayerShip(X:Number, Y:Number, Angle:Number, ShipDef:ShipDefinition, FlameEmitter:FlxEmitter, World:b2World, State:PlayState) 
		{
			engine_emitter = FlameEmitter;
			state = State;
			ship_definition = ShipDef;
			
			super(X, Y, ship_definition.img_size.x, ship_definition.img_size.y, World);
			loadGraphic(ship_definition.image);
			
			createbody();
			phys_obj.SetSleepingAllowed(false);
			phys_obj.SetAngle(Angle);
			phys_obj.SetUserData("player");
		}
		
		override public function update():void
		{
			state.consume_energy(false);
			handle_input();
			super.update();
		}
		
		public function no_fuel():void
		{
			has_fuel = false;
		}
		
		private function handle_input():void
		{
			if (has_fuel)
			{
				wasthrusting = thrustplaying;
				thrustplaying = false;
				
				var fuelflag:Boolean = false;
				if (FlxG.keys.W || FlxG.keys.UP)
				{
					for (var i:int = 0; i < 64; i++) 
					{
						flame_particle = new Particle();
						engine_emitter.add(flame_particle);
					}
					engine_emitter.x = (Math.cos(phys_obj.GetAngle() - Math.PI / 2) * -6 + phys_obj.GetWorldCenter().x) * Globals.phys_ratio;
					engine_emitter.y = (Math.sin(phys_obj.GetAngle() - Math.PI / 2) * -6 + phys_obj.GetWorldCenter().y) * Globals.phys_ratio;
					engine_emitter.emitParticle();
					
					thrustplaying = true;
					fuelflag = true;
					thrust_forward();
				}
				else
				{
					thrustplaying = false;
				}
				if (FlxG.keys.D || FlxG.keys.RIGHT)
				{
					fuelflag = true;
					thrust_rcs(true);
				}
				if (FlxG.keys.A || FlxG.keys.LEFT)
				{
					fuelflag = true;
					thrust_rcs(false);
				}
				
				if (thrustplaying == true && wasthrusting == false)
				{
					thrustsound = FlxG.play(Assets.thrust, 1.0, true)
				}
				else if (thrustplaying == false && wasthrusting == true)
				{
					thrustsound.stop();
				}
				
				if (fuelflag)
					state.consume_energy(true);
			}
		}
		
		private function thrust_forward():void
		{
			var origin:b2Vec2 = phys_obj.GetWorldCenter(); // - new b2Vec2(Math.cos(phys_obj.GetAngle() - Math.PI / 2) * -1, Math.sin(phys_obj.GetAngle() - Math.PI / 2) * -1)
			/*origin.x = origin.x - Math.cos(phys_obj.GetAngle() - Math.PI / 2) * -1;
			origin.y = origin.y - Math.sin(phys_obj.GetAngle() - Math.PI / 2) * -1;*/
			var force:b2Vec2 = new b2Vec2(Math.cos(phys_obj.GetAngle() - Math.PI / 2) * ship_definition.speed, Math.sin(phys_obj.GetAngle() - Math.PI / 2) * ship_definition.speed);
			
			phys_obj.ApplyImpulse(force, origin);
		}
		
		private function thrust_rcs(positive:Boolean):void
		{
			phys_obj.SetAngularVelocity(phys_obj.GetAngularVelocity() + (positive ? ship_definition.angular_speed : -ship_definition.angular_speed));
		}
	}
}