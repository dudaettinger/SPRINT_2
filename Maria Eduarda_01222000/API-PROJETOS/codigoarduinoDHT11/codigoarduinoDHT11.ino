#include "DHT.h"
#define dht_type DHT11 //define qual o tipo de sensor DHTxx que se está utilizando

/* Configurações iniciais sobre os sensores
DHT11, LM35, LDR5 e TCRT5000 */

int lm35_pin = A0, leitura_lm35 = 0;
float temperatura;
int ldr_pin = A5, leitura_ldr = 0;
int switch_pin = 7;


void setup() {
Serial.begin(9600);
dht_1.begin();
pinMode(switch_pin, INPUT);
}

void loop(){

float temperatura = dht_1.readTemperature();
float processo_lavagem = temperatura*0.44843049 + 11.9282513;
float processo_secagem1 = temProj + 2;
float processo_secagem2 = temProj + 4;
float processo_secagem3 = temProj + 6;
float proceso_moagem = 
float processo_triturar1 = temProj + 8;
float processo_triturar2 = temProj + 8;
float processo_triturar3 = temProj + 8;
float processo_fermentacao = temProj + 8;
float processo_resfriamento1 = temProj + 8;
float processo_resfriamento2 = temProj + 8;
float processo_resfriamento3 = temProj + 8;
float processo_maturacao = temProj + 8;
float processo_engarrafar = temProj + 8;
float processo_consumo = temProj + 8;


/* Bloco do LM35 */
leitura_lm35 = analogRead(lm35_pin);
temperatura = leitura_lm35 * (5.0/1023) * 100;
Serial.print(temperatura);
Serial.print(";");


else {
Serial.println(0);
}

delay(2000);
}
