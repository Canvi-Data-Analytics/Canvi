#include "DHT.h"
#define dht_type DHT11

int dht_pin = A2;
DHT dht_1 = DHT(dht_pin, dht_type); //pode-se configurar diversos

void setup()
{
Serial.begin(9600);
dht_1.begin();
//pinMode(switch_pin, INPUT);
}
void loop()
{
/**
* Bloco do DHT11
*/
float umidade = dht_1.readHumidity();

float temperatura = dht_1.readTemperature();

if (isnan(temperatura) or isnan(umidade))
{
Serial.println("Erro ao ler o DHT");
}
else
{
Serial.print(umidade);
Serial.print(";");
Serial.print(temperatura);
Serial.println(";");
}
delay(2000);
}
