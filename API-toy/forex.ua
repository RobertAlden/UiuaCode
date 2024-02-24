From ← ⌵⊏1&args
To ← ⌵⊏2&args
Request ← $"/v6/latest/_" From
Site ← "open.er-api.com:443"
Response ← &httpsw /◇⊂{"GET " Request " HTTP/1.0"} &tcpc Site
KeyRegex ← $"\"_\":([\\d\\.]+)[,}]"
Read ← : °□⊏1⊢regex ⊙. KeyRegex
Output ← $"Conversion rate from _ to _: _"
Main ← &p Output From To ◌ Read To Response
Main
