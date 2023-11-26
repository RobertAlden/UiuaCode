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
Constants ← "&daily=weather_code,temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit"
Site ← "api.open-meteo.com:443"
Lat ← "34.6373032"
Lon ← "-98.4584034"
DaysPrior ← 0
DaysHence ← (⍣(parse⊔⊏1&args)(7;))

# Request building
Start ← "/v1/forecast?"
LocString ← $"latitude=_&longitude=_"
Loc ← LocString Lat Lon
DateString ← $ &past\_days=_&forecast\_days=_
DateRange ← DateString DaysPrior DaysHence
Request ← (⊐/⊂{"GET " Start Loc Constants DateRange " HTTP/1.0"})

GetWeatherData ← (&httpsw Request &tcpc Site)

# JSON Handling
Json ← (⊕□\+/-⊠="}{".)
FindSections ← (⊐≡↘⊙¤+⊃(+1⧻)(⊚⌕)⊙.)
FindEnd ← (↙⊗⊙.(@}|@]|@")⊗:"{["⊃⊢(↘1))
KtVs ← (⊐≡FindEnd FindSections ⊂⊂⊙:.@")
ArrParse ← (⊜□≠@,.⊔)

# Data Wrangling
TrimSpaces ← (≡↙⊗⊃(⧻|/+)=@ .)
Weather ← (TrimSpaces ⊏:WeatherCodes ⊗:WCodes ⊐∵parse ArrParse ⊢⇌ KtVs "weather_code")
LowTemps ← (≡⊐⊂↘1:⊢.⍜(⊢⇌)ArrParse KtVs "temperature_2m_min")
HighTemps ← (≡⊐⊂↘1:⊢.⍜(⊢⇌)ArrParse KtVs "temperature_2m_max")
Dates ← (⊐⊜(↘¯1↘1)≠@,.⊢↘1 KtVs "time")

# Output Formatting
Titlebar ← ⇌⬚@-⊟ """ Highs  | Lows   | Date       | Weather  "
ShowWeather ← (⬚@ ⊂Titlebar≡(⊂⊂⊂⊂⊂⊂⊂) ⊃(@ |HighTemps|¤" | "|LowTemps|¤" | "|Dates|¤" | "|Weather) GetWeatherData)
Stringify ← (♭≡⊂:@\n)

&p Stringify ShowWeather
