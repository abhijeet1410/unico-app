# Getting started

### Step 1
Clone this repository
[Flutter mobile template 3.0!](https://gitlab.com/boiler-plates2/flutter-mobile-template-3.0.git)

### Step 2: Update git configurations
Run below command
```
git remote rename origin old-origin
git remote add origin <YOUR GIT ORIGIN>
git push -u origin --all
git push -u origin --tags
```
### Step 3: Update project name
Rename project name in following files/folders
- Folder name
- Name in pubspec.yaml
- Change android package name [Stack overflow Reference](https://stackoverflow.com/a/29092698/12142044)
- Change the bundle identifier from your `Info.plist` file inside your ios/Runner directory.
   ```plist
   <key>CFBundleIdentifier</key>
   <string>com.your.packagename</string>
   ```
### Step 4: Configure pubspec.yaml
- Update environment sdk if new version is available
- Update and review dependancies
- Update font files in ./assets/fonts/ and add them to `pubspec.yaml`
- Add assets or logo to ./assets/icons/
- Add your assets to app_assets.dart
- Update font family in theme_config.dart
- Review flutter_launcher_icons configurations
- Run below command
```
flutter packages get
flutter pub run flutter_launcher_icons:main
flutter pub run intl_utils:generate
```
### Step 5: Configure App themes
- Update app_colors.dart
- Update app_themes.dart
- Update main.dart theme mode (if required)

### Step 6: Configure App Widgets
- Update app_decorations.dart for textfield decorations

### STEP 7: Adding assets
- ```cmd
  flutter pub global activate spider
  ```
- Add asset inside assets/icons/ with proper name.
- ```cmd
  spider build
  ```
- Import the resource
  ```dart
  import 'package:flutter_template_3/app/core/asset/resources.dart';
  ```
- Use the asset as AppAssets.<your_asset_name>
HOLA 😎😎


##Project Structure
```  
project  
|  pubspec.yaml             // project and packages configurations  
|  spider.yaml                  // assets configurations  
|  analysis_options.yaml     // configuration for analyzer  
|____assets  
|  |  
|  |_____fonts                  // font files  
|  |_____icons                  // all icons in png or svg formats  
|  |_____mocks                  // mock response files  
|  |_____anims                  // rive or lottie files  
|  
|____lib  
    |  
    |____app  
    |   |  
    |   |____core  
    |   |   |  
    |   |   |_____assets         // Parsed assets files from spider  
    |   |   |_____base               // contains BaseView, BaseWidget, Base Page, Base Controller  
    |   |   |_____bindings           // Global bindings  
    |   |   |_____device            // Device info datasouce to get the platform informations  
    |   |   |_____domain            // Contains Base Request and UseCase class  
    |   |   |_____local             // Database and preference managers  
    |   |   |_____middlewares       // Contains global middlewares  
    |   |   |_____models            // Global data model classes  
    |   |   |_____theme             // Contains colors and theme configurations  
    |   |   |_____utils               
    |   |   |     |  
    |   |   |     |_____asset_utils  
    |   |   |     |_____color_utils  
    |   |   |     |_____date_utils  
    |   |   |     |_____decorations  
    |   |   |     |_____file_utils  
    |   |   |     |_____login_utils  
    |   |   |     |_____notification_utils  
    |   |   |     |_____number_utils  
    |   |   |     |_____permission_utils  
    |   |   |     |_____snackbar_utils  
    |   |   |     |_____string_utils  
    |   |   |     |_____text_formatters  
    |   |   |     |_____validators  
    |   |   |  
    |   |   |_____widgets  
    |   |         |  
    |   |         |_____alerts              // Alert dialogs and alert sheets   
    |   |         |_____app_buttons         // Contains primary, circle, outlined and back buttons  
    |   |         |_____app_widgets         // Contains no internet, empty, error and loader widgets  
    |   |     
    |   |_____modules                       // Pages  
    |   |     |  
    |   |     |____demo_module  
    |   |         |  
    |   |         |_____data  
    |   |         |     |____datasource     // Contains API calls   
    |   |         |     |____models         // Data model files  
    |   |         |     |____repositories   // Mock and Remote repos  
    |   |         |       
    |   |         |_____domain  
    |   |         |      |____repositories   // Abstract repo  
    |   |         |      |____usecases       // Use cases for the repository  
    |   |         |         
    |   |         |_____presentation  
    |   |               |____controller       // Business logics for module  
    |   |               |___screen              
    |   |               |   |___widgets               // Local widgets to use inside module   
    |   |               |   |___module_screen.dart    // Content for the page              
    |   |               |                 
    |   |               |___module_page.dart  // Entry point for the page  
    |   |  
    |   |_____network           // Base network providers  
    |   |  
    |   |_____route             // Page and API routes  
    |   |  
    |   |_____my_app.dart     // starting Material Application  
    |  
    |_____flavors            // contains configs for dev or prod environments  
    |  
    |_____i10N               // Internationalisation files in arb format  
    |  
    |_____firebase_options.dart    // Firebase config generated by Firebase CLI  
    |  
    |_____main_dev.dart           // endpoint to start app with development config  
    |  
    |_____main_prod.dart      // endpoint to start app with production config  
```