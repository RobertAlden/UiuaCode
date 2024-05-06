# Rob's Uiua Complex Number Graphics library

# Produces N values evenly between [0, 1]
# Exmaple:[0 0.25 0.5 0.75 1] <- NormalRange 5
NormalRange ← (⊂0÷⟜⍜¯⇡-1)

# Produces a complex number matrix over the range [-1 1],[-i i]
NormalComplexField ← ⊞ℂ⇌.⊂¯⇌⟜(↘1)NormalRange

# (L)erps between values in a shape [n] array by some factor.
# Example: [7.5 15] <- Lerp [5 10 20] 0.5
Lerp ← +≡⊃(⊢|×/-)◫2

# Takes shape [n] array of complex numbers 
# and a scalar positive step count
# de Casteljau's algorithm
# https://pomax.github.io/bezierinfo/#decasteljau
Bezier ← ♭⊙◌≡⍢(Lerp ⊙.)(>1⧻)¤ ⊙NormalRange

# Renders an array/arrays of complex numbers as an image/gif, respectively.
v ← °⊚⍉[°ℂ]
Render ← ≠0⟨v|⬚0◇≡(v)⟩>1⧻△.◴⁅-/↧♭⬚0≡°□.

# Uses Lerp to create a line between two complex numbers.
# [c1 c2] -> [points of line between c1 and c2]
Line ← ♭⁅≡Lerp¤⟜(NormalRange⌈⌵/-)

# Interprets a shape [n] array of complex numbers as an
# polyline, with the points as the vertices
# [c1 c2 c3...] -> [series of points of polyline]
Polyline ← ♭/◇⊂≡(□Line)◫2

# Interprets a shape [n] array of complex numbers as an
# polygon, with the points as the vertices
# [c1 c2 c3...] -> [series of points of polygon]
Polygon ← ◴Polyline⍜⊙⇌⊂⊢.
