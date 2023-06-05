// To view more weather conditions, please visit  https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2
const clearSkyDayIcon = "01d";
const clearSkyNightIcon = "01n";
const fewCloudsDayIcon = "02d";
const fewCloudsNightIcon = "02n";
const scatteredCloudsDayIcon = "03d";
const scatteredCloudsNightIcon = "03n";
const brokenCloudsDayIcon = "04d";
const brokenCloudsNightIcon = "04n";
const showerRainDayIcon = "09d";
const showerRainNightIcon = "09n";
const rainDayIcon = "10d";
const rainNightIcon = "10n";
const thunderstormDayIcon = "11d";
const thunderstormNightIcon = "11n";
const snowDayIcon = "13d";
const snowNightIcon = "13n";
const mistDayIcon = "50d";
const mistNightIcon = "50n";

const clearSkyDayAssetIcon = "assets/icons/clear_sky_day.png";
const clearSkyNightAssetIcon = "assets/icons/clear_sky_night.png";
const fewCloudsDayAssetIcon = "assets/icons/few_clouds_day.png";
const fewCloudsNightAssetIcon = "assets/icons/few_clouds_night.png";
const scatteredCloudsDayAssetIcon = "assets/icons/clouds.png";
const scatteredCloudsNightAssetIcon = "assets/icons/clouds.png";
const brokenCloudsDayAssetIcon = "assets/icons/clouds.png";
const brokenCloudsNightAssetIcon = "assets/icons/clouds.png";
const showerRainDayAssetIcon = "assets/icons/shower_rain.png";
const showerRainNightAssetIcon = "assets/icons/shower_rain.png";
const rainDayAssetIcon = "assets/icons/rain_day.png";
const rainNightAssetIcon = "assets/icons/rain_night.png";
const thunderstormDayAssetIcon = "assets/icons/thunderstorm.png";
const thunderstormNightAssetIcon = "assets/icons/thunderstorm.png";
const snowDayAssetIcon = "assets/icons/snow.png";
const snowNightAssetIcon = "assets/icons/snow.png";
const mistDayAssetIcon = "assets/icons/mist.png";
const mistNightAssetIcon = "assets/icons/mist.png";

String getIcon(String weatherIcon) {
  switch (weatherIcon) {
    case clearSkyDayIcon:
      return clearSkyDayAssetIcon;
    case clearSkyNightIcon:
      return clearSkyNightAssetIcon;
    case fewCloudsDayIcon:
      return fewCloudsDayAssetIcon;
    case fewCloudsNightIcon:
      return fewCloudsNightAssetIcon;
    case scatteredCloudsDayIcon:
      return scatteredCloudsDayAssetIcon;
    case scatteredCloudsNightIcon:
      return scatteredCloudsNightAssetIcon;
    case brokenCloudsDayIcon:
      return brokenCloudsDayAssetIcon;
    case brokenCloudsNightIcon:
      return brokenCloudsNightAssetIcon;
    case showerRainDayIcon:
      return showerRainDayAssetIcon;
    case showerRainNightIcon:
      return showerRainNightAssetIcon;
    case rainDayIcon:
      return rainDayAssetIcon;
    case rainNightIcon:
      return rainNightAssetIcon;
    case thunderstormDayIcon:
      return thunderstormDayAssetIcon;
    case thunderstormNightIcon:
      return thunderstormNightAssetIcon;
    case snowDayIcon:
      return snowDayAssetIcon;
    case snowNightIcon:
      return snowNightAssetIcon;
    case mistDayIcon:
      return mistDayAssetIcon;
    case mistNightIcon:
      return mistNightAssetIcon;
    default:
      return "";
  }
}
