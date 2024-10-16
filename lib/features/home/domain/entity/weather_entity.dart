class WeatherEntity {
  final String cityName;
  final double currentTemp;
  final String weatherCondition;
  final double maxTemp;
  final double minTemp;
  final String icon;
  final num humidity;
  final List<String> forecastDates;

  WeatherEntity({
    required this.humidity,
    required this.icon,
    required this.cityName,
    required this.currentTemp,
    required this.weatherCondition,
    required this.maxTemp,
    required this.minTemp,
    required this.forecastDates,
  });

  List<int> getListAiFeature ()
  {
    List<int>aiFeature=[];
    if(weatherCondition =='Rainy'){
      aiFeature.add(1);
    }else
    {
      aiFeature.add(0);
    }if(weatherCondition=='Sunny')
    {
      aiFeature.add(1);
    }else
    {
      aiFeature.add(0);
    }

    if(currentTemp > 35)
    {
      aiFeature.add(1);
    }else
    {
      aiFeature.add(0);
    }if(currentTemp>30&&currentTemp <=35)
    {
      aiFeature.add(1);
    }else
    {
      aiFeature.add(0);
    }if(humidity > 50 )
    {
      aiFeature.add(1);
    }else
    {
      aiFeature.add(0);
    }
    return aiFeature;
  }
}
