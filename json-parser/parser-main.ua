# Experimental!

# JSON Parser
Data ← &fras "json-parser/mega-json-ol.txt"

Value ← "(?:\\[.*?\\]|\\{.*?\\}|\\\".*?\\\"|.*?)"
Element ← $"\".*?\":_[,}]" Value

SimpleValue ← "(\\\".*?\\\"|.*)"
SimpleElement ← $"\".*?\":_[,}]?" SimpleValue
Key ← "\"(.*?)\":.*[,}]?"

Number ← "^-?\\d+.?\\d*[,}]?"
String ← "^\".*?\"[,}]?"
Array ← "^\\[(.*?)\\][,}]?"
Object ← "^(\\{.*\\})[,}]?"
Bool ← "^(true|false)"
Any ← $"(?:_|_|_|_|_)" Object Array String Number Bool
Types ← {Object Array String Number Bool}

Is ← >0/×△ ⬚(□"")regex
Which ← °□⊢▽:⟜≡Is Types ¤
Group ← °□⊡0_1
Translate ← (⟨∘|∘|↘1↘¯1|⋕↘¯1|⊗□:{"false" "true"}↘¯1⟩)
Parse ← Translate⊗□:Types⊸Which Group regex SimpleElement
Read ← regex Element Group :⟜regex ⊸Which

Read "{\"id\":546,\"name\":\"Velma Keller\"}"

# TESTS
⍤"Object" Is Object "{\"id\":0,\"name\":\"Velma Keller\"}"
⍤"Array" Is Array "[{\"id\":0,\"name\":\"Velma Keller\"},{\"id\":1,\"name\":\"Trevino Gilbert\"},{\"id\":2,\"name\":\"Virgie Lee\"}]"
⍤"Number" Is Number "-34412.231234"
⍤"String" Is String "\"aardvark\""
⍤"Bool" Is Bool "true"
⍤"Bool" Is Bool "false"
⍤"Bool" ¬Is Bool "asdas"
⍤"Parse String" ≍"Velma Keller" Parse "\"name\":\"Velma Keller\""
⍤"Parse Number" =¯321.242 Parse "\"id\":-321.242,"
