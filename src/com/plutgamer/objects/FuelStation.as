package com.plutgamer.objects 
{
	import Box2D.Collision.*;
	import Box2D.Common.*;
	import Box2D.Dynamics.*;
	import Box2D.Common.Math.*;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.*;
	import com.plutgamer.states.PlayState;
	import com.plutgamer.util.Globals;
	import com.plutgamer.assets.Assets;
	import org.flixel.FlxSprite;
	
	public class FuelStation extends PhysicsObject 
	{
		public var sensor:ShipSensor;
		public var state:PlayState;
		
		public function FuelStation(X:Number, Y:Number, Angle:Number, World:b2World, Sensor:ShipSensor, State:PlayState) 
		{
			state = State;
			phys_density = 8;
			sensor = Sensor;
			super(X, Y, Assets.fstat_width, Assets.fstat_height, World);
			loadGraphic(Assets.fuelstation);
			
			createbody();
			phys_obj.SetSleepingAllowed(false);
			phys_obj.SetAngle(Angle);
			phys_obj.SetUserData("fstat");
			
			sensor.phys_obj.SetPositionAndAngle(new b2Vec2(Math.cos(phys_obj.GetAngle() - Math.PI / 2) * -2 + phys_obj.GetWorldCenter().x, Math.sin(phys_obj.GetAngle() - Math.PI / 2) * -2 + phys_obj.GetWorldCenter().y), Angle);
		}
		
		override public function update():void
		{
			sensor.phys_obj.SetPositionAndAngle(new b2Vec2(Math.cos(phys_obj.GetAngle() - Math.PI / 2) * -2 + phys_obj.GetWorldCenter().x, Math.sin(phys_obj.GetAngle() - Math.PI / 2) * -2 + phys_obj.GetWorldCenter().y), phys_obj.GetAngle());
			
			super.update();
		}
		
		override public function createbody():void
		{
			var shape:b2PolygonShape = new b2PolygonShape();
			shape.SetAsBox((width / 2) / Globals.phys_ratio, (height / 3) / Globals.phys_ratio); //Yeah, uhm... let's just use this quick hack so we can actually win the game.
			
			phys_fixdef = new b2FixtureDef();
			phys_fixdef.density = phys_density;
			phys_fixdef.restitution = phys_restitution;
			phys_fixdef.friction = phys_friction;
			phys_fixdef.shape = shape;
			
			phys_bodydef = new b2BodyDef();
			phys_bodydef.position.Set((x + (width / 2)) / Globals.phys_ratio, (y + (height / 2)) / Globals.phys_ratio);
			phys_bodydef.angle = phys_angle;
			phys_bodydef.type = phys_type;
			
			phys_obj = phys_world.CreateBody(phys_bodydef);
			phys_obj.CreateFixture(phys_fixdef);
		}
	}
}