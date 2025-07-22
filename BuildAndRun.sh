# Build the application
xcodebuild  -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 16 Pro' build

# Boot the correct device
xcrun simctl boot 51280210-7C06-438A-B0BF-3282C982E6B2

# Open the simulator
open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/

# Install the app on the simulator
xcrun simctl install booted build/Release-iphonesimulator/GroupLunchPicker.app
