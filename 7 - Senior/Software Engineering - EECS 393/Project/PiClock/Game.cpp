namespace PiClock.Alarm.Games
{  
  public class Game {
    private:
      Difficulty setting;

    protected:
      Game(Difficulty setting) { this.setting = setting; } //starts the game
      Difficulty getDifficulty() { return this.setting; }

    public:
      virtual boolean hasFinished(); //returns true if the game is over, and false otherwise
      virtual string toString(); //returns a formatted string representation of the game (for testing purposes) 
  }   
}  