import '../../../../core/utils/extensions.dart';
import '../dto/astro_dto.dart';
import '../dto/condition_dto.dart';
import '../dto/current_dto.dart';
import '../dto/day_dto.dart';
import '../dto/forecast_day_dto.dart';
import '../dto/hour_dto.dart';
import '../dto/location_dto.dart';
import '../dto/weather_response_dto.dart';
import '../../domain/models/astro.dart';
import '../../domain/models/condition.dart';
import '../../domain/models/current.dart';
import '../../domain/models/day.dart';
import '../../domain/models/forecast_day.dart';
import '../../domain/models/hour.dart';
import '../../domain/models/location.dart';
import '../../domain/models/weather.dart';

extension WeatherResponseDtoToDomain on WeatherResponseDto {
  Weather toDomain() => Weather(
      forecast: forecast.toDomain(),
      current: currentDto.toDomain(),
      location: locationDto.toDomain());
}

extension LocationDtoToDomain on LocationDto {
  Location toDomain() => Location(
      name: name.orEmpty(),
      country: country.orEmpty(),
      region: region.orEmpty(),
      localTime: localTime.orEmpty());
}

extension CurrentDtoToDomain on CurrentDto {
  Current toDomain() => Current(
      temp: temp.orZero(),
      condition: conditionDto.toDomain(),
      wind: wind.orZero(),
      feelsLike: feelsLike.orZero(),
      windDir: windDir.orEmpty(),
      visibility: visibility.orZero(),
      humidity: humidity.orZero(),
      pressure: pressure.orZero());
}

extension ForecastDayDtoToDomain on ForecastDayDto? {
  ForecastDay toDomain() {
    if (this == null) {
      return ForecastDay(
          date: '',
          day: Day(
              maxTemp: 0,
              minTemp: 0,
              maxWind: 0,
              avgVisibility: 0,
              avgHumidity: 0,
              condition: Condition(condition: '', iconUrl: null.orFakeUrl())),
          astro: const Astro(
              sunRise: '',
              sunSet: '',
              moonRise: '',
              moonSet: '',
              moonPhase: ''),
          hours: []);
    }
    return ForecastDay(
        date: this!.date.parseAsDateTime().toDayName(),
        day: this!.dayDto.toDomain(),
        astro: this!.astroDto.toDomain(),
        hours: this!.hoursDto.toDomain());
  }
}

extension ForecastDaysDtoToDomain on List<ForecastDayDto?> {
  List<ForecastDay> toDomain() =>
      map((forecastDay) => forecastDay.toDomain()).toList();
}

extension HoursDtoToDomain on List<HourDto?> {
  List<Hour> toDomain() {
    return map((hourDto) => hourDto.toDomain()).toList();
  }
}

extension HourDtoToDomain on HourDto? {
  Hour toDomain() {
    if (this == null) {
      return Hour(
        time: '',
        temp: 0,
        condition: Condition(condition: '', iconUrl: null.orFakeUrl()),
        wind: 0,
        feelsLike: 0,
        windDir: '',
        visibility: 0,
        humidity: 0,
        pressure: 0,
      );
    }
    return Hour(
        time: this!.time.orEmpty(),
        temp: this!.temp.orZero(),
        condition: this!.conditionDto.toDomain(),
        wind: this!.wind.orZero(),
        feelsLike: this!.feelsLike.orZero(),
        windDir: this!.windDir.orEmpty(),
        visibility: this!.visibility.orZero(),
        humidity: this!.humidity.orZero(),
        pressure: this!.pressure.orZero());
  }
}

extension AstroDtoToDomain on AstroDto? {
  Astro toDomain() {
    if (this == null) {
      return const Astro(
        sunRise: '',
        sunSet: '',
        moonRise: '',
        moonSet: '',
        moonPhase: '',
      );
    }
    return Astro(
        sunRise: this!.sunRise.orEmpty(),
        sunSet: this!.sunSet.orEmpty(),
        moonRise: this!.moonRise.orEmpty(),
        moonSet: this!.moonSet.orEmpty(),
        moonPhase: this!.moonPhase.orEmpty());
  }
}

extension ConditionDtoToDomain on ConditionDto? {
  Condition toDomain() {
    if (this == null) {
      return Condition(condition: '', iconUrl: null.orFakeUrl());
    }
    return Condition(
        condition: this!.condition.orEmpty(),
        iconUrl: this!.iconUrl.orFakeUrl());
  }
}

extension DayDtoToDomain on DayDto? {
  Day toDomain() {
    if (this == null) {
      return Day(
        maxTemp: 0,
        minTemp: 0,
        maxWind: 0,
        avgVisibility: 0,
        avgHumidity: 0,
        condition: Condition(
          condition: '',
          iconUrl: null.orFakeUrl(),
        ),
      );
    }
    return Day(
        maxTemp: this!.maxTemp.orZero(),
        minTemp: this!.minTemp.orZero(),
        maxWind: this!.maxWind.orZero(),
        avgVisibility: this!.avgVisibility.orZero(),
        avgHumidity: this!.avgHumidity.orZero(),
        condition: this!.conditionDto.toDomain());
  }
}
