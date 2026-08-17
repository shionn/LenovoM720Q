#include <Arduino.h>
#include <Adafruit_NeoPixel.h>

#define LED_LEN 4
#define LED_PIN DD0
#define BREATH_SPEED 2048
#define CRAWL_SPEED 128
#define CRAWL_LEN 16

Adafruit_NeoPixel strip = Adafruit_NeoPixel(LED_LEN, LED_PIN, NEO_GRB + NEO_KHZ800);

void setup() {
	strip.begin();
}

uint8_t mode = 0;
uint8_t cycle = 0;
uint16_t step = 0;

void static_light() {
	uint32_t c = strip.Color(255,0,0);
	strip.fill(c);
}

void breath() {
	uint16_t v = step % (BREATH_SPEED * 2);
	uint8_t r = v <= BREATH_SPEED ? map(v, 0, BREATH_SPEED, 0, 255) : map(v, BREATH_SPEED, BREATH_SPEED*2, 255, 0);
	uint32_t c = strip.Color(r,0,0);
	strip.fill(c);
}

void crawl() {
	for (uint8_t led = 0; led < strip.numPixels(); led++) {
		uint16_t v = (step / CRAWL_SPEED + strip.numPixels() - led) % CRAWL_LEN;
		uint8_t r = map(v, 0, CRAWL_LEN, 255, 0);
		uint32_t c = strip.Color(r, 0, 0);
		strip.setPixelColor(led, c);
	}
}

void loop() {
	switch (mode) {
	case 0 : static_light(); break;
	case 1: breath(); break;
	case 2: crawl(); break;
	
	default: mode = 0; break;
	}
	strip.show();
	step++;
	if (step >= 20480) {
		step = 0;
		cycle++;
		if (cycle>3)  {
			cycle = 0;
			mode ++;
			if (mode >= 3) {
				mode = 0;
			}
		}
	}
}

