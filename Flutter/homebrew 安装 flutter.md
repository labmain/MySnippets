## Step 0 - Install Homebrew
Here is an article on how to install Homebrew Package Manager.

## Step 1 - Install SDKs

iOS & macOS
Visit the Apple Developer

```bash
brew install --cask android-studio
brew install --cask android-SDK
brew install --cask android-ndk
brew install --cask flutter
```
## Step 2 - Update Your Path

Mac OS X default can be this.

```bash
vi ~/.bash_profile
## ## ## ## ## ## ## ## ##
## Flutter
## ## ## ## ## ## ## ## ##
export PATH="`pwd`/flutter/bin:$PATH"
```
## Step 3 - Run Flutter Doctor

```bash
flutter doctor
/usr/local/Caskroom/android-sdk
```
## Install Xcode

```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer/
```
## Accept License

```bash
sudo xcodebuild -license
```
## Open an iOS Simulator.

```bash
open -a Simulator
```
## Step 4 - Create a Flutter Project

```bash
flutter create my_first_app
```

## Step 5: Deploy to iOS Device.
```bash
brew install GCC
brew update
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy cocoapods
pod setup
```
## Step 6 - Android
If you need help, this Stack Overflow is helpful.
```bash
flutter config --android-SDK
```
Step 8 - Start Application
```bash
flutter run
```