# README
🎬 The Bonk
The Bonk is a full-stack Ruby on Rails web application for discovering movies and TV shows and finding where to stream them. It combines multiple external APIs with a relational database to deliver a personalized, production-ready experience.

Live Link: https://the-bonk-b6cd080bd586.herokuapp.com

Features

🔍 Search movies and TV shows by title

📺 View real-time streaming availability across platforms

⭐ Access rich metadata (synopsis, release year, ratings)

❤️ Save and manage favorites/watchlists

👤 User accounts with personalized data

⚡ Fast server-side rendering with Rails

🛠 Tech Stack

Backend

Ruby on Rails

PostgreSQL

ActiveRecord

RESTful architecture

Frontend

ERB templates

Rails helpers & partials

Responsive layouts

APIs

TMDB (The Movie Database) API

Streaming availability API (via RapidAPI)

Other

RSpec for testing

FactoryBot for test data

Environment-based credentials

Deployed to production

🧠 Why I Built This

The Bonk was built to solve a real problem: finding something to watch — and knowing where it’s actually streaming — shouldn’t be hard.

From a technical perspective, this project demonstrates:

Designing and evolving relational database schemas

Integrating and normalizing data from multiple third-party APIs

Building maintainable Rails models, controllers, and views

Handling environment configuration and API credentials securely

Deploying and maintaining a live production application

📂 Core Data Models

User — authentication and personalization

Movie / Show — normalized content data

Watchlists / Favorites — user-specific relationships

Associations are designed to support extensibility (recommendations, ratings, social features).

🧪 Testing

Model and feature tests written with RSpec

Test data managed using FactoryBot

API interactions mocked where appropriate

⚙️ Local Setup
Prerequisites

Ruby

Rails

PostgreSQL

API keys for TMDB and streaming service
* ...
# The Bonk
