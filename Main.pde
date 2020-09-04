import org.gicentre.utils.stat.*;
void settings() {
  size(2000, 800);
}
String selectedValue;
String csvPath;
float wheelRadius;
float maxFuel;
PImage BMW;
PImage Ford;
PImage Exit;
PImage Exit2;
int x, y;
int xImage, yImage, h, w;
boolean isCovered;
boolean isClicked;
boolean initialScreen;
BarChart barChartAFE, barChartFC, barChartFEH;

Car Run = new Car();
SensorDataProvider SDP = new SensorDataProvider();

void setup() {
  barChartAFE = new BarChart(this);
  barChartAFE.setMinValue(0);
  barChartAFE.setMaxValue(20);
  barChartAFE.showValueAxis(true);
  barChartAFE.setValueFormat("#");
  barChartAFE.showCategoryAxis(true);
  barChartAFE.setBarColour(color(41,19,91,173));
  barChartAFE.setBarGap(3);
  barChartAFE.setAxisValuesColour(255);
  
  barChartFC = new BarChart(this);
  barChartFC.setMinValue(0);
  barChartFC.setMaxValue(30);
  barChartFC.showValueAxis(true);
  barChartFC.setValueFormat("#");
  barChartFC.showCategoryAxis(true);
  barChartFC.setBarColour(color(41,19,91,173));
  barChartFC.setBarGap(3);
  barChartFC.setAxisValuesColour(255);
  
  barChartFEH = new BarChart(this);
  barChartFEH.setMinValue(0);
  barChartFEH.setMaxValue(20);
  barChartFEH.showValueAxis(true);
  barChartFEH.setValueFormat("#");
  barChartFEH.showCategoryAxis(true);
  barChartFEH.setBarColour(color(41,19,91,173));
  barChartFEH.setBarGap(3);
  barChartFEH.setAxisValuesColour(255);
  
  frameRate(144);
  background(255);
  BMW = loadImage("BMW323i.png"); //640 × 480
  Ford = loadImage("FordF150.png"); //2048 × 1360
  Exit = loadImage("Exit.png");
  Exit2 = loadImage("ExitRed.png");
  isCovered = false;
  isClicked = false;
  initialScreen = false;
  smooth();
}

void draw()
{
  if (initialScreen == false) {
    background(255);
    PFont font = createFont("3ds-48.vlw", 40);
    fill(0);
    textFont(font, 20); 
    text("Please select a vehicle type by hovering over your choice and clicking. Click exit button to quit.", 5, 20);
    noFill();
    noStroke();
    rect(700, 160, 600, 200);
    image(BMW, 685, 0);
    rect(640, 430, 720, 250);
    Ford.resize(750, 0);
    image(Ford, 625, 300);
    rect(1865, 35, 80, 80);
    Exit.resize(0, 70);
    image(Exit, 1930, 0);
    x = mouseX;
    y = mouseY;

    if (imageOver(x, y, 1000, 260, 600, 200) == false) {
      fill(255);
    } else {
      fill(255);
      image(BMW, 685, 0);
    }
    if (imageOver(x, y, 1000, 555, 720, 250) == false) {
      fill(255);
    } else {
      fill(255);
      Ford.resize(750, 0);
      image(Ford, 625, 300);
    }
    if (imageOver(x, y, 1965, 35, 70, 70) == false) {
      fill(255);
    } else {
      Exit2.resize(0, 70);
      image(Exit2, 1930, 0);
    }

    if (imageClicked(x, y, 1000, 260, 600, 200) == false) {
    } else {
      wheelRadius = 0.23;
      maxFuel = 60;
      csvPath = "car_status_BMW_323i.csv";
      SDP.currentIndex = 0;
      initialScreen = true;
    }
    if (imageClicked(x, y, 1000, 555, 720, 250) == false) {
    } else {
      wheelRadius = 0.254;
      maxFuel = 80;
      csvPath = "car_status_Truck_F150.csv";
      SDP.currentIndex = 0;
      initialScreen = true;
    }
    if (imageClicked(x, y, 1965, 35, 70, 70) == false) {
    } else {
      exit();
    }
  } else {
    background(0);
    SDP.Initialize(csvPath);

    int RPM = SDP.readRPM();
    float fuelLevel = SDP.readFuelLevel();
    float gearRatio = SDP.readRatio();
    float X = SDP.readX();
    float Y = SDP.readY();
    float radius = wheelRadius;
    float tankCap = maxFuel;
    PFont font = createFont("sqDisplay.otf", 40);
    textFont(font); 

    Run.processInput(RPM, fuelLevel, gearRatio, X, Y, radius, tankCap);
    
    textFont(font, 15);
    text("Fuel Consumption over time (L/sec)",1150,783);
    text("Average Fuel Economy over time (km/L·s)", 1265, 555);
    text("Fuel Economy History over time (km/L·s)", 1265,330);
    textFont(font, 10);
    barChartAFE.setData(Run.FuelComp.barChartAFE);
    barChartAFE.draw(1235,365,580,180);
    barChartFC.setData(Run.FuelComp.barChartFC);
    barChartFC.draw(1120,590,580,180);
    barChartFEH.setData(Run.FuelComp.barChartFEH);
    barChartFEH.draw(1235,140, 580,180);
    
 
    
    
    SDP.readNext();
    if (SDP.currentIndex == SDP.dataTable.getRowCount()-1) {
      initialScreen = false;
    }
  }
}

boolean imageClicked(int xPos, int yPos, int xImage, int yImage, int w, int h) {
  if (xPos > (xImage - w/2) && xPos < (xImage + w/2) && yPos > (yImage - h/2) && yPos < (yImage + h/2) && mousePressed) {
    isClicked = true;
  } else {
    isClicked = false;
  }
  return isClicked;
}


boolean imageOver(int xPos, int yPos, int xImage, int yImage, int w, int h) {
  if (xPos > (xImage - w/2) && xPos < (xImage + w/2) && yPos > (yImage - h/2) && yPos < (yImage + h/2)) {
    isCovered = true;
  } else {
    isCovered = false;
  }
  return isCovered;
}
