# Experimental!

# JSON Parser
Data ← &fras "json-parser/mega-json-ol.txt"

TestI ← "friends[2]"
TestII ← "friends[2].name"

Value ← "(\\[.*?\\]|\\{.*?\\}|\".*?\"|true|false?)"
Key ← $"\"_\":_[,}]?" ⊙Value

RV ← $"\"_\":\\[(?:.*?,){_}.*_:_\\]" ⊙⊙⊙Value

ArrayRegex ← "(.*)\\[(\\d+)\\]"
R ← °⊟↘1⊢ regex ArrayRegex
# °□⊡0_1regex Key "tags" Data 
regex RV R °⊟⊜□⊸≠@. "friends[2].name" Data
