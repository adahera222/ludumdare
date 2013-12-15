package com.plutgamer 
{
	import org.flixel.FlxGame;
	
	import com.plutgamer.states.Levels;
	import com.plutgamer.states.Ships;
	
	import com.plutgamer.states.MenuState;
	
	[SWF(backgroundColor = "0x000000")]
	
	/**
	 * Main game class.
	 * @author Stijn Brouwer
	 */
	public class Game extends FlxGame 
	{
		public function Game() 
		{
			Ships.load_definitions();
			Levels.load_definitions();
			
			super(400, 300, MenuState, 2);
		}
	}
}