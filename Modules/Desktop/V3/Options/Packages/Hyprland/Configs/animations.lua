
-- Curves
hl.curve( "myCurve", { type="bezier", points={ {0.12, 0.92}, {0.08, 1.0 } } } )

-- Animations
hl.animation({ leaf="windows",          enabled=true, speed=8,  bezier="myCurve", style="slide" })
hl.animation({ leaf="windowsIn",        enabled=true, speed=6,  bezier="myCurve", style="slide" })
hl.animation({ leaf="windowsOut",       enabled=true, speed=6,  bezier="myCurve", style="slide" })
hl.animation({ leaf="windowsMove",      enabled=true, speed=6,  bezier="myCurve", style="slide" })
hl.animation({ leaf="workspaces",       enabled=true, speed=5,  bezier="myCurve", style="slidevert" })
hl.animation({ leaf="layers",           enabled=true, speed=4,  bezier="myCurve", style="popin" })
hl.animation({ leaf="border",           enabled=true, speed=15, bezier="myCurve" })
hl.animation({ leaf="borderangle",      enabled=true, speed=15, bezier="myCurve" })
hl.animation({ leaf="fadeIn",           enabled=true, speed=1,  bezier="myCurve" })
hl.animation({ leaf="fadeOut",          enabled=true, speed=1,  bezier="myCurve" })
hl.animation({ leaf="fadeSwitch",       enabled=true, speed=7,  bezier="myCurve" })
hl.animation({ leaf="fadeDim",          enabled=true, speed=7,  bezier="myCurve" })
hl.animation({ leaf="fadeLayers",       enabled=true, speed=7,  bezier="myCurve" })