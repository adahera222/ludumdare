package com.plutgamer.assets 
{
	/**
	 * @author Stijn Brouwer
	 */
	public class Assets 
	{
		[Embed(source = "atomic_spacecraft.png")] public static var spacecraft_atomic:Class; public static var sc_atom_width:Number = 32; public static var sc_atom_height:Number = 98;
		
		[Embed(source = "fuelstation.png")] public static var fuelstation:Class; public static var fstat_width:Number = 125; public static var fstat_height:Number = 23;
		
		[Embed(source = "testlevel_bg.png")] public static var bg_testlevel:Class;
		
		[Embed(source = "astroid_anim.png")] public static var astroid:Class;
		
		[Embed(source = "mainmenu.png")] public static var mainmenu:Class;
		
		[Embed(source = "Select.mp3")] public static var select:Class;
		[Embed(source = "Win.mp3")] public static var win:Class;
		[Embed(source = "Thrust.mp3")] public static var thrust:Class;
		[Embed(source = "Asteroid.mp3")] public static var lose:Class;
		
		[Embed(source = "particle.png")] public static var particle:Class;
		[Embed(source = "barbg.png")] public static var barbg:Class;
	}
}