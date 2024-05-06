# Rob's Uiua Complex Number Graphics library

NormalRange ← (⊂0÷⟜⍜¯⇡)

# (L)erps between values in a shape [n] array by some factor.
# Example: [7.5 15] <- Lerp [5 10 20] 0.5
Lerp ← +≡⊃(⊢|×/-)◫2

# de Casteljau's algorithm
# https://pomax.github.io/bezierinfo/#decasteljau
Bezier ← ♭⊙◌≡⍢(Lerp ⊙.)(>1⧻)¤ ⊙NormalRange

# Renders a shape [n] array of complex numbers as an image.
Render ← &ims≠0°⊚◴⁅-¤/↧.⍉[°ℂ]

# Uses Lerp to create a line between two complex numbers.
# [c1 c2] -> [points of line between c1 and c2]
Line ← ⁅≡Lerp¤⟜(NormalRange⁅⌵/-)

# Interprets a shape [n] array of complex numbers as an
# polyline, with the points as the vertices
# [c1 c2 c3...] -> [series of points of polyline]
Polyline ← ♭/◇⊂≡(□Line)◫2

# Interprets a shape [n] array of complex numbers as an
# polygon, with the points as the vertices
# [c1 c2 c3...] -> [series of points of polygon]
Polygon ← ◴Polyline⍜⊙⇌⊂⊢.
