CREATE TABLE guests(
  "id" INTEGER,
  "first_name" VARCHAR(16),
  "last_name"  VARCHAR(16),
  "address"    TEXT,
  "email"      TEXT,
  "phone_number" VARCHAR(12),
  
  PRIMARY KEY ("id")
  
);

CREATE TABLE rooms(
"id" INTEGER,
"room_number" INTEGER,
"floor_number" INTEGER,
 "price_per_night" FLOAT,
  
  PRIMARY KEY ("id")
);


CREATE TABLE bookings(
	"booking_id" INTEGER,
  	"guest_id" INTEGER,
  	"room_id"  INTEGER,
  	"check_in" DATE,
  	"check_out" DATE,

  	PRIMARY KEY ("booking_id"),
  
  	FOREIGN KEY ("guest_id")
  		REFERENCES "guests" ("id"),
  		
  	FOREIGN KEY ("room_id")
  		REFERENCES "rooms" ("id")
  		
);



INSERT INTO guests
	("id", "first_name", "last_name", "address", "email", "phone_number")
VALUES
	(1, 'Bob', 'Dylan', '22 Keeler Drive, MA', 'bob@gmail.com', '203-443-1284'),
    (2, 'Jerry', 'Spring', '103 Wallibe Way, TX', 'jerry@gmail.com', '123-423-5546'),
    (3, 'Cathy', 'Taylor', '47 Lane Street IO', 'caT@gmail.com', '324-445-8907'),
    (4, 'Jay', 'Biggity', '23 Hustle Street DI', 'Jbig@gmail.com', '143-842-8929'),
    (5, 'Trone', 'Vanderbelt', '147 15th Avenue Street CA', 'rones@gmail.com', '243-556-3284');
   
INSERT INTO rooms
	("id", "room_number", "floor_number", "price_per_night")
VALUES
	(22, 1, 1, 89.99),
    (33, 2, 1, 89.99),
    (44, 3, 2, 149.99),
    (55, 4, 2, 149.99),
    (66, 5, 2, 149.99),
    (77, 5, 3, 249.99),
    (88, 5, 3, 249.99),
    (99, 5, 3, 249.99),
    (100, 100, 4, 1500.99);
    
INSERT INTO bookings
	("booking_id", "guest_id", "room_id", "check_in", "check_out")
VALUES
(100, 2, 55, '2018-01-13', '2018-01-14'),
    (200, 3, 22, '2018-02-13', '2018-02-16'),
    (300, 3, 22, '2018-04-13', '2018-04-24'),
    (400, 4, 100, '2018-01-23', '2018-01-29'),
    (500, 5, 22, '2018-03-01', '2018-03-09'),
    (600, 2, 22,  '2018-01-13', '2018-01-14');