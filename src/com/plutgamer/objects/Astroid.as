package com.plutgamer.objects 
{
	import Box2D.Dynamics.b2World;
	import com.plutgamer.assets.Assets;
	
	public class Astroid extends PhysicsObject 
	{
		public function Astroid(X:Number, Y:Number, World:b2World) 
		{
			super(X, Y, 30, 30, World);
			scale.make(1.3, 1.3);
			loadGraphic(Assets.astroid, true, false, 30, 30);
			addAnimation("idle", [1, 2, 3, 4, 5, 6, 7], 3, true);
			play("idle");
			createbody();
			phys_obj.SetUserData("astroid");
		}
	}
}