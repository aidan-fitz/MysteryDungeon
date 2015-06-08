# MysteryDungeon
A dungeon crawling game; Aidan and Ethan's final project for APCS 2.
Final Project Idea
Dungeon Crawling Game
Repo: https://github.com/aidan-fitz/MysteryDungeon


Description:

In our game, the user will play as the hero traveling through a series of dungeons to find treasure. The hero will have to go through the maze-like dungeon filled with enemies that the hero will fight through turn-based combat.  The hero can pick up mob drops and loot chests to find supplies and gold, which the user can spend at a shop to buy gear.  Once the hero reaches the end of the dungeon, they will have their toughest challenge yet: defeating the endgame boss.  The hero, now equipped with the boss’ op gear, will be able to take a victory lap back through the maze and kill everything in their path with ease.

Roadmap of goals:
Make hero class and code movement
make an enemy class
make the maze generator (start with 16x16 mazes and then increase the limit to 128x96)
random placement of pokemon, items, stair tiles
world scrolling
restrict movement to the confines of the maze and implement pathfinding for mobs
implement sprites to represent the hero and enemies.
Pokémon parody - use the same set of sprites (Pikachu) and recolor using Processing (multiply to make shades and tints) - also somewhat like Pac-Man where all the enemies look the same
the bosses are Raichu (modified to look like Satan or something)
Make a shop where the hero can spend their gold
make “fog of war” feature where the hero can only see a certain distance in front of them. (Floor class has private variables for enemies, items, tiles; you can only access stuff in your field of view
Turn based – actions in priority queue (hero 0, enemies 4) – use a min heap
theme music: http://picosong.com/download/3GL2/

Base project:
A hero goes through a dungeon while fighting enemies. The hero will reach the end of the maze and win or will die trying.

Extra touches:
Monster house

Inspired by: http://bulbapedia.bulbagarden.net/wiki/Mystery_Dungeon_game_mechanics

**Playable Versions**
**Week 1:** commit cc731e448f47bc00167962351ee919d12f104a05

Log:
- **2015-05-26** Removed references to parteners in the decription.  We are no longer planning to implement this feature because we already have enough work as it is.
- **2015-05-27** Aidan fixed bugs in `Floor.java`. Running it in a terminal prints a blank map (just wall tiles).
- **2015-05-29** Aidan converted the repo to work in Processing.
- **2015-06-02** Aidan fixed the `makeRoom` method and plugged it into `makeLayout`
- **2015-05-26** Removed references to partners in the description.  We are no longer planning to implement this feature because we already have enough work as it is.
- **2015-05-27** Aidan fixed bugs in `Floor.java`. Running it in a terminal prints a blank map (just wall tiles).
- **2015-05-29** Aidan merged code from his branch.  The dungeon now generates in processing.
- **2015-05-31** Ethan merged code from his branch.  Player movement now works and responsibilities for each class have now been assigned.  the MysteryDungeon class is the driver and stores the booleans for player movement as well as handles keyboard input.  Creatures draw themselves.  Dungeon is responsible for attacks.  The dungeon will check to see if the enemy is in range of the player.  The tile class draws itself.  Hero extends creature and has processes hero movement.
- **2015-06-2** Ethan added attack.  Hero can now attack any enemy within a one tile range.
- **2015-06-3** Ethan merged Aidan's fix for the room generation.
- **2015-06-4** Ethan added code so that the hero doesn't go through walls.  It didn't work because the coordinates were messed up (the hero was shifted over by one) so he will continue to work on that in class tomorrow.
- **2015-06-5** Ethan changed the hero to work with x,y instead of r,c. 
- **2015-06-6** Ethan merged Aidan's code so now maps are not randomly generated.  Movement restrictions added to all directions.
- **2015-06-7** Ethan textured all characters and tiles, added random and targeted enemy movement, added attack screen (combat not implemented yet), and fired all bugs in movement.
