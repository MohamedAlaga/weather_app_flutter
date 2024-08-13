# Flutter Weather App

![App Screenshot](assets/images/Icon.png)

## Overview

The **Flutter Weather App** is a simple and elegant weather application that provides real-time weather updates for any location. The app is built using Flutter, and it fetches weather data from an external API. Users can search for any city and get information like temperature, humidity, wind speed, and more.

## Features

- **Real-Time Weather Updates**: Get the latest weather data for any city worldwide.
- **Search Functionality**: Search for any location and get detailed weather information.
- **Geolocation**: Automatically fetch weather data for your current location.
- **User-Friendly UI**: Clean and intuitive user interface designed with Flutter's Material Design.
- **Custom Animations**: Weather conditions are displayed with custom animations that match the weather type.
- **User Authentication**: handle user login and sign uo using firebase authintication
- **Reset Password**: user can reset password via email
- **encrypt user password**: user password are encrypted before sa


## Screenshots
![Screenshot 1](./assets/images/Screenshot1.png)
![Screenshot 2](./assets/images/Screenshot2.png)

## Installation
To run this project locally, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/weather_app_flutter.git
    cd weather_app_flutter
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Get your API key**:
    - Sign up for a weather API provider WeatherAPI.
    - Get your API key and then create file `lib/services/env.dart` then declare variable.
    ```bash
    String appKey = {your api key};
    ```

4. **Add your fire base**:
- add the files

      /lib/firebase_options.dart

      /android/app/google-services.json

5. **Run the app**:
    ```bash
    flutter run
    ```
## Dependencies
-  http: ^1.1.0
-  provider: ^6.1.2
-  intl: ^0.19.0
-  flutter_launcher_icons: ^0.13.1
-  firebase_core: ^2.24.2
-  firebase_auth: ^4.16.0
-  sqflite: ^2.3.3+1
-  crypto: ^3.0.2
-  uuid: ^3.0.7
-  bcrypt: ^1.1.3
-  path: ^1.9.0
-  shared_preferences: ^2.3.1

## API Integration
The app uses [weatherapi API](https://www.weatherapi.com/) (or your chosen API) to fetch weather data. Ensure you have an API key in file `env.dart` then set a String appKey = {your api key};.

## Folder Structure
```plaintext
flutter_weather_app/
├── android
├── assets
│   ├── images
│   └── fonts
├── ios
├── lib
│   ├── models
│   ├── data
│   ├── view
│   └── controller
├── test
└── pubspec.yaml
```

**Mohamed Alaga**
- [github](https://github.com/MohamedAlaga)
- [Linkedin](https://www.linkedin.com/in/mohamed-alaga-aab4a5246/)
