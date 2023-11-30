Json ← $ {\"array\":[1,2,3,4],
       $ \"uhoh\":[\"a\",\"b\",\"c\"],
       $ \"object1\":
       $ { \"field1\":50,
       $   \"field2\":\"apple\"
       $ },
       $ \"object2\":
       $ { \"field1\":25,
       $   \"field2\":\"cheese\"
       $ },
       $ \"alsoObject\":
       $ { \"fieldA\":99,
       $   \"fieldB\":\"beer\",
       $   \"super-field\":\"ooie\",
       $   \"wowie\":{\"bruh\":69420}
       $ }}

WS ← [@ @\n@\r]
RemoveWhitespace ← (▽¬/+⊠=WS.)
Wrap ← (⊂⊂⊙:.)

Obj ← "\"(\\w+)\":\\{(.*?)\\}"
Field ← "\"([\\w.]+)\":"
Value ← ":(?:(\\d+)|(\"\\w+\")|(\\[[\"\\w\\d,]+\\]))[,}]?"

# MatchAll
Grab ← ((0⊙::"";|1⊙⊃(↘+⊃(⊚⌕|⧻)⊔⊢⊙.|□↘1):)±⧻.regex,,)
MatchAll ← (⇌;;⍢∘(×⊃(∘|±⧻⋅⋅∘|⋅⊙⊙((;|⊂)>0⧻.))Grab) ⊙⊙([]))

Text ← RemoveWhitespace Json

ContainsObj ← (⊙(;;;)Grab Obj .⊐(∩(⊔⊢)⊐⊃↘↙1))

# Str sub rpl = str
d ← "\"object1\":{\"field1\":50,\"field2\":\"apple\"}"

Replace ← (↻¯⊙(⊂:↘⧻:↻).⊢⊚⌕⊙.,)

RefObjFields ← (⊟≡□≡(⊐⊂) ¤⊙⍘⊟⊓(⊂:@.|⊐≡MatchAll {Field Value} ¤))
RestringObj ← (⊐/⊂⊐≡/(⊂:@,⊂⊂:@:Wrap@")⍉)
FlattenObj ← (RestringObj RefObjFields ⊐(∩(⊔⊢)⊃↙↘1)⊢ MatchAll Obj)

Trim ← (↘1↘¯1)
DeepestObj ← (⊂⊂:@:⊂@"⇌▽=1\+=@".⇌↙⊙:⊚⌕,,⇌⊂@}⇌⊂@{▽=/↥.×⊃(¬/+⊠="{}"|\+/+⊟⬚0↻¯1⍘⊟⊠="}{")..)
FlattenDeepest ← (Replace ⊃(∘|:FlattenObj .DeepestObj))
# ⊐(∩(⊔⊢)⊃↙↘1)⊢ MatchAll Obj
# RestringObj RefObjFields 
# RefObjFields ⊐(∩(⊔⊢)⊃↙↘1)⊢ MatchAll Obj DeepestObj 
# ⊐≡MatchAll {Field Value} ¤⊐(∩(⊔⊢)⊃↙↘1)⊢ MatchAll Obj DeepestObj FlattenDeepest 
▽=3\+/-⊠="}{".Text
