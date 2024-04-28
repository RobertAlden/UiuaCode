# Experimental!
~ "git: github.com/ekgame/uiua-json" ~ ParseJsonString

Site ← "xkcd.com:443"
Request ← "/info.0.json"
Response ← °□⊢⊢regex"\\{.*\\}" (&httpsw /◇⊂{"GET " Request " HTTP/1.0"} &tcpc Site)
Read ← °□⊏1get ⊙(°□⊏1ParseJsonString)

Read "alt" Response
