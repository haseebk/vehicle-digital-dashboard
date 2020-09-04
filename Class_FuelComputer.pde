class FuelComputer
{
  float fuelEconomy;
  float fuelConsumption;
  float AverageFuelEconomy;
  float fuelEconomyHistory;
  float range;
  float FuelLevel;
  float barChartAFE [] = new float[40];
  float barChartFC [] = new float[40];
  float barChartFEH [] = new float[40];
  
  float calculateFuelEconomy(float Speed, float ConsumedFuel) {
    if (ConsumedFuel == 0) {
      fuelEconomy = 0;
    } else {
      fuelEconomy = (Speed) / (ConsumedFuel*60*60);
    }
    fuelEconomyHistory += fuelEconomy;
    return fuelEconomy;
  }

  float calculateAverageFuelEconomy() {
    if (SDP.currentIndex == 0){
      fuelEconomyHistory = 0;
      return 0;
    }
    float AverageFuelEconomy = fuelEconomyHistory / SDP.currentIndex;
    return AverageFuelEconomy;
  }

  float calculateRange(float AverageFuelEconomy, float currentFuelLevel) {
    range = AverageFuelEconomy * currentFuelLevel;
    return range;
  }

  float calculateFuelConsumption() {
    fuelConsumption = (1/AverageFuelEconomy) * 100;
    return fuelConsumption;
  }
  
  void populateArray(){
    for (int i = barChartAFE.length - 1; i > 0; i--){
      barChartAFE[i] = barChartAFE[i-1];
      barChartFC[i] = barChartFC[i-1];
      barChartFEH[i] = barChartFEH[i-1];
    }
    barChartFC[0] = fuelConsumption;
    barChartAFE[0] = AverageFuelEconomy;
    barChartFEH[0] = fuelEconomy;
  }
}
