# Weather
Welcome to the my Weather application developed using Flutter.

## Introduction
The Weather application offers real-time weather information for desired locations, including detailed hourly and 7-day forecasts. Users have the capability to save their favorite locations for quick access. Additionally, the application provides a weather map feature for enhanced visualization of weather patterns. The data source for this application is provided by [OpenWeatherMap](https://openweathermap.org/), a trusted platform for weather data.

## Feature
- Browse weather information from around the world.
- Choose your preferred location criteria to receive targeted weather information.
- Save your favorite locations to view weather information.
- Explore the weather map for visualizing weather patterns.

## Installation
To get started with the Weather mobile application, follow these steps:
1. Clone the repository to your local machine:
```
git clone https://github.com/kvsoftware/weather
```

2. Navigate to the project directory:
```
cd weather
```

3. Configure the API keys in the .env file:
```
OPEN_WEATHER_API_KEY={ Put your OpenWeather API key }
GOOGLE_MAPS_API_KEY_ANDROID={ Put your Google Map API key for Android }
GOOGLE_MAPS_API_KEY_IOS={ Put your Google Map API key for iOS }
```

4. Install the necessary dependencies, generate the needed files, wait for success, and leave it as it is:
```
sh build.sh
```

5. Open a new terminal, connect your mobile device or emulator, and run the application.
```
flutter run
```

Feel free to explore the Weather application and enjoy the real-time weather updates!
