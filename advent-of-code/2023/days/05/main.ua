RangeOffset ← ≡(⍜(⊏1)(-1)⊃(⊂⊙+.⊢|/-)⊃(⇌↘|⊏)¯1)
Seeds ← ⊜parse≠@ . ⊔⊡0_1 regex "seeds: ([\\d ]+)"
ReadMap ← ⊃(⋅∘|∩¤ RangeOffset⊜(⊜(parse)≠@\s.)≠@\n. ⊔⊡0_1 regex)
SeedToSoil ← "seed-to-soil map:([\n\\d ]+)\n\n"
SoilToFert ← "soil-to-fertilizer map:([\n\\d ]+)\n\n"
FertToWater ← "fertilizer-to-water map:([\n\\d ]+)\n\n"
WaterToLight ← "water-to-light map:([\n\\d ]+)\n\n"
LightToTemp ← "light-to-temperature map:([\n\\d ]+)\n\n"
TempToHumi ← "temperature-to-humidity map:([\n\\d ]+)\n\n"
HumiToLoc ← "humidity-to-location map:([\n\\d ]+)\n\n"

ApplyMap ← +⊃(∘|(0;|⊏⊢)=1⧻.⊚≡(≍⊃(⍏|⇡⧻)⍜(↻¯1)⊂:))
EvalSeed ← (⍥(ApplyMap)7)
Init ← (
  &fras
  ReadMap HumiToLoc
  ReadMap TempToHumi
  ReadMap LightToTemp
  ReadMap WaterToLight
  ReadMap FertToWater
  ReadMap SoilToFert
  ReadMap SeedToSoil
  Seeds
)

Silver ← (⊢⊏⍏.≡EvalSeed)
Init "test.txt"
