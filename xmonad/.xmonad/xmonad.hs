import XMonad

main = xmonad $ def
    {
        borderWidth = 10,
        terminal = "terminator",
        normalBorderColor = "#ffffff",
        focusedBorderColor = "#0000ee"
    }
