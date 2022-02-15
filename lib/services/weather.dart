import 'package:clima_app/services/location.dart';

import 'networking.dart';

const String _apiKey = "1c295feb05d934f164436989123b8621";
const _openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$_openWeatherMapURL?q=$cityName&appid=$_apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  dynamic getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    double longitude = location.longitude;
    double latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        "$_openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric");
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
