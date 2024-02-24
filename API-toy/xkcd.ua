Site ← "xkcd.com:443"
Request ← "/info.0.json"
Response ← &httpsw /◇⊂{"GET " Request " HTTP/1.0"} &tcpc Site
KeyRegex ← $"\"_\":(.*?)[,}]"
Read ← : °□⊏1⊢regex ⊙. KeyRegex

Main ← ↘2↘¯1◌ Read "img" Response
Main
