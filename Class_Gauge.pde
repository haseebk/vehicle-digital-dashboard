class Gauge
{
  float Minimum;
  float Maximum;
  float CurrentValue;
  String Units;

  float PositionX;
  float PositionX1;
  float PositionY;
  float PositionY1;
  
  float Size;
  int Colour;
  int strokeColour;
  float setCurrentValue(float x, float Maximum, float Minimum) {
    if (x <= Maximum && x >= Minimum) {
      CurrentValue = x;
    }
    else {
      CurrentValue = 0;
    }
    return CurrentValue;
  }


  void Display(float minimum, float maximum, float CurrentValue, float cvX, float cvY,int cvSize, String Units1, float unit1X, float unit1Y, String Units2, float unit2X, float unit2Y, float roundYN) {
    textSize(cvSize);
    if(CurrentValue < maximum*0.15){
      fill(0,255,255);
    }
    else if(CurrentValue > maximum*0.85){
      fill(255,0,0);
    }
    else {
      fill(255);
    }
    if (roundYN == 0){
      text(nf(round(CurrentValue), 3, 0), cvX, cvY);    
    }
    else {
      text(nf(CurrentValue, 2, 1), cvX, cvY);    
    }
    fill(255);
    textSize(25);
    text(Units1, unit1X, unit1Y);
    text(Units2, unit2X, unit2Y);
  }
  
  void Display(String fileName, float xPos, float yPos, int scale){
    PImage displayG;
    displayG = loadImage(fileName);
    displayG.resize(0,scale);
    image(displayG, xPos, yPos);
  }
    
  void Display(float minimum, float maximum,float CurrentValue, float cvX, float cvY, String Units, float unitX, float unitY, float roundYN){
    textSize(40);
    if(CurrentValue < maximum*0.15){
      fill(0,255,255);
    }
    else if(CurrentValue > maximum*0.85){
      fill(255,0,0);
    }
    else {
      fill(255);
    }
    if (roundYN == 0){
      text(nf(round(CurrentValue),0,0), cvX, cvY);
    }
    else{
      text(nf(CurrentValue,0,3), cvX, cvY);
    }
    fill(255);
    textSize(20);
    text(Units, unitX, unitY);
  }
  
  void Display(float xPos, float yPos, float arcW, float arcH, float start, float end, int sWeight) {
    strokeWeight(sWeight);
    arc(xPos, yPos, arcW, arcH, start,end);
  }
  void Display(){
    textSize(33);
    text("P", 1152, 260);
    text("R", 1178, 320);
    text("N", 1190, 380);
    text("1", 1183, 500);
    text("2", 1156, 560);
    fill(255,0,0);
    text("D", 1193, 440);
  }
  
  void Display(String COMPASS){
    if(PositionX1 - PositionX >= 0 && PositionY1 - PositionY >= 0){
      //fill(color(41,19,91,173));NE
      fill(255);
      ellipse(945,685,5,5);
    }
    if(PositionX1 - PositionX >= 0 && PositionY1 - PositionY < 0){
      //fill(color(41,19,91,173));SE
      fill(255);
      ellipse(945, 768,5,5);
    }
    if(PositionX1 - PositionX < 0 && PositionY1 - PositionY >= 0){
      //NW
      fill(255);
      ellipse(945, 768,5,5);
    }
    if(PositionX1 - PositionX < 0 && PositionY1 - PositionY < 0){
      //SW
      fill(255);
      ellipse(855,768,5,5);
    }
    noFill();
    PositionX1=PositionX;
    PositionY1=PositionY;
  }
      
  
  
  
}
