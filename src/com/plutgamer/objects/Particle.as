package com.plutgamer.objects 
{
	import com.plutgamer.assets.Assets;
	import org.flixel.FlxParticle;
	
	public class Particle extends FlxParticle 
	{
		public function Particle() 
		{
			super();
			loadGraphic(Assets.particle, true, false, 5, 5);
			scale.make(2, 2);
			addAnimation("die", [1, 2, 3, 4, 5, 6], 2, false);
			exists = false;
			lifespan = 0.01;
		}
		
		public override function onEmit():void
		{
			play("die", true);
		}
	}
}