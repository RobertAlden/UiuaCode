i ← &fras "json-formatted.txt"

TestA ← "{\"first-field\":\"Hello, World!\",\"object1\":{\"array1\":[1,2,3,4],\"subobj1\":{\"A\":\"apples\"},\"value1\":30},\"last-field\":[\"a\",\"b\",\"c\"],\"object2\":{\"array2\":[1,2,3,4],\"subobj2\":{\"B\":\"Bapples!\"},\"value2\":30}}"
TestB ← "{\"object1\":{\"array1\":[1,2,3,4],\"subobj1\":{\"A\":\"apples\"},\"value1\":30},\"last-field\":[\"a\",\"b\",\"c\"]}"
TestC ← "{\"array1\":[1,2,3,4],\"subobj1\":{\"A\":\"apples\"},\"value1\":30,\"last-field\":[\"a\",\"b\",\"c\"]}"

WS ← [@ @\n@\r]
RemoveWhitespace ← (▽¬/+⊠=WS.)
Wrap ← (⊂⊂⊙:.)
Trim ← (↘1↘¯1)
ModifiedText ← Trim RemoveWhitespace TestA
Whitespace ← [@\n@\r@\t@ ]
Next ← ⊃(⊢|↘1)

Obj ← "\"([\\w-]+?)\":\\{"
Field ← "\"([\\w-]+?)\":(\".*?\"|\\[.*?\\]|[\\d.-]+|\"null\"|\"True\"|\"False\")[,}]?,?"

Extract ← (:(:↘|[]⊙;;)(1 0|⊃(⊓±+.⊃(⊢⊚⌕|⧻)⊔⊢⊙.|↘1)) ±⧻.regex⊙.)

NextObjBody ← ▽=2\+/+⍜(⊡0)(↻¯1)⊠="}{".
NextObj ← (⊙(⇌⊂):⊃(□▽|↘1▽¬)\×±\+/-⍜(⊡0)(⬚0↻¯1)⊠="}{". ⊂@{|∘)⊙:=0⧻.: Extract Obj
NextField ← (Extract Field)
NextItem ← (:⊙⊙(;;)|;;)=0⧻.:⊃(NextField|NextObj)
KVPairs ← ≡⊂∩⇌;⍢(⊙(⊃(⊂↙⸮|⟜⊂↘)1) NextItem ⸮)(>0⧻)⊙([][])
Convert ← (⍣(parse)(Trim;:))

Depth ← /↥\+/-⊠="}{"
Reinsert ← □⊟:⍜▽;:⊙::
UnpackObjs ← ⊃(▽⊙.|∘) ≡(=@{⊢). ⍘⊟⇌⍉
ProcessObjs ← ⇌;⍢(⊙⊂:□KVPairs Trim ⊔ Next)(>0⧻) :[]
Final ← ;NextField Trim ⊔

Descend ← ProcessObjs UnpackObjs
Bottom ← ≡□⊐≡(≡Final UnpackObjs)
Ascend ← ≡(Reinsert)
KVPairs ModifiedText
Descend
Bottom
Ascend
Reinsert
