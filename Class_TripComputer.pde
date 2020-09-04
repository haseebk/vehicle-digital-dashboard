class TripComputer
{
  float RPM;
  float gearRatio;
  float totalTravelledDistance;
  float wheelRadius;
  float Speed;

  float getCurrentSpeed() {
    
    Speed = (RPM*2*PI*wheelRadius*60*60)/(60*gearRatio*1000);
    return Speed;
  }

  float updateTotalDistance() {
    if (SDP.currentIndex == 0)
    {
      totalTravelledDistance = 0;
    }
    totalTravelledDistance = totalTravelledDistance + (Speed*1000/3600);
    return totalTravelledDistance;
  }
}
