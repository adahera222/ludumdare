package com.plutgamer.objects 
{
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.*;
	import Box2D.Dynamics.b2FixtureDef;
	import com.plutgamer.util.Globals;
	import com.plutgamer.assets.Assets;
	
	public class ShipSensor extends PhysicsObject 
	{
		public function ShipSensor(X:Number, Y:Number, Angle:Number, Width:Number, Height:Number, World:b2World) 
		{
			super(X, Y, Assets.fstat_width, Assets.fstat_height, World);
			makeGraphic(Width, Height);
			alpha = 0;
			
			createbody();
			phys_obj.SetSleepingAllowed(false);
			phys_obj.SetAngle(Angle);
			phys_obj.SetUserData("sensor");
		}
		
		override public function createbody():void
		{
			var shape:b2PolygonShape = new b2PolygonShape();
			shape.SetAsBox((width / 2) / Globals.phys_ratio, (height / 2) / Globals.phys_ratio);
			
			phys_fixdef = new b2FixtureDef();
			phys_fixdef.density = phys_density;
			phys_fixdef.restitution = phys_restitution;
			phys_fixdef.friction = phys_friction;
			phys_fixdef.isSensor = true;
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