#!/bin/bash

# .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true
defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool true


# Disk Utility
defaults write com.apple.DiskUtility "SidebarShowAllDevices" -bool true


# Enable Dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'


# Dock
defaults write com.apple.dock "autohide" -bool true
defaults write com.apple.dock "autohide-delay" -float 0.1
defaults write com.apple.dock "autohide-time-modifier" -float 0.1
defaults write com.apple.dock "expose-animation-duration" -float 0.1
defaults write com.apple.dock "expose-group-apps" -bool true
defaults write com.apple.dock "minimize-to-application" -bool true
defaults write com.apple.dock "mru-spaces" -bool false
defaults write com.apple.dock "showDesktopAnimationDuration" -float 0.1
defaults write com.apple.dock "show-process-indicators" -bool true
defaults write com.apple.dock "show-recents" -bool false
defaults write com.apple.dock "size-immutable" -bool true
defaults write com.apple.dock "tilesize" -int 60
defaults write com.apple.dock "workspaces-swoosh-animation-off" -bool true
# Hot corners
defaults write com.apple.dock "wvous-tl-corner" -int 3
defaults write com.apple.dock "wvous-tr-corner" -int 2
defaults write com.apple.dock "wvous-bl-corner" -int 5
defaults write com.apple.dock "wvous-br-corner" -int 10
killall Dock


# Finder
defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool true
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool true
defaults write com.apple.finder "FXArrangeGroupViewBy" -string Name
defaults write com.apple.finder "FXDefaultSearchScope" -string SCcf
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false
defaults write com.apple.finder "FXPreferredViewStyle" -string Nlsv
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool false
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool false
defaults write com.apple.finder "ShowiCloudDrive" -bool false
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool false
defaults write com.apple.finder "ShowPathbar" -bool false
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool false
defaults write com.apple.finder "ShowStatusBar" -bool true
defaults write com.apple.finder "WarnOnEmptyTrash" -bool false
killall Finder


# ImageCapture
defaults -currentHost write com.apple.ImageCapture "disableHotPlug" -bool true


# Misc
defaults write NSGlobalDomain "AppleMiniaturizeOnDoubleClick" -bool true
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool true
defaults write NSGlobalDomain "NSCloseAlwaysConfirmsChanges" -bool false
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool true
defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint" -bool true
defaults write -g "com.apple.sound.beep.feedback" -bool false
sudo nvram StartupMute=%01


# Safari
defaults write com.apple.Safari "AutoOpenSafeDownloads" -bool false
defaults write com.apple.Safari "DownloadsClearingPolicy" -bool true
defaults write com.apple.Safari "EnableNarrowTabs" -bool false
defaults write com.apple.Safari "HideStartPageSiriSuggestionsEmptyItemView" -bool false
defaults write com.apple.Safari "HistoryAgeInDaysLimit" -int 7
defaults write com.apple.Safari "IncludeDevelopMenu" -bool true
defaults write com.apple.Safari "NeverUseBackgroundColorInToolbar" -bool false
defaults write com.apple.Safari "OpenNewTabsInFront" -bool false
defaults write com.apple.Safari "PrivateBrowsingRequiresAuthentication" -bool true
defaults write com.apple.Safari "PrivateSearchEngineUsesNormalSearchEngineToggle" -bool true
defaults write com.apple.Safari "SearchProviderShortName" -string DuckDuckGo
defaults write com.apple.Safari "ShowBackgroundImageInFavorites" -bool false
defaults write com.apple.Safari "ShowFavorites" -bool false
defaults write com.apple.Safari "ShowFrequentlyVisitedSites" -bool false
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool true
defaults write com.apple.Safari "ShowHighlightsInFavorites" -bool false
defaults write com.apple.Safari "ShowOverlayStatusBar" -bool true
defaults write com.apple.Safari "ShowPrivacyReportInFavorites" -bool false
defaults write com.apple.Safari "ShowReadingListInFavorites" -bool false
defaults write com.apple.Safari "ShowSiriSuggestionsPreference" -bool false
defaults write com.apple.Safari "ShowStandaloneTabBar" -bool false
defaults write com.apple.Safari "TabCreationPolicy" -int 2
defaults write com.apple.Safari "WebKitDeveloperExtrasEnabledPreferenceKey" -bool true


# Screenshots
defaults write com.apple.screencapture "location" -string ~/Downloads
defaults write com.apple.screencapture "name" -string Screenshot
defaults write com.apple.screencapture "type" -string png
killall SystemUIServer


# Software Update
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate "AutomaticCheckEnabled" -bool false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate "AutomaticDownload" -bool false


# TextEdit
defaults write com.apple.TextEdit "CheckSpellingWhileTyping" -bool false
defaults write com.apple.TextEdit "CorrectSpellingAutomatically" -bool false
defaults write com.apple.TextEdit "RichText" -bool false
defaults write com.apple.TextEdit "ShowRuler" -bool false
defaults write com.apple.TextEdit "SmartCopyPaste" -bool false
defaults write com.apple.TextEdit "SmartDashes" -bool false
defaults write com.apple.TextEdit "SmartQuotes" -bool false
defaults write com.apple.TextEdit "SmartSubstitutionsEnabledInRichTextOnly" -bool false
defaults write com.apple.TextEdit "TextReplacement" -bool false


# Time Machine
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool true


# Trackpad
defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool true


# WindowManager
defaults write com.apple.WindowManager "AppWindowGroupingBehavior" -bool true
defaults write com.apple.WindowManager "AutoHide" -bool true
defaults write com.apple.WindowManager "HasDisplayedShowDesktopEducation" -bool true
defaults write com.apple.WindowManager "StageManagerHideWidgets" -bool true
defaults write com.apple.WindowManager "StandardHideDesktopIcons" -bool true
defaults write com.apple.WindowManager "StandardHideWidgets" -bool true


# Login message
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "This computer system is for authorized users only. 
All activity may be monitored and logged."
