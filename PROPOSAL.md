This is the archival copy of our project proposal.

# Final Project Idea: Dungeon Crawling Game

## Description

In our game, the user will play as the hero traveling through a series of dungeons to find treasure. The hero will have to go through the maze-like dungeon filled with enemies that the hero will fight through turn-based combat.  The hero can pick up mob drops and loot chests to find supplies and gold, which the user can spend at a shop to buy gear.  Once the hero reaches the end of the dungeon, they will have their toughest challenge yet: defeating the endgame boss.  The hero, now equipped with the boss' op gear, will be able to take a victory lap back through the maze and kill everything in their path with ease.

## Roadmap of goals
- Make hero class and code movement
- make an enemy class
- make the maze generator (start with 16x16 mazes and then increase the limit to 128x96)
- random placement of pokemon, items, stair tiles
- world scrolling
- restrict movement to the confines of the maze and implement pathfinding for mobs
- implement sprites to represent the hero and enemies.
- Pokémon parody - use the same set of sprites (Pikachu) and recolor using Processing (multiply to make shades and tints) - also somewhat like Pac-Man where all the enemies look the same
- the bosses are Raichu (modified to look like Satan or something)
- Make a shop where the hero can spend their gold
- make “fog of war” feature where the hero can only see a certain distance in front of them. (Floor class has private variables for enemies, items, tiles; you can only access stuff in your field of view
- Turn based – actions in priority queue (hero 0, enemies 4) – use a min heap
- theme music: http://picosong.com/download/3GL2/

## Base project
A hero goes through a dungeon while fighting enemies. The hero will reach the end of the maze and win or will die trying.

## Extra touches
Monster house

## Inspired by
[Pok&#233;mon Mystery Dungeon, sort of](http://bulbapedia.bulbagarden.net/wiki/Mystery_Dungeon_game_mechanics)
