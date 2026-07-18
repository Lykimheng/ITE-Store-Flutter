# ITE Store

A Flutter-based e-commerce mobile application developed as a final examination project. This project demonstrates the use of Flutter Flavors and environment-based configuration to support multiple deployment environments from a single codebase.

⸻

## Overview

ITE Store is a simple shopping application that retrieves products from different backend APIs depending on the selected build flavor.

The application was designed to demonstrate:

* Flutter Flavors
* Environment configuration
* REST API integration
* Clean project structure
* Shopping cart functionality

The application contains two primary screens:

* Home Screen
* Cart Screen

## Features

* Browse products from a REST API
* Add and remove items from the shopping cart
* Calculate total cart price
* Multiple build environments
* Environment-specific API configuration
* Demo mode with cart functionality disabled

## Build Flavors

Flavor	Description
Development (dev)	Connects to the development API
User Acceptance Testing (uat)	Connects to the UAT API
Production (prod)	Connects to the production API
Demo (demo)	Browse products only (shopping cart disabled)

## Technologies Used

### Frontend

* Flutter
* Dart
* Flutter Flavors
* Environment Configuration
* REST API Integration
* Material Design

### Backend

* AWS-hosted REST API

⸻

## Project Structure
```
lib/
├── api/
│   ├── model/
│   └── cart_manager.dart
├── app/
│   ├── app.dart
│   └── config.dart
├── screen/
│   ├── home_screen.dart
│   └── cart_screen.dart
└── main.dart
```
## Getting Started

1. Clone the repository.

```git clone https://github.com/Lykimheng/ITE-Store-Flutter.git```

2. Install dependencies.

```flutter pub get```

3. Run the desired flavor.

Example:

```flutter run --flavor dev```

## Testing

```flutter test```
