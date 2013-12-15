package com.plutgamer.util 
{
	import org.flixel.FlxG;
	import com.plutgamer.states.PlayState;
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.Contacts.b2Contact;
	
	public class DockingHandler extends b2ContactListener 
	{
		public function DockingHandler() 
		{
		}
		
		override public function BeginContact(contact:b2Contact):void
		{
			if ((contact.GetFixtureA().GetBody().GetUserData() == "sensor" &&
			     contact.GetFixtureB().GetBody().GetUserData() == "player") ||
				(contact.GetFixtureA().GetBody().GetUserData() == "player" &&
			     contact.GetFixtureB().GetBody().GetUserData() == "sensor"))
			{
				((PlayState)(FlxG.state)).win();
			}
			
			if ((contact.GetFixtureA().GetBody().GetUserData() == "astroid" &&
			     contact.GetFixtureB().GetBody().GetUserData() == "player") ||
				(contact.GetFixtureA().GetBody().GetUserData() == "player" &&
			     contact.GetFixtureB().GetBody().GetUserData() == "astroid"))
			{
				((PlayState)(FlxG.state)).lose();
			}
		}
	}
}