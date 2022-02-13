#!/usr/bin/env bash

CONFIG_MACOS=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# configure-macos
# parameters: [CONFIG_MACOS] true or false
# note: requires password to make system changes
#-------------------------------------------------------------------------------------------------------------
if [ "${CONFIG_MACOS}" = "true" ]; then
    
    echo "Configuring MacOS..."
    #---------------------------------------------------------------------------------------------------------
    # name
    #---------------------------------------------------------------------------------------------------------
    sudo scutil --set ComputerName "noctua"
    sudo scutil --set HostName "noctua"
    sudo scutil --set LocalHostName "noctua"
    
    #---------------------------------------------------------------------------------------------------------
    # control center
    #---------------------------------------------------------------------------------------------------------
    defaults -currentHost write "com.apple.controlcenter" "BatteryShowPercentage" -int 1
    defaults -currentHost write "com.apple.controlcenter" "Bluetooth" -int 18
    defaults -currentHost write "com.apple.controlcenter" "Display" -int 16
    defaults -currentHost write "com.apple.controlcenter" "Sound" -int 16

    defaults write "com.apple.controlcenter" "NSStatusItem Visible Bluetooth" -int 1
    defaults write "com.apple.controlcenter" "NSStatusItem Visible Display" -int 1
    defaults write "com.apple.controlcenter" "NSStatusItem Visible ScreenMirroring" -int 1
    defaults write "com.apple.controlcenter" "NSStatusItem Visible Sound" -int 1
    
    #---------------------------------------------------------------------------------------------------------
    # dock
    #---------------------------------------------------------------------------------------------------------
    defaults write "com.apple.dock" "magnification" -int 1
    defaults write "com.apple.dock" "tilesize" -int 33
    
    #---------------------------------------------------------------------------------------------------------
    # trackpad/mouse
    #---------------------------------------------------------------------------------------------------------
    defaults write "com.apple.driver.AppleBluetoothMultitouch.mouse" "MouseButtonDivision" -int 55
    defaults write "com.apple.driver.AppleBluetoothMultitouch.mouse" "MouseButtonMode" -string "TwoButton"
    defaults write "com.apple.driver.AppleBluetoothMultitouch.mouse" "MouseOneFingerDoubleTapGesture" -int 1
    defaults write "com.apple.driver.AppleBluetoothMultitouch.mouse" "MouseTwoFingerDoubleTapGesture" -int 3

    defaults write "com.apple.AppleMultitouchMouse" "MouseButtonDivision" -int 55
    defaults write "com.apple.AppleMultitouchMouse" "MouseButtonMode" -string "TwoButton"
    defaults write "com.apple.AppleMultitouchMouse" "MouseOneFingerDoubleTapGesture" -int 1
    defaults write "com.apple.AppleMultitouchMouse" "MouseTwoFingerDoubleTapGesture" -int 3

    defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "Clicking" -int 1
    defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "TrackpadCornerSecondaryClick" -int 2
    defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "TrackpadRightClick" -int 0
    defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "TrackpadTwoFingerDoubleTapGesture" -int 1

    defaults write "com.apple.AppleMultitouchTrackpad" "Clicking" -int 1
    defaults write "com.apple.AppleMultitouchTrackpad" "TrackpadCornerSecondaryClick" -int 2
    defaults write "com.apple.AppleMultitouchTrackpad" "TrackpadRightClick" -int 0
    defaults write "com.apple.AppleMultitouchTrackpad" "TrackpadTwoFingerDoubleTapGesture" -int 1

    defaults -currentHost write -g "com.apple.mouse.tapBehavior" -int 1
    defaults -currentHost write -g "com.apple.trackpad.enableSecondaryClick" -int 0
    defaults -currentHost write -g "com.apple.trackpad.scrollBehavior" -int 2
    defaults -currentHost write -g "com.apple.trackpad.trackpadCornerClickBehavior" -int 1
    defaults -currentHost write -g "com.apple.trackpad.twoFingerDoubleTapGesture" -int 1
    defaults write -g "com.apple.trackpad.forceClick" -int 1
    defaults write -g "AppleEnableMouseSwipeNavigateWithScrolls" -int 1
    defaults write -g "ContextMenuGesture" -int 1
    
    #---------------------------------------------------------------------------------------------------------
    # style
    #---------------------------------------------------------------------------------------------------------
    defaults write -g "AppleInterfaceStyleSwitchesAutomatically" -int 1
    
    #---------------------------------------------------------------------------------------------------------
    # extenstions
    #---------------------------------------------------------------------------------------------------------
    defaults write -g "AppleShowAllExtensions" -int 1
    
    #---------------------------------------------------------------------------------------------------------
    # automatic text
    #---------------------------------------------------------------------------------------------------------
    defaults write -g "NSAutomaticCapitalizationEnabled" -int 0
    defaults write -g "NSAutomaticDashSubstitutionEnabled" -int 0
    defaults write -g "NSAutomaticPeriodSubstitutionEnabled" -int 0
    defaults write -g "NSAutomaticQuoteSubstitutionEnabled" -int 0
    defaults write -g "NSAutomaticSpellingCorrectionEnabled" -int 0
    defaults write -g "NSAutomaticTextCompletionEnabled" -int 0
    
    #---------------------------------------------------------------------------------------------------------
    # finder
    #---------------------------------------------------------------------------------------------------------
    defaults write "com.apple.finder" "FXPreferredViewStyle" -string "Nlsv"
    defaults write "com.apple.finder" "NewWindowTarget" -string "PfVo"
    defaults write "com.apple.finder" "NewWindowTargetPath" -string "file:///"
    defaults write "com.apple.finder" "PreferencesWindow.LastSelection" -string "SDBR"
    defaults write "com.apple.finder" "SearchRecentsSavedViewStyle" -string "Nlsv"
    defaults write "com.apple.finder" "SearchRecentsSavedViewStyleVersion" -string "%00%00%00%01"
    defaults write "com.apple.finder" "ShowPathbar" -int 1
    defaults write "com.apple.finder" "ShowSidebar" -int 1
    defaults write "com.apple.finder" "ShowStatusBar" -int 1
    defaults write "com.apple.finder" "SidebarDevicesSectionDisclosedState" -int 1
    defaults write "com.apple.finder" "SidebarPlacesSectionDisclosedState" -int 1

    echo "Configure MacOS...Done!"
fi
