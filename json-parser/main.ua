# Inputs
i ← &fras "json-oneline.txt"
a ← $ {\"array\":[1,2,3,4],
    $ \"uhoh\":[\"a\",\"b\",\"c\"],
    $ \"object1\":
    $ { \"field1\":50,
    $   \"field2\":\"apple\"
    $ },
    $ \"object2\":
    $ { \"field1\":25,
    $   \"field2\":\"cheese\"
    $ },
    $ \"object3\":
    $ { \"fieldA\":99,
    $   \"fieldB\":\"beer\",
    $   \"ass-field\":\"ooie\",
    $   \"shit\":{\"fuck\":\"bitch\"}
    $ }}
b ← "{\"array\":[1,2,3,4],\"uhoh\":[\"a\",\"b\",\"c\"]}"
c ← "{\"field\":42069}"
d ← "{\"object1\":{\"field1\":50,\"field2\":\"apple\"}}"
e ← "{\"field\":\"ass\"}"

Strings ← (⊐⊜(↘1)◿2\+⌕@".)

Trim ← (↘1↘¯1)
Convert ← (⍣(parse)(Trim;:))
Csv ← (⊜□≠,@,)

WS ← [@ @\n@\r]
RemoveWhitespace ← (▽¬/+⊠=WS.)
Wrap ← (⊂⊂⊙:.)
Closing ← ((0@]|0@}|¯1",}")⊗:"[{")
TakeTo ← (↙⊢⊂⊃(+1⊚/+⊠=|⋅⧻)⊙.)
DropTo ← (↘⊢⊂⊃(+1⊚/+⊠=|⋅⧻)⊙.)
Extract ← (↘⊙TakeTo Closing ⊢.)
Values ← (⊐≡(Extract DropTo@:↘) ⊙¤ +1⊚=@: Trim .RemoveWhitespace)

List ← (⊐(≡Convert Csv Trim))
ParseValues ← (⊐(List|∘|Convert)⊗:"[{"∵⊢.)

Keys ← (⊐≡(⊢↙¯1Strings↙)⊙¤ +1⊚=@: Trim .RemoveWhitespace)
ReadJSON ← (⍉⊟⊃(Keys|ParseValues Values))
Fetch ← (⊐⊏⊚=□:⊏0⍉:⊙.)
ReadJSON a
Fetch "field1"
# ObjNames ← (⊐≡(⊢⇌)↘¯1⊐⊜(Strings)◿2\+/+⊠="}{")
# ObjFields ← (↘¯1⊐⊜(Csv ↘1)¬◿2\+/+⊠="}{")
# RefFields ← (⊐/⊂⊐≡(⊐≡(⍜(↻1)(⊂:⊂@.)):¤))
# FlatObjs ← (RefFields ⊃(ObjNames|ObjFields) .RemoveWhitespace)
# FlatObjs a
