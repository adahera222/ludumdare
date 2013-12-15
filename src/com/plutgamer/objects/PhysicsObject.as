package com.plutgamer.objects 
{
	import com.plutgamer.util.Globals;
	
	import org.flixel.FlxSprite;
	
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.*;
	
	/**
	 * An object with Box2D physics
	 * @author Stijn Brouwer
	 */
	public class PhysicsObject extends FlxSprite 
	{
		public var phys_fixdef:b2FixtureDef;
		public var phys_bodydef:b2BodyDef;
		public var phys_obj:b2Body;
		
		public var phys_world:b2World;
		
		public var phys_friction:Number = 0.8;
		public var phys_restitution:Number = 0.3;
		public var phys_density:Number = 0.7;
		
		public var phys_angle:Number = 0;
		public var phys_type:uint = b2Body.b2_dynamicBody;
		
		public function PhysicsObject(X:Number, Y:Number, Width:Number, Height:Number, World:b2World) 
		{
			super(X, Y);
			
			width = Width;
			height = Height;
			phys_world = World;
		}
		
		public function createbody():void
		{
			var shape:b2PolygonShape = new b2PolygonShape();
			shape.SetAsBox((width / 2) / Globals.phys_ratio, (height / 2) / Globals.phys_ratio);
			
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
		
		override public function update():void
		{
			x = (phys_obj.GetPosition().x * Globals.phys_ratio) - width / 2;
			y = (phys_obj.GetPosition().y * Globals.phys_ratio) - height / 2;
			angle = phys_obj.GetAngle() * (180 / Math.PI);
			
			super.update();
		}
		
		override public function kill():void
		{
			phys_world.DestroyBody(phys_obj);
			super.kill();
		}
	}
}