#include "DHT.h"
#define dht_type DHT11

int dht_pin = A2;
DHT dht_1 = DHT(dht_pin, dht_type); //pode-se configurar diversos

int lm35_pin = A0, leitura_lm35 = 0;
float temperatura;
int ldr_pin = A5, leitura_ldr = 0;
int switch_pin = 7;
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
float umidade2 = umidade * 0.99;
float umidade3 = umidade * 0.98;
float umidade4 = umidade * 1.01;
float umidadeMedia = umidade + umidade2 + umidade3 + umidade4 / 4;

float temperatura = dht_1.readTemperature();
float temperatura2 = temperatura * 0.99;
float temperatura3 = temperatura * 0.98;
float temperatura4 = temperatura * 1.01;
float temperaturaMedia = temperatura + temperatura + temperatura + temperatura / 4;


if (isnan(temperatura) or isnan(umidade))
{
Serial.println("Erro ao ler o DHT");
}
else
{
Serial.print(umidadeMedia);
Serial.println(";");
Serial.print(temperaturaMedia);
Serial.println(";");

}
}
delay(2000);
}
