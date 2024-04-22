# Rob's Uiua graphics library

# x0_y0 x1_y1
Line ← ◴⁅+⊃¤(⊞×÷⟜⇡×2/↥⌵.-) # Makes line by linear interpolation

# points
Polyline ← /◇⊂≡(□/Line)◫2 # Makes Polyline

# points
Polygon ← ◴Polyline⍜⊙⇌⊂⊢. # Makes Polygon 

# x_y r
Circle ← °⊚Polygon +¤:⁅×:÷2+1⍉⊟°∠×τ÷⟜⇡32: # Makes 32-gon (Circle) 

# Normalizes a list of points that may have components <0
# to have all components be >=0 for use with unwhere
Normalize ← -¤≡/↧⍉.
