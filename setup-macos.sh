# stop leaving screenshots all over the desktop
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots
killall SystemUIServer

# Install http://asepsis.binaryage.com/#installation to stop leaving .DS_Store files everywhere
