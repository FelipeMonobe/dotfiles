import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Config.Desktop (desktopLayoutModifiers, desktopConfig)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
  [ resource =? "gimp"      --> doFloat
  , resource =? "electron"  --> doFloat
  , resource =? "chromium"  --> doShift "1"
  , resource =? "atom"      --> doShift "2"
  , resource =? "code"      --> doShift "2"
  , resource =? "franz"     --> doShift "4"
  , resource =? "Studio 3T" --> doShift "5"
  , resource =? "spotify"   --> doShift "9"
  ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ desktopConfig {
        manageHook   = manageDocks <+> myManageHook
        , layoutHook = desktopLayoutModifiers $ layoutHook desktopConfig
        , logHook    = dynamicLogWithPP xmobarPP
                       { ppOutput = hPutStrLn xmproc
                       , ppTitle  = xmobarColor "green" "" . shorten 30
                       }
        , modMask            = mod4Mask
        , borderWidth        = 2
        , terminal           = "termite"
        , normalBorderColor  = "#FFFFFF"
        , focusedBorderColor = "#1793D0"
        , focusFollowsMouse  = False
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((controlMask, xK_Print)       , spawn "sleep 0.2; scrot -s -e 'mv $f ~/Screenshots/'")
        , ((0, xK_Print)                 , spawn "scrot -e 'mv $f ~/Screenshots/'")
        , ((mod4Mask, xK_Up)             , spawn "xbacklight -inc 5")
        , ((mod4Mask, xK_Down)           , spawn "xbacklight -dec 5")
        , ((mod4Mask, xK_Right)          , spawn "amixer set Master 2%+")
        , ((mod4Mask, xK_Left)           , spawn "amixer set Master 2%-")
        ]
