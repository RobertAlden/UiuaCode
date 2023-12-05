Codes ← (
  $ Clear Skys
  $ Mostly Clear
  $ Partly Cloudy
  $ Overcast
  $ Medium Fog
  $ Fog
  $ Rime Fog
  $ Light Drizzle
  $ Moderate Drizzle
  $ Heavy Drizzle
  $ Light Freezing Drizzle
  $ Dense Freezing Drizzle
  $ Slight Rain
  $ Moderate Rain
  $ Heavy Rain
  $ Light Freezing Rain
  $ Heavy Freezing Rain
  $ Slight Snowfall
  $ Moderate Snowfall
  $ Heavy Snowfall
  $ Snow Grains
  $ Slight Rain showers
  $ Moderate Rain showers
  $ Heavy Rain showers
  $ Slight Snow showers
  $ Heavy Snow showers
  $ Thunderstorm, slight/moderate
  $ Thunderstorm, slight/moderate, hail
  $ Thunderstorm, heavy, with hail
)
WCodes ← [0 1 2 3 45 48 51 53 55 56 57 61 63 65 66 67 71 73 75 77 80 81 82 85 86 95 96 99]
WeatherCodes ← (⬚@ ⊜∘≠@\n.Codes)
# Config
Site ← "api.open-meteo.com:443"
Lat ← "34.6373032"
Lon ← "-98.4584034"
DaysPrior ← 0
DaysHence ← 7

# Request building
Start ← "/v1/forecast?"
LocString ← $"latitude=_&longitude=_"
Loc ← ⊂LocString Lat Lon "&timezone=auto"
DateString ← $ &past\_days=_&forecast\_days=_
DateRange ← DateString DaysPrior DaysHence
DailyParams ← "&daily=weather_code,temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit"
DailyRequest ← (⊐/⊂{"GET " Start Loc DailyParams DateRange " HTTP/1.0"})
GetDailyWeatherData ← (&httpsw DailyRequest &tcpc Site)

HourlyParams ← "&hourly=temperature_2m&temperature_unit=fahrenheit&forecast_days=1"
HourlyRequest ← (⊐/⊂{"GET " Start Loc HourlyParams " HTTP/1.0"})
GetHourlyWeatherData ← (&httpsw HourlyRequest &tcpc Site)

CurrentParams ← "&current=temperature_2m,precipitation_probability,relative_humidity_2m,apparent_temperature,precipitation,weather_code,&temperature_unit=fahrenheit&precipitation_unit=inch"
CurrentRequest ← (⊐/⊂{"GET " Start Loc CurrentParams " HTTP/1.0"})
GetCurrentWeatherData ← (&httpsw CurrentRequest &tcpc Site)

# JSON Regex Building
Key ← $"\"(_)\":"
ObjPrefix ← $"\"_\":\\{.*?"
Array ← "(\\[.*?\\]),?"
Number ← "([\\d+.-]+),?"
String ← "(\".*?\"),?"
Bool ← "\"(true|false)\",?"
Type ← ⊗□:{"array" "number" "string" "bool"}
Which ← (Array|Number|String|Bool|"")
MakeKeyRegex ← ⊐/⊂⇌⊐[Key ⊔⊢⍥(:ObjPrefix ⊃(⊔⊢|↘1))]-1⧻.⊜□≠@..
ComposeKVRegex ← ⊂MakeKeyRegex:Which Type

# Parsing data
Trim ← ↘1↘¯1
Convert ← (⍣(parse)((0|1|□Trim) ⊗□:{"false" "true"}. ;:))
ParseArray ← ⊜Convert≠@,.Trim
ParseNumber ← Convert
ParseString ← ⊔Convert
ParseBool ← Convert
ParseElement ← (ParseArray|ParseNumber|ParseString|ParseBool)

# Usage = "subobject.field" ["array"|"number"|"string"|"bool"] JsonString
Retrieve ← :ParseElement Type⊙(⊔⊢⇌♭ regex ComposeKVRegex).:⊙⊙.

# Formatting
FormatWeatherCode ← ⊏:WeatherCodes ⊗:WCodes
FormatTemperature ← ⊂⍘parse:
FormatHumidity ← ⊂:@%⍘parse
FormatTime ← ⊔

# Misc
Lerp ← +∩×⊙(⊙(-:1):). # t e s | v

CurrentWeather ← (
  GetCurrentWeatherData
  Retrieve "current.weather_code" "number"
  ⊙(⊂"Current Weather: " FormatWeatherCode)
  Retrieve "current.temperature_2m" "number"
  Retrieve "current_units.temperature_2m" "string"
  ⊙(⊂"Current Temperature: "FormatTemperature)
  Retrieve "current.apparent_temperature" "number"
  Retrieve "current_units.apparent_temperature" "string"
  ⊙(⊂"Feels Like: "FormatTemperature)
  Retrieve "current.precipitation_probability" "number"
  ⊙(⊂"Precip. Chance: "FormatHumidity)
  Retrieve "current.relative_humidity_2m" "number"
  ⊙(⊂"Humidity: " FormatHumidity)
  ;
  ⍜⇌(⬚∘⊂.@ ) ⍥(⬚@ ⊂:)3 ⬚@ ⊟:
)
DailyWeather ← (
  GetDailyWeatherData
  Retrieve "daily.time" "array"
  ⊙(≡FormatTime)
  Retrieve "daily.temperature_2m_max" "array"
  Retrieve "daily_units.temperature_2m_max" "string"
  ⊙(⬚@ ≡FormatTemperature ¤)
  Retrieve "daily.temperature_2m_min" "array"
  Retrieve "daily_units.temperature_2m_min" "string"
  ⊙(⬚@ ≡FormatTemperature ¤)
  Retrieve "daily.weather_code" "array"
  ⊙(≡▽¤¬/×=@ . ≡FormatWeatherCode)
  ;
  ⬚∘⊂.@-⍥(≡⊂:≡(⊂" | "))3
  ⬚@ ⊂"7 Day Forecast: "⬚@ ⊂"Date       | Highs  | Lows   | Weather"
)
C ← ⇌"█▓▒░O@#X:ox*=+-· "
HourlyWeather ← (
  GetHourlyWeatherData
  Retrieve "hourly.temperature_2m" "array"
  ↙24;
  ÷∩-,:⊃(/↥|/↧).
  ⊏⊃(⁅×-1⧻)∘⇌C
  ⇡⧻.⊂⊂@[:@]
  ⊟:⊏:" ^"=parse↙2⊙;;&runc {"/usr/bin/date" "+%T"}
  "Today's Hourly Temps: "
  ≡⊂⇌⬚@\s⊂" "¤
)
Main ← (
  HourlyWeather
  CurrentWeather
  DailyWeather
  ⍥(⬚@ ⊂:)2
  &p&p""/⊂≡(⊂⊂)@\t:@\n
)
Main
