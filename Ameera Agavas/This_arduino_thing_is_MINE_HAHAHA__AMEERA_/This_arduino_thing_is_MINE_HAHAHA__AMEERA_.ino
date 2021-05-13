#include <deprecated.h>
#include <MFRC522.h>
#include <MFRC522Extended.h>
#include <require_cpp11.h>


#include <SPI.h>
#include <Servo.h>
#define NOTE_B0  31
#define NOTE_C1  33
#define NOTE_CS1 35
#define NOTE_D1  37
#define NOTE_DS1 39
#define NOTE_E1  41
#define NOTE_F1  44
#define NOTE_FS1 46
#define NOTE_G1  49
#define NOTE_GS1 52
#define NOTE_A1  55
#define NOTE_AS1 58
#define NOTE_B1  62
#define NOTE_C2  65
#define NOTE_CS2 69
#define NOTE_D2  73
#define NOTE_DS2 78
#define NOTE_E2  82
#define NOTE_F2  87
#define NOTE_FS2 93
#define NOTE_G2  98
#define NOTE_GS2 104
#define NOTE_A2  110
#define NOTE_AS2 117
#define NOTE_B2  123
#define NOTE_C3  131
#define NOTE_CS3 139
#define NOTE_D3  147
#define NOTE_DS3 156
#define NOTE_E3  165
#define NOTE_F3  175
#define NOTE_FS3 185
#define NOTE_G3  196
#define NOTE_GS3 208
#define NOTE_A3  220
#define NOTE_AS3 233
#define NOTE_B3  247
#define NOTE_C4  262
#define NOTE_CS4 277
#define NOTE_D4  294
#define NOTE_DS4 311
#define NOTE_E4  330
#define NOTE_F4  349
#define NOTE_FS4 370
#define NOTE_G4  392
#define NOTE_GS4 415
#define NOTE_A4  440
#define NOTE_AS4 466
#define NOTE_B4  494
#define NOTE_C5  523
#define NOTE_CS5 554
#define NOTE_D5  587
#define NOTE_DS5 622
#define NOTE_E5  659
#define NOTE_F5  698
#define NOTE_FS5 740
#define NOTE_G5  784
#define NOTE_GS5 831
#define NOTE_A5  880
#define NOTE_AS5 932
#define NOTE_B5  988
#define NOTE_C6  1047
#define NOTE_CS6 1109
#define NOTE_D6  1175
#define NOTE_DS6 1245
#define NOTE_E6  1319
#define NOTE_F6  1397
#define NOTE_FS6 1480
#define NOTE_G6  1568
#define NOTE_GS6 1661
#define NOTE_A6  1760
#define NOTE_AS6 1865
#define NOTE_B6  1976
#define NOTE_C7  2093
#define NOTE_CS7 2217
#define NOTE_D7  2349
#define NOTE_DS7 2489
#define NOTE_E7  2637
#define NOTE_F7  2794
#define NOTE_FS7 2960
#define NOTE_G7  3136
#define NOTE_GS7 3322
#define NOTE_A7  3520
#define NOTE_AS7 3729
#define NOTE_B7  3951
#define NOTE_C8  4186
#define NOTE_CS8 4435
#define NOTE_D8  4699
#define NOTE_DS8 4978
#include <Wire.h>

RFID rfid(10, 5); // Define the RFID
// Replace this with the code from your card in hex form
byte card[5] = {0x4D,0x55,0xAD,0xD3,0x66};
// List any other codes for cards with access here
byte serNum[5];
byte data[5];
// Define the melodies for successful access and denied access
int access_melody[] = {NOTE_G4, 0, NOTE_A4, 0, NOTE_B4, 0, NOTE_A4,0, NOTE_B4, 0, NOTE_C5, 0};
int access_noteDurations[] = {8, 8, 8, 8, 8, 4, 8, 8, 8, 8, 8, 4};
int fail_melody[] = {NOTE_G2, 0, NOTE_F2, 0, NOTE_D2, 0};
int fail_noteDurations[] = {8, 8, 8, 8, 8, 4};
int LED_access = 2; // Pin connected to green LED
int LED_intruder = 3; // Pin connected to red LED
int speaker_pin = 8; // Pin connected to piezo buzzer
int servoPin = 9; // Pin connected to servo
Servo doorLock; // Define the servomotor

void setup() {
 doorLock.attach(servoPin); // Set servo as a pin
 Serial.begin(9600); // Start serial communication
 SPI.begin(); // Start serial communication between the RFID and PC
 rfid.init(); // Initialize the RFID
 Serial.println("Arduino card reader");
 delay(1000);
 pinMode(LED_access, OUTPUT);
 pinMode(LED_intruder, OUTPUT);
 pinMode(speaker_pin, OUTPUT);
 pinMode(servoPin, OUTPUT);
}
void loop() { // Create a variable for each user
 boolean card_card = true; // Define your card
 if (rfid.isCard()) {
 if (rfid.readCardSerial()) {
 delay(1000);
 data[0] = rfid.serNum[0];
 data[1] = rfid.serNum[1];
 data[2] = rfid.serNum[2];
 data[3] = rfid.serNum[3];
 data[4] = rfid.serNum[4];
 }
 Serial.print("Card found - code:");
 for (int i = 0; i < 5; i++) {
 // If it is not your card, the card is considered false
 if (data[i] != card[i]) 
 card_card = false;
 }
 Serial.println();
 if (card_card) { // A card with access permission is found
 Serial.println("Hello!"); // Print to Serial Monitor
 for (int i = 0; i < 12; i++) { // Play welcome music
 int access_noteDuration = 1000 / access_noteDurations[i];
 tone(speaker_pin, access_melody[i], access_noteDuration);
 int access_pauseBetweenNotes = access_noteDuration * 1.30;
 delay(access_pauseBetweenNotes);
 noTone(speaker_pin);
 }
 }
 else { // If the card is not recognized
 // Print message to Serial Monitor
 Serial.println("Card not recognized! Contact administrator!");
 digitalWrite(LED_intruder, HIGH); // Turn on red LED
 for (int i = 0; i < 6; i++) { // Play intruder melody
 int fail_noteDuration = 1000 / fail_noteDurations[i];
 tone(speaker_pin, fail_melody[i], fail_noteDuration);
 int fail_pauseBetweenNotes = fail_noteDuration * 1.30;
 delay(fail_pauseBetweenNotes);
 noTone(speaker_pin);
 }
 delay(1000);
 digitalWrite(LED_intruder, LOW); // Turn off red LED
 }
 if (card_card) { // Add other users with access here
 Serial.println("Access granted.......Welcome!");
 digitalWrite(LED_access, HIGH); // Turn on green LED
 doorLock.write(180); // Turn servo 180 degrees
 delay(5000); // Wait for 5 seconds
 doorLock.write(0); // Turn servo back to 0 degrees
 digitalWrite(LED_access, LOW); // Turn off green LED
 }
 Serial.println();
 delay(500);
 rfid.halt();
 }
}
