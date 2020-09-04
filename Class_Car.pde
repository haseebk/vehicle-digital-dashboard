class Car
{
  TripComputer TripComp = new TripComputer();
  FuelTank FuelTk = new FuelTank();
  FuelComputer FuelComp = new FuelComputer();
  Gauge displayGauge = new Gauge();

  void processInput(float rpm, float fuelLevel, float gearRatio, float X, float Y, float radius, float tankCap) {
    TripComp.RPM = displayGauge.setCurrentValue(rpm, 3000, 0);
    TripComp.gearRatio = displayGauge.setCurrentValue(gearRatio, 4, 1);
    TripComp.wheelRadius = radius;
    TripComp.totalTravelledDistance = TripComp.updateTotalDistance(); 
    TripComp.Speed = displayGauge.setCurrentValue(TripComp.getCurrentSpeed(),500,0);
    
    FuelComp.fuelEconomy = FuelComp.calculateFuelEconomy(TripComp.Speed, FuelTk.ConsumedFuel);
    FuelComp.fuelConsumption = FuelComp.calculateFuelConsumption();
    FuelComp.populateArray();
    
    FuelComp.AverageFuelEconomy = displayGauge.setCurrentValue(FuelComp.calculateAverageFuelEconomy(),300,0);
    FuelComp.range = displayGauge.setCurrentValue(FuelComp.calculateRange(FuelComp.AverageFuelEconomy, FuelTk.FuelLevel),1000,0);
    FuelTk.TankCapacity = tankCap;
    FuelTk.FuelLevel = displayGauge.setCurrentValue(fuelLevel,90,0);
    FuelTk.ConsumedFuel = displayGauge.setCurrentValue(FuelTk.getConsumedFuel(),90,0);
    displayGauge.PositionX = X;
    displayGauge.PositionY = Y;
  float RemainingFuel;
  float previousFuelLevel;
    
    
    
    //float setCurrentValue(float x, float Maximum, float Minimum);
    
    noFill();
    stroke(222);
    displayGauge.Display(900, 400, 480, 480, HALF_PI, HALF_PI + QUARTER_PI*(TripComp.RPM/1000.0), 15);
    displayGauge.Display(880, 400, 600, 600, (HALF_PI - PI + 0.94), HALF_PI-QUARTER_PI -0.15,5);
    displayGauge.Display(580,605,240,240, PI, TWO_PI, 3);
   
        println(FuelComp.fuelEconomy);

    displayGauge.Display("line.png", 600,100, 600);
    displayGauge.Display("lineLeft.png", 485,100,600);
    displayGauge.Display("lineBottom.png",725,435,370);
    displayGauge.Display("gaugeRPMBlack_innerW.png", 600, 100, 600);
    displayGauge.Display("fuelGauge.png", 430,455,300);
    displayGauge.Display("fuelIcon.png", 565, 563, 50);
    displayGauge.Display("lineLeft.png", 1090,525,325);
    displayGauge.Display("lineLeft.png", 1207,300,325);
    displayGauge.Display("lineLeft.png", 1207, 75, 325);
    displayGauge.Display("compass.png", 825, 650, 150);

    displayGauge.Display(0,200,TripComp.Speed, 865, 420,80, "km/h", 885, 460, "RPMx1000", 867, 285,0);
    displayGauge.Display(0,650,FuelComp.range, 1100,200,40, "km", 1150,200, "Range",1100, 155,0);
    displayGauge.Display(0,25,TripComp.totalTravelledDistance / 1000, 550,285,25, "Odometer", 550, 260, "km", 585,285,0);
    displayGauge.Display(0,60, FuelComp.fuelEconomy, 522,355,25,"Fuel Economy", 522,330, "km/L", 560,355,1);
    displayGauge.Display(0,60, FuelComp.fuelConsumption, 510, 425, 25, "Fuel Consumption", 510,400, "L/100km", 545, 425, 1);
    displayGauge.Display(0, 80, FuelTk.FuelLevel, 560,675,20,"Fuel Level", 545,650, "L", 590, 675,1);
    
    displayGauge.Display();
    displayGauge.Display("COMPASS");
    fill(255);

  }
}
