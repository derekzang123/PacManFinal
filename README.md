# PacManFinal

For my final project, I am going to implement Pac-Man in Processing. The rules are simple enough: using the arrow keys, the player guides Pac-Man up, down, left, and right through a maze with dots for him to eat. The goal of the game is to clear the maze, but the player must also watch out for the ghosts which will chase after and try to capture him. Aside from recreating the iconic arcade game, I wanted to focus on understanding and ultimately adding my own twist on the different movement patterns of the ghosts: “chase” (actively follow Pac-Man through the maze), “scatter” (momentarily return to their respective home corners), and “frightened” (aimlessly wander the maze while Pac-Man is experiencing the effects of the energizer pellets). 

## Prototype (Old)

[PacMan Prototype](https://docs.google.com/document/d/1xaSTikDZCKU--RdFzY4QQBtQi3BaqcJQOtfI4waUovk/edit?usp=sharing/)

## Prototype (Updated)

[PacMan Prototype](https://docs.google.com/document/d/1tFENJMMc-JYdUTLWLbLLaIP200BlndF6zN4jRJGreq4/edit?usp=sharing/)

## DevLog

**5/23**

  I set up all my tabs according to my original UML diagram and completed the MazeTile class. 
  
**5/24**
  
  Continued working on MazeTile class to fix some issues with displaying and fixing to screen.
  
**5/25**

  Continued working on MazeTile display function. 
  
**5/26**

  Started looking for PImages online and added them to data folder. 
  
**5/27**

  Completed the Entity interface and wrote PacMan class's basic, implemented methods. Worked on Pellet and Fruit static classes. 
  
**5/28-5/31**

  Added gifs to data folder for PacMan movement and directions. Modifed controller class from Mr. K's website to also have UP and DOWN features. Added Ghost gifs to     data folder. 
  
**6/01**

  Started working on Ghost's main simulate() method. Finished other methods in Ghost class like render(), checkwall(), and isDead(). Started working on GameBoard         class: finished constructor, eatDotAt(), and isWall() methods. 
  
**6/02**

  Added setup() and draw() methods to my Main tab. Worked on fixing bugs with Ghost/GameBoard interaction, mainly in regards to the GameBoard method: isWall().
  
**6/03**
  
  Got rid of unnecessary classes. Still working to try to fix Ghost movement when the GameBoard is first initialized.
  
**6/04-6/07**
  
  Continued trying to address the initial Ghost movements. Changed loadGameBoard() method in GameBoard class to accept a String[][] as a parameter. Should be             easier when I decide to make levels. 
  
**6/08-6/11**

  Scrapped the MazeTile class because my GameBoard is already structured as a grid. I don't need a class to help me examine each individual tile in the grid. Finally     got the Ghost class's simulate() method to work how I want it to. 

**6/12**

   Designed my first twomazes and stored them in new Level tab. No More random generation! loadGameBoard() in Main tab helps call previous and subsequent levels.          Modified PacMan's collision logic so that he does not overlap with walls as much. Made the Ghost target for respawning a bit bigger.
   
**6/13**
  
  Added my third and fourth mazes. Added level toggle options to Main/keyPressed(). Added logic to have levels transition when all pellets are gone. Added score on       top-left corner. Deleted Fruit class and made final touches.  
   
