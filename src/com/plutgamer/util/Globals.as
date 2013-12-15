package com.plutgamer.util 
{
	import Box2D.Common.Math.b2Vec2;
	/**
	 * ...
	 * @author Stijn Brouwer
	 */
	public class Globals 
	{
		public static var phys_ratio:Number = 7;
		public static var phys_gravity:b2Vec2 = new b2Vec2(0, 0);
		
		public static var last_level:int = 0;
	}
}