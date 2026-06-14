CREATE TABLE "Users"(
    "user_id" SERIAL NOT NULL,
    "full_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "role" VARCHAR(255) CHECK
        (
            "role" IN('Ticket Manager', 'Football Fan')
        ) NOT NULL,
        "phone_number" VARCHAR(255) NULL
);
ALTER TABLE
    "Users" ADD PRIMARY KEY("user_id");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_email_unique" UNIQUE("email");
CREATE TABLE "Matches"(
    "match_id" SERIAL NOT NULL,
    "fixture" VARCHAR(255) NOT NULL,
    "tournament_category" VARCHAR(255) NOT NULL,
    "base_ticket_price" DECIMAL(8, 2) NOT NULL,
    "match_status" VARCHAR(255) CHECK
        (
            "match_status" IN(
                'Available',
                'Selling Fast',
                'Sold Out',
                'Postponed'
            )
        ) NOT NULL
);
ALTER TABLE
    "Matches" ADD PRIMARY KEY("match_id");
CREATE TABLE "Bookings"(
    "booking_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "match_id" INTEGER NOT NULL,
    "seat_number" VARCHAR(255) NULL,
    "payment_status" VARCHAR(255) CHECK
        (
            "payment_status" IN(
                'Pending',
                'Confirmed',
                'Cancelled',
                'Refunded'
            )
        ) NULL,
        "total_cost" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "Bookings" ADD PRIMARY KEY("booking_id");
ALTER TABLE
    "Bookings" ADD CONSTRAINT "bookings_booking_id_foreign" FOREIGN KEY("booking_id") REFERENCES "Users"("user_id");
ALTER TABLE
    "Bookings" ADD CONSTRAINT "bookings_booking_id_foreign" FOREIGN KEY("booking_id") REFERENCES "Matches"("match_id");