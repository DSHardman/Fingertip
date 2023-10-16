#include "DHT.h"
#define DHTTYPE DHT11
#define DHTPIN 2
DHT dht(DHTPIN, DHTTYPE);
 
void setup() {
  Serial.begin(9600);
  Wire.begin();
  dht.begin();
  delay(2000);
}
 
void loop() {

  float temp_hum_val[2] = {0};
  dht.readTempAndHumidity(temp_hum_val);

  Serial.print(temp_hum_val[0]);
  Serial.print(", ");
  Serial.println(temp_hum_val[1]);
 
  delay(100000);
}
