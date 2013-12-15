package com.plutgamer.util 
{
	import Box2D.Common.Math.b2Vec2;
	public class ShipDefinition 
	{
		public var image:Class;
		public var img_size:b2Vec2;
		public var speed:Number;
		public var angular_speed:Number;
		public var fuel:Number;
		public var charge:Number;
		public var fuel_per_tick:Number;
		public var charge_per_tick:Number;
	}
}