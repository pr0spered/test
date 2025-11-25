# FullStack-php

## Overview

This is a full-stack ticket booking application built using HTML, CSS, PHP, JavaScript and MySQL. 
It allows users to search for movies, select and review seats, book tickets, simulate payments, rate movies, view their booking history, etc. The project showcases a web-based application with dynamic user interactions.

---

## Features

The following features are implemented

- **User Management:** Register new users, login and logout.
- **Search:** Search for movies by their name.
- **Seat Selection:** Choose seats and review them before booking. Booked tickets are made unavailable. Seats are locked during review and automatically released after 5 minutes.
- **Manage Tickets:** Book tickets and view booked tickets history. Ticket confirmation once booking is completed.
- **Payment Simulation:** Pay via UPI or card through a simulated payment gateway.
- **Movie Rating:** Rate movies and view overall movie ratings.

## Architecture

### 1. **Frontend**
- Publicly accessible frontend interface built with HTML, CSS and JavaScript.
- Users interact with movie listings, seat selection, movie rating, booking, payment, etc.
- Provides pages for login and registration.

### 2. **Backend**
- Backend logic built using PHP.
- Handles user authentication, seach function, saving transactions, booking logic, seat locking/release mechanism, payment simulation, movie rating calculations.
- Communicates with the database and frontend to fetch and update information.

### 3. **Database**
- MySQL database for storing users, movies, transactions, tickets, shows, screens, theatres, locked seats and ratings.
- Proper relation between tables ensure consistency and accuracy of data.
- Implements seat locking mechanism with an event to release locked seats.

## Testing
-test_data.sql is present which can be used to populate the database with sample data. This file contains example records that demonstrate how the application works. All test users included in test_data.sql use the password test@123.

## Screenshots

Homepage:

![Home](https://github.com/pr0spered/FullStack-php/raw/main/images/home.png)

Movie Page:

![Movie](https://github.com/pr0spered/FullStack-php/raw/main/images/movie.png)

Movie Screen:

![Screen](https://github.com/pr0spered/FullStack-php/raw/main/images/screen.png)

Bookings:

![Bookings](https://github.com/pr0spered/FullStack-php/raw/main/images/tickets.png)

Payment Page:

![Payment](https://github.com/pr0spered/FullStack-php/raw/main/images/payment.png)