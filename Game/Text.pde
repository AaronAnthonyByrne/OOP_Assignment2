class Text
{

  Text()
  {
  }

  void drawText()
  {
    textSize(35);
    fill(255);
    textAlign(CENTER);

    //Text for the top of the screen displaying currentRound bullet coold down and ammo.
    text("Round", width/2, height -50);
    text(currentRound, width/2, height -90);

    if (player.bulletCoolDown !=250)
    {
      fill(255, 0, 0);
      textSize(45);
      text(player.ammo, width-110, height -80);
    }

    //Text at the bottom of the screen
    text("Health", width*.25, 30);
    stroke(255, 0, 0);
    fill(255, 0, 0, 90);

    //drawing of the health boxes
    for (int i = 0; i <player.health; i ++)
    {
      rect(width*.20+(50*i), 50, 30, 30);
    }

    //score
    fill(255);
    text("Score", width/2, 25);
    text(score, width/2, 65);
    text("Enemies Left :", width*.25, 25);
    text(remainingEnemies, width*.25, 65);

    //when the game is completed
    if (rComplete)
    {
      fill(0, 255, 0);
      textSize(70);
      text("Round Complete", width/2, height/2);
      if (millis()- startTime > timeDisplay)
      {
        rComplete = false;
      }
    }
  }
}