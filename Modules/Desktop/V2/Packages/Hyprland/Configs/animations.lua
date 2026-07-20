
-- Curves
hl.curve( "myCurve" { type="bezier", points={ {0.12, 0.92}, {0.08, 1.0 } } } )

-- Animations
hl.animation({ leaf="windows",          enabled=true, speed=1, bezier="myCurve", style="slide" })
-- hl.animation({ leaf="windowsIn",     enabled=true, speed=1, bezier="myCurve", style="slide" })
-- hl.animation({ leaf="windowsOut",    enabled=true, speed=1, bezier="myCurve", style="slide" })
-- hl.animation({ leaf="windowsMove",   enabled=true, speed=1, bezier="myCurve", style="slide" })
hl.animation({ leaf="layers",           enabled=true, speed=1, bezier="myCurve", style="slide" })
hl.animation({ leaf="fade",             enabled=true, speed=1, bezier="myCurve", style="slide" })
hl.animation({ leaf="workspaces",       enabled=true, speed=1, bezier="myCurve", style="slide" })
hl.animation({ leaf="border",           enabled=true, speed=1, bezier="myCurve", style="slide" })
hl.animation({ leaf="borderangle",      enabled=true, speed=1, bezier="myCurve", style="slide" })