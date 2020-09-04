class FuelTank
{
  float TankCapacity;
  float FuelLevel;
  float ConsumedFuel;
  float RemainingFuel;
  float previousFuelLevel;

  float getConsumedFuel() {
    if (previousFuelLevel == 0) {
      ConsumedFuel = 0;
    } else {
      ConsumedFuel = previousFuelLevel - FuelLevel;
    }
    previousFuelLevel = FuelLevel;
    return ConsumedFuel;
  }
}
