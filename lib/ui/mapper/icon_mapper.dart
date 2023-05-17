String getIcon(String weatherIcon) {
  switch (weatherIcon) {
    case "01d":
      return "assets/icons/clear_sky_day.png";
    case "01n":
      return "assets/icons/clear_sky_night.png";
    case "02d":
      return "assets/icons/few_clouds_day.png";
    case "02n":
      return "assets/icons/few_clouds_night.png";
    case "03d":
      return "assets/icons/clouds.png";
    case "03n":
      return "assets/icons/clouds.png";
    case "04d":
      return "assets/icons/clouds.png";
    case "04n":
      return "assets/icons/clouds.png";
    case "09d":
      return "assets/icons/shower_rain.png";
    case "09n":
      return "assets/icons/shower_rain.png";
    case "10d":
      return "assets/icons/rain_day.png";
    case "10n":
      return "assets/icons/rain_night.png";
    case "11d":
      return "assets/icons/thunderstorm.png";
    case "11n":
      return "assets/icons/thunderstorm.png";
    case "13d":
      return "assets/icons/snow.png";
    case "13n":
      return "assets/icons/snow.png";
    case "50d":
      return "assets/icons/mist.png";
    case "50n":
      return "assets/icons/mist.png";
    default:
      return "";
  }
}
