import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
          manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook    = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle  = xmobarColor "green" "" . shorten 50
                        }
        , modMask            = mod4Mask
        , borderWidth        = 2
        , terminal           = "termite"
        , normalBorderColor  = "#FFFFFF"
        , focusedBorderColor = "#1793D0"
        , focusFollowsMouse  = False
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((controlMask, xK_Print)       , spawn "sleep 0.2; scrot -s -e 'mv $f ~/screenshots/'")
        , ((0, xK_Print)                 , spawn "scrot -e 'mv $f ~/screenshots/'")
        , ((mod4Mask, xK_Up)             , spawn "xbacklight -inc 5")
        , ((mod4Mask, xK_Down)           , spawn "xbacklight -dec 5")
        , ((mod4Mask, xK_Right)          , spawn "amixer set Master 2%+")
        , ((mod4Mask, xK_Left)           , spawn "amixer set Master 2%-")
        ]
