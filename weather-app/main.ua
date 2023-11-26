Codes ← (
  $ Clear Skys
  $ Waning Clouds
  $ Unchanging
  $ Waxing Clouds
  $ Smokey
  $ Haze
  $ Dusty
  $ Very Light Duststorm
  $ Light Duststorm
  $ Duststorm
  $ Mist
  $ Patchy fog
  $ Foggy
  $ Lightning visible, no thunder heard
  $ Precipitation within sight, not reaching the ground
  $ Precipitation within sight, reaching the ground but distant
  $ Precipitation within sight, reaching the ground near the station
  $ Thunderstorm, but no precipitation at the time of observation
  $ Squalls preceding hour or at the time of observation
  $ Funnel cloud(s)
  $ Drizzle 
  $ Light Rain 
  $ Light Snow
  $ Light Slush
  $ Light Freezing Rain
  $ Rain
  $ Snow
  $ Hail
  $ Fog
  $ Thunderstorm
  $ Slight/Moderate Duststorm
  $ Slight/Moderate Duststorm
  $ Slight/Moderate Duststorm
  $ Severe Duststorm
  $ Severe Duststorm
  $ Severe Duststorm
  $ Slight/Moderate blowing snow
  $ Heavy drifting snow
  $ Slight/Moderate blowing snow
  $ Heavy drifting snow
  $ Distant Fog 
  $ Light Fog
  $ Medium Fog, waning
  $ Heavy Fog, waning
  $ Medium Fog
  $ Heavy Fog
  $ Medium Fog, waxing
  $ Heavy Fog, waxing
  $ Light Rime
  $ Heavy Rime
  $ Light Inter. Drizzle
  $ Light Cont. Drizzle
  $ Moderate Inter. Drizzle
  $ Moderate Cont. Drizzle
  $ Heavy Inter. Drizzle
  $ Heavy Cont. Drizzle
  $ Slight Freezing Drizzle
  $ Dense Freezing Drizzle
  $ Slight Drizzle/Rain
  $ Dense Drizzle/Rain
  $ Light Inter. Rain
  $ Light Cont. Rain
  $ Moderate Inter. Rain
  $ Moderate Cont. Rain
  $ Heavy Inter. Rain
  $ Heavy Cont. Rain
  $ Slight Freezing Rain
  $ Dense Freezing Rain
  $ Slight Drizzle/Snow
  $ Dense Drizzle/Snow
  $ Slight Inter. fall of snowflakes
  $ Slight Cont. fall of snowflakes
  $ Moderate Inter. fall of snowflakes
  $ Moderate Cont. fall of snowflakes
  $ Heavy Inter. fall of snowflakes
  $ Heavy Cont. fall of snowflakes
  $ Fine Snow
  $ Powdery Snow 
  $ Snowflakes
  $ Ice pellets
  $ Rain shower(s), slight
  $ Rain shower(s), moderate or heavy
  $ Rain shower(s), violent
  $ Shower(s) of rain and snow mixed, slight
  $ Shower(s) of rain and snow mixed, moderate or heavy
  $ Snow shower(s), slight
  $ Snow shower(s), moderate or heavy
  $ Slight Shower(s) of small hail
  $ Heavy Shower(s) of small hail
  $ Light Shower(s) of hail
  $ Heavy Shower(s) of hail
  $ Slight rain, Thunderstorms 
  $ Moderate/Heavy rain, Thunderstorms 
  $ Mixed Snow/Hail/Rain, Thunderstorms
  $ Moderate or heavy Snow/Hail/Rain, Thunderstorms
  $ Thunderstorm, slight or moderate 
  $ Thunderstorm, slight/moderate, hail
  $ Thunderstorm, heavy, rain/snow
  $ Thunderstorm combined with duststorm
  $ Thunderstorm, heavy, with hail
)
WeatherCodes ← (⬚@ ⊜∘≠@\n.Codes)
# Config
Constants ← "&daily=weather_code,temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit"
Site ← "api.open-meteo.com:443"
Lat ← "34.6373032"
Lon ← "-98.4584034"
DaysPrior ← 1
DaysHence ← 6

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

TrimSpaces ← (≡↙⊗⊃(⧻|/+)=@ .)
Weather ← (TrimSpaces ⊏:WeatherCodes ⊐∵parse ArrParse ⊢⇌ KtVs "weather_code")
LowTemps ← (≡⊐⊂↘1:⊢.⍜(⊢⇌)ArrParse KtVs "temperature_2m_min")
HighTemps ← (≡⊐⊂↘1:⊢.⍜(⊢⇌)ArrParse KtVs "temperature_2m_max")
Dates ← (⊐⊜(↘¯1↘1)≠@,.⊢↘1 KtVs "time")

Titlebar ← "Highs  Lows   Date       Weather"
ShowWeather ← (⬚@ ⊂Titlebar≡(⊂⊂⊂⊂⊂⊂) ⊃(HighTemps|@ |LowTemps|@ |Dates|@ |Weather) GetWeatherData)
&s ShowWeather
