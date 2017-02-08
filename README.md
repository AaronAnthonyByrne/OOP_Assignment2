# Zombie Attack
The follwing game is built for the second OOP assignemnt for Bryan Duggan

#YouTube Video
[![Video](http://img.youtube.com/vi/k09hN_aEzC8/0.jpg)](https://www.youtube.com/watch?v=k09hN_aEzC8)

#Concept
We where given the brief over Christmas, we had to make a game. I had recently being plating
a game on the internet and I knew I wanted to replicate that as much as possible. The game is 
call a <b>"Top Down Shooter"</b> it is a 2D game where you are looking at it from above.

I started off doing a mid western themed one but then changed to a zombie one because who doesn't
like killing Zombies. 

#Features
This game has a few features

~Menu
	~ The menu displays the name of the game, the controls, the pickups within the game and 
		what the enemies look like.
~Game Screen
	~ Enemies spaw off the screen and make their way towards you at a random speed.
	~ Powerup will also spawn at random intervals, you could get a laser, machinegun or health powerup
	~ The Character is also on the screen
	~ The amount of enemies spawing displays in the top left.
	~ the round diplays top right
	~ Helath bar indicated at the bottom with boxes
	~ Ammo for when you collect the powerups is displayed beside the health bar.
~Game Over
	~ Displays the round which you made it too
	~ it also displays the total number of kills, shots fired, hit accuracy and final Score
~Music
	~ The game has four sounds
		~Background music
		~When you hit a zombie
		~When you get a powerup
		~When you fire a bullet
		
#Controls
~ W, A, S, D move the character
~ The mouse is used to aim and right click to fire.
~ ENTER to start the game when at the menu, also when game is over to go back to menu

#Functionality
The game uses if statements to switch through the splash screens. It checks to see if the enter
key was pressed for starting the game and reseting it.

~Menu
	~ The menu screen is mostly text displaying the name of the game, the controls, the powerups and the enemies sprite.
		The menu waits till the user pushed enter. The message "Press enter to begin" appears to be flashing. This is achieved
		though the millis() function to help timing the text off and on.
~Game Screen
	~ Is made up of many differant objects
		~Classes
			~ Enemy which is a extension of the gOject abstract class. In the Enemy class we work out where the player is and where the 
			enemy is and get the enemy to move towrds the player. 
			~ Powerup class which spawns the powerups extends the gOject class and implents the charge intertface.
			it draws and spawns the powerups in random location across the screen. There is also a collision check 	to see if the player has
			picked up the powerup.
			~The Bullet class extends the gOject abstract class and is responsible for the trajectory of the bullet when fired.
			~The player class checks for the keypresses and for the mouse clicked so that the bullets get fired.
		~Game Class
			~Where most of the code was generated. The thing I am most proud of is the Collision Handler. It took a few tries to get it right but eventually I got there.

#Key Notes
~ The program contains Inheritance, Polymorphism and an abstract class.
~ The round and enimies are read in using a XML file.
~ There is a interface class, I couldn't get it to work properly but I left it in to show that I tried
~ The enemies are spawned in random locations off screen.
~ The game over screen displays the rounds, score, hit accuracy and shots fired.
~ Sound Files are used. 

#Known Bugs
My game still contains bug which I couldn't fix.
~ Enemies arraylist kept adding enemies. So more enemies spawn tham are needed.
~ When the laser spwans on screen the enemies outer white circle turns blue.
~ Interface wasn't used properly

#What Next?
I will continue to work on the game as I did have fun doing it. I will wait until I am graded first
then I will fix the bugs and implement the follwing:
~ I want to add harder enemies who require more than one shot to kill.
~ I would like to limit the players view when the levels get harder, the zombies would appear many seconds before they need to.
~ Boss Battles, have a big enemy at the end like the more traditional games.
