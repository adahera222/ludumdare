package com.plutgamer.util 
{
	import Box2D.Common.Math.b2Vec2;
	import com.plutgamer.util.ShipDefinition;
	import org.flixel.FlxGroup;
	
	public class LevelDefinition 
	{
		public var name:String = "TEST";
		public var hard:Boolean;
		public var bg_image:Class;
		public var ship:ShipDefinition;
		public var start_pos:b2Vec2;
		public var start_angle:Number;
		public var fuelstation_pos:b2Vec2;
		public var fuelstation_angle:Number;
		public var astroid_pos:Array = [];
	}
}