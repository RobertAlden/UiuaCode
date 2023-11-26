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

WeatherCodesToDesc ← ∘
Weather ← (WeatherCodesToDesc ⊐∵parse ArrParse ⊢⇌ KtVs "weather_code")
LowTemps ← (≡⊐⊂↘1:⊢.⍜(⊢⇌)ArrParse KtVs "temperature_2m_min")
HighTemps ← (≡⊐⊂↘1:⊢.⍜(⊢⇌)ArrParse KtVs "temperature_2m_max")
Dates ← (⊐⊜(↘¯1↘1)≠@,.⊢↘1 KtVs "time")

ShowTemps ← (⬚@ ⊂"Highs  Lows   Date"≡(⊂⊂⊂⊂) ⊃(HighTemps|@ |LowTemps|@ |Dates) GetWeatherData)
# &s ShowTemps

Weather .GetWeatherData
