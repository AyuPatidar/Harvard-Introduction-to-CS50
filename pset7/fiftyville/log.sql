-- Keep a log of any SQL queries you execute as you solve the mystery.

--Get the id of crime from the crime scene reports table on that day at Chamberlin Street
SELECT id FROM crime_scene_reports WHERE year = 2020 AND month = 7 AND day = 28 AND street = "Chamberlin Street"
--id
--295

--Get description of the crime with id  = 295
SELECT description FROM crime_scene_reports WHERE id = 295;
description
Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse. Interviews were conducted today with three witnesses who were present at the time — each of their interview transcripts mentions the courthouse.

--Get id of airport in fiftyville city
SELECT id FROM airports WHERE UPPER(city) = "FIFTYVILLE"
--id
--8

--Get id of flights from fiftyville on that day
SELECT destination_airport_id, hour, minute FROM flights WHERE year = 2020 AND month = 7 AND day = 29 AND origin_airport_id = 8;
destination_airport_id | hour | minute
6 | 16 | 0
11 | 12 | 15
4 | 8 | 20
1 | 9 | 30
9 | 15 | 20

--Get passenger list in flight on that day
SELECT flight_id, passport_number FROM passengers WHERE flight_id IN (SELECT id FROM flights WHERE origin_airport_id = 8 AND year = 2020 AND month = 7 AND day = 29)
flight_id | passport_number
18 | 2835165196
18 | 6131360461
18 | 3231999695
18 | 3592750733
18 | 2626335085
18 | 6117294637
18 | 2996517496
18 | 3915621712
23 | 4149859587
23 | 9183348466
23 | 7378796210
23 | 7874488539
23 | 4195341387
23 | 6263461050
23 | 3231999695
23 | 7951366683
36 | 7214083635
36 | 1695452385
36 | 5773159633
36 | 1540955065
36 | 8294398571
36 | 1988161715
36 | 9878712108
36 | 8496433585
43 | 7597790505
43 | 6128131458
43 | 6264773605
43 | 3642612721
43 | 4356447308
43 | 7441135547
53 | 7894166154
53 | 6034823042
53 | 4408372428
53 | 2312901747
53 | 1151340634
53 | 8174538026
53 | 1050247273
53 | 7834357192

--Get details of passengers who were residents of fiftyville
SELECT name, phone_number, passport_number, license_plate FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE flight_id IN (SELECT id FROM flights WHERE origin_airport_id = 8 AND year = 2020 AND month = 7 AND day = 29)
name | phone_number | passport_number | license_plate
Pamela | (113) 555-7544 | 1050247273 | 5CIO816
Jordan | (328) 555-9658 | 7951366683 | HW0488P
Heather | (502) 555-6712 | 4356447308 |
Larry | (892) 555-8872 | 2312901747 | O268ZZ0
Diana | (918) 555-2946 | 6131360461 | P743G7C
Brandon | (771) 555-6667 | 7874488539 | R3G7486
Rebecca | (891) 555-5672 | 6264773605 |
Marilyn | (568) 555-3190 | 7441135547 | 0R0FW39
Bobby | (826) 555-1652 | 9878712108 | 30G67EN
Roger | (130) 555-0289 | 1695452385 | G412CB7
Carol | (168) 555-6126 | 6128131458 | 81MNC9R
Dennis |  | 4149859587 |
Madison | (286) 555-6063 | 1988161715 | 1106N58
Roy | (122) 555-4581 | 4408372428 | QX4YZN3
Danielle | (389) 555-5198 | 8496433585 | 4328GD8
Russell | (770) 555-1861 | 3592750733 | 322W7JE
Michael | (529) 555-7276 | 6117294637 | HOD8639
Evelyn | (499) 555-9472 | 8294398571 | 0NTHK55
Matthew |  | 4195341387 | 31GVT84
Melissa | (717) 555-1342 | 7834357192 |
Edward | (328) 555-1152 | 1540955065 | 130LD9Z
Thomas | (286) 555-0131 | 6034823042 | WD5M8I6
Steven | (195) 555-4173 | 1151340634 | 5VFD6G0
John | (016) 555-9166 | 8174538026 | 4468KVT
Ethan | (594) 555-6254 | 2996517496 | NAW9653
Ernest | (367) 555-5533 | 5773159633 | 94KL13X
Richard |  | 7894166154 | 20Q418R
Sophia | (027) 555-1068 | 3642612721 | 13FNH73
Daniel | (971) 555-6468 | 7597790505 | FLFN3W0
Jennifer | (911) 555-0229 | 7378796210 | 1K44SN8
Douglas | (491) 555-2505 | 3231999695 | 1FW4EUJ
Charles | (427) 555-0556 | 3915621712 | R12SA4D
Emily | (406) 555-4440 | 6263461050 | Y340743
Gloria | (973) 555-3809 | 2835165196 | O010420
Jose | (914) 555-5994 | 9183348466 |
Christian |  | 2626335085 | 6CV51G1
Doris | (066) 555-9701 | 7214083635 | M51FA04

--Get caller and receiver who made calls on that day
SELECT caller, receiver FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60;
caller | receiver
(130) 555-0289 | (996) 555-8899
(499) 555-9472 | (892) 555-8872
(367) 555-5533 | (375) 555-8161
(499) 555-9472 | (717) 555-1342
(286) 555-6063 | (676) 555-6554
(770) 555-1861 | (725) 555-3243
(031) 555-6622 | (910) 555-3251
(826) 555-1652 | (066) 555-9701
(338) 555-6650 | (704) 555-2131

--Get the transcript from interviews
SELECT name, transcript FROM interviews WHERE year = 2020 AND month = 7 AND day = 28;
name | transcript
Jose | “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”
Eugene | “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”
Barbara | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.

Ruth | Sometime within ten minutes of the theft, I saw the thief get into a car in the courthouse parking lot and drive away. If you have security footage from the courthouse parking lot, you might want to look for cars that left the parking lot in that time frame.
Eugene | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at the courthouse, I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money.
Raymond | As the thief was leaving the courthouse, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.

--Get the list of cars that went out of courthouse parking lot on that day
SELECT license_plate, hour, minute FROM courthouse_security_logs where year = 2020 AND month = 7 AND day = 28 AND activity = "exit";
license_plate | hour | minute
1M92998 | 8 | 2
N507616 | 8 | 2
7Z8B130 | 8 | 7
47MEFVA | 8 | 13
D965M59 | 8 | 15
HW0488P | 8 | 15
HOD8639 | 8 | 25
L68E5I0 | 8 | 34
W2CT78U | 8 | 34
3933NUH | 8 | 38
1FBL6TH | 8 | 44
P14PE2Q | 8 | 49
4V16VO0 | 8 | 50
8LLB02B | 8 | 57
O784M2U | 8 | 59
5P2BI95 | 10 | 16
94KL13X | 10 | 18
6P58WS2 | 10 | 18
4328GD8 | 10 | 19
G412CB7 | 10 | 20
L93JTIZ | 10 | 21
322W7JE | 10 | 23
0NTHK55 | 10 | 23
1106N58 | 10 | 35
NAW9653 | 14 | 18
RS7I6A0 | 15 | 6
94MV71O | 15 | 16
WD5M8I6 | 16 | 6
4468KVT | 16 | 38
207W38T | 16 | 42
C194752 | 16 | 47
NRYN856 | 17 | 11
13FNH73 | 17 | 15
V47T75I | 17 | 16
R3G7486 | 17 | 18
FLFN3W0 | 17 | 36
4963D92 | 17 | 47

--Narrow the list of exits of courthouse parking lot on that day with the help of passenger list
SELECT name FROM people WHERE license_plate IN (SELECT license_plate FROM courthouse_security_logs where year = 2020 AND month = 7 AND day = 28 AND activity = "exit") AND passport_number IN (SELECT passport_number FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE flight_id IN (SELECT id FROM flights WHERE origin_airport_id = 8 AND year = 2020 AND month = 7 AND day = 29)));
name
Jordan
Brandon
Roger
Madison
Danielle
Russell
Michael
Evelyn
Thomas
John
Ethan
Ernest
Sophia
Daniel

-- Get the account numbers from atm transaction history on that day on fifer street
SELECT account_number FROM atm_transactions WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = "Fifer Street" AND transaction_type = "withdraw";
account_number
28500762
28296815
76054385
49610011
16153065
25506511
81061156
26013199

--Get names of people associated with these account numbers
SELECT name FROM people WHERE id IN (SELECT person_id FROM bank_accounts WHERE account_number IN (SELECT account_number FROM atm_transactions WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = "Fifer Street" AND transaction_type = "withdraw"));
name
Bobby
Elizabeth
Victoria
Madison
Roy
Danielle
Russell
Ernest

--Get names and phone number that match both license plate and phone calls
SELECT name, phone_number FROM people WHERE phone_number in (SELECT caller FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60) AND license_plate IN (SELECT license_plate FROM courthouse_security_logs where year = 2020 AND month = 7 AND day = 28 AND activity = "exit");
name | phone_number
Roger | (130) 555-0289
Madison | (286) 555-6063
Russell | (770) 555-1861
Evelyn | (499) 555-9472
Ernest | (367) 555-5533

--Narraowed down the upper list with the help of passengers list and atm transactions and possible suspects are
Madison
Russell
Ernest

--Get every detail of these three
SELECT * FROM people WHERE name = "Ernest" OR name = "Madison" OR name = "Russell";
SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE name = "Ernest") AND year = 2020 AND month = 7 AND day = 28;
SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE name = "Madison") AND year = 2020 AND month = 7 AND day = 28;
SELECT receiver FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE name = "Russell") AND year = 2020 AND month = 7 AND day = 28;
SELECT name FROM people WHERE phone_number = "(676) 555-6554";
SELECT name FROM people WHERE phone_number = "(725) 555-3243";
SELECT name FROM people WHERE phone_number = "(375) 555-8161";
SELECT id FROM atm_transactions WHERE account_number = "76054385" AND day = 28 AND month = 7 AND year = 2020 AND atm_location = "Fifer Street" AND transaction_type = "withdraw";
SELECT hour, minute FROM courthouse_security_logs WHERE year = 2020 AND month = 7 AND day = 28 AND activity = "exit" AND license_plate = "1106N58";
SELECT hour, minute FROM courthouse_security_logs WHERE year = 2020 AND month = 7 AND day = 28 AND activity = "exit" AND license_plate = "322W7JE";
SELECT hour, minute FROM courthouse_security_logs WHERE year = 2020 AND month = 7 AND day = 28 AND activity = "exit" AND license_plate = "94KL13X";
id     |name   | phone_number   |passport_number|license_plate|receiver 60s call|receiver's Name|account_number|exit time|destination airport

449774 |Madison| (286) 555-6063 | 1988161715    | 1106N58     | (676) 555-6554  |James          |76054385      |10:35    |
--Madison is innocent
514354 |Russell| (770) 555-1861 | 3592750733    | 322W7JE     | (725) 555-3243  |Philip         |26013199      |10:23    |16:20
686048 |Ernest | (367) 555-5533 | 5773159633    | 94KL13X     | (375) 555-8161  |Berthold       |49610011      |10:18    |8:20

--Info not of use
all 3 did atm transaction
all 3 made an exit from courthouse parking lot

-- So now the thief is either russell or Ernest
--Voila! Mystery solved Ernest is the thief and Berthold is the accomplice

--to get city where thief went
SELECT city FROM airports WHERE id = 4;
city
London