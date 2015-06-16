# Darkest Dungeon
A dungeon crawling game; Aidan and Ethan's final project for APCS 2.

See `PROPOSAL.md` for the original project proposal.

## Controls

- Title card: click anywhere to start playing.
- Dungeon mode: arrow keys to move.
- Battle mode: up/down arrow to adjust power, space to attack/defend, F to flee.

## Inspirations

- Dungeon crawling part: _Pok&#233;mon Mystery Dungeon_
- Battle mechanics:  _Sorcery!_
- Title card: some game called _Darkest Dungeon_ because Ethan thought their title card looked cool

## Soundtracks

- Title theme: "Uptown Funk" by Mark Ronson ft. Bruno Mars (8-bit remix)
- Dungeon theme: Lavender Town theme
- Battle theme: Pok&#233;mon RSE battle theme (8-bit remix)

## Playable Versions
- **Week 1:** commit `cc731e448f47bc00167962351ee919d12f104a05`
- **Week 2:** commit `339330fed423288dd468839dc35f39243a0f8e51`
- '**Week 3:** commit '1073427719e6757f123e2d7aa6921172c1b8e7c3'

## Log
- **2015-05-26** Removed references to parteners in the decription.  We are no longer planning to implement this feature because we already have enough work as it is.
- **2015-05-27** Aidan fixed bugs in `Floor.java`. Running it in a terminal prints a blank map (just wall tiles).
- **2015-05-29** Aidan converted the repo to work in Processing.
- **2015-06-02** Aidan fixed the `makeRoom` method and plugged it into `makeLayout`
- **2015-05-26** Removed references to partners in the description.  We are no longer planning to implement this feature because we already have enough work as it is.
- **2015-05-27** Aidan fixed bugs in `Floor.java`. Running it in a terminal prints a blank map (just wall tiles).
- **2015-05-29** Aidan merged code from his branch.  The dungeon now generates in processing.
- **2015-05-31** Ethan merged code from his branch.  Player movement now works and responsibilities for each class have now been assigned.  the MysteryDungeon class is the driver and stores the booleans for player movement as well as handles keyboard input.  Creatures draw themselves.  Dungeon is responsible for attacks.  The dungeon will check to see if the enemy is in range of the player.  The tile class draws itself.  Hero extends creature and has processes hero movement.
- **2015-06-02** Ethan added attack.  Hero can now attack any enemy within a one tile range.
- **2015-06-03** Ethan merged Aidan's fix for the room generation.
- **2015-06-04** Ethan added code so that the hero doesn't go through walls.  It didn't work because the coordinates were messed up (the hero was shifted over by one) so he will continue to work on that in class tomorrow.
- **2015-06-05** Ethan changed the hero to work with x,y instead of r,c. 
- **2015-06-06** Ethan merged Aidan's code so now maps are not randomly generated.  Movement restrictions added to all directions.
- **2015-06-07** Ethan textured all characters and tiles, added random and targeted enemy movement, added attack screen (combat not implemented yet), and fired all bugs in movement.
- **2015-06-09** Aidan renamed repo so it works for in-class demos
- **2015-06-10** Aidan cleaned up the creature class and added a random tile method
- **2015-06-11** Aidan implemented random generation of creatures but it is buggy
- **2015-06-12** Ethan fixed Aidan's changes so now all creatures spawn randomly and added a temporary and crappy start screen.
- **2015-06-13** Aidan cleaned up the code a little, added stairs + text saying what floor you're on.  Ethan added hearts to combat screen and cleaned up code so enemy movement and initiation of combat works correctly.
- **2015-06-14** Aidan added the multiple floors code (stairs callback) and made the hero put in a random position each time it goes to a new floor. Also brought back the other maps. Also consolidated all the image objects into one class (`SpriteSet`) to use less memory and make access easier. Also added soundtracks. Ethan added creature combat and it works correctly, fixed all non-combat screens, and did a whole ton of misc. changes to make the game work. Also added a title and game over image.
