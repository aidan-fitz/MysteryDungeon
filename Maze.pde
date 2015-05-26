public class Maze {
  /* Maze class needs to:
   displays maze on screen and calling the display methods for all other objects
   lets you remove or add an object to the maze
   tells you whether a given spot is valid for an object to move to or be placed on
   tells you what's at a given spot
   gives you a list of valid adjacent spots
   
   let's discuss this a little more on tuesday --aidan
   */
   private Floor floor;
   public boolean isValidSpot(int r, int c){
   	  return floor.getTile(r,c).equals(' ');
   }
   public char charAtSpot(int r, int c){
   	  return floor.getTile(r,c);
   }
   public void addChar(char a, int r, int c){
   	  floor.setTile(r,c,a);
   }
   	  
   
}

