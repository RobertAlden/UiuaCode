Site ← "api.open-meteo.com:443"
Lat ← "34.6373032"
Lon ← "-98.4584034"
DaysPrior ← °⋕0
DaysHence ← °⋕7

# Request building
Start ← "/v1/forecast?"
LocString ← $"latitude=_&longitude=_"
Loc ← ⊂LocString Lat Lon "&timezone=auto"
DateString ← $ &past\_days=_&forecast\_days=_
DateRange ← DateString DaysPrior DaysHence
DailyParams ← "&daily=weather_code,temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit"
DailyRequest ← /◇⊂{"GET " Start Loc DailyParams " HTTP/1.0"}

NestedGet ← °□∧◇get⊜□≠,@.

GetDailyWeatherData ← °json°□⊢⊢regex"\\{.*\\}"(&httpsw DailyRequest &tcpc Site)
GetDailyWeatherData

NestedGet "daily.time" .
