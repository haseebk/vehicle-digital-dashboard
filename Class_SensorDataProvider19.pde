class SensorDataProvider
{
  String filePath; 
  Table 
  dataTable; 
  int currentIndex; 
  TableRow row;

  void Initialize(String x) {
    filePath = x;
    dataTable = loadTable(filePath, "header");
  }

  void readNext() { // advances to the next line by incrementing currentIndex
    if (currentIndex < dataTable.getRowCount()-1) {
      currentIndex++;
    } else {
      noLoop();
    }
  }

  int readRPM() {
    row = dataTable.getRow(currentIndex);
    return row.getInt("RPM");
  }

  float readFuelLevel() {
    row = dataTable.getRow(currentIndex);
    return row.getFloat("Fuel Level (liter)");
  }

  float readRatio() {
    row = dataTable.getRow(currentIndex);
    return row.getFloat("Gear Ratio");
  }

  float readX() {
    row = dataTable.getRow(currentIndex);
    return row.getFloat("X");
  }

  float readY() {
    row = dataTable.getRow(currentIndex);
    return row.getFloat("Y");
  }
}
