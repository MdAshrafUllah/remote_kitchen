# Assignment For Remote Kitchen

## Setup and Run
``` bash
git clone https://github.com/MdAshrafUllah/remote_kitchen.git 
``` 

#### Open assignment_eight folder. Then Go to pubspec.yaml file. Run the below command in your terminal.

``` bash
Flutter pub get
```

#### Go To https://www.weatherapi.com/ to get weather API. Then add The API in the assignment five folder API file.

``` bash
asssignment_eight
|
|--lib-|
       |--data-|
               |--assignment five-|
                                  |--api.dart
```

#### Go To https://cloud.google.com/ to get Google Map API. Then go to "assignment_eight/android/app/src/main/AndroidManifest.xml." Add your Google Map API to the "YOUR API HEAR" Text.

``` bash
asssignment_eight
|
|--android-|
           |--app-|
                  |--src-|
                         |--main-|
                                 |--AndroidManifest.xml
```

#### Go to https://firebase.google.com/ . then Go to the console. then Add your project to Firebase. Download the the google-services.json file. add this file in "assignment_eight/android/app/" location.

``` bash
asssignment_eight
|
|--android-|
           |--app-|
                  
```

#### open "assignment_eight/lib/main.dart" file. Then add All FirebaseOptions info from your google-services.json file. Then Run The below Commend. If you set up everything OK, then you will be able to check the app.

``` bash
Flutter run
```


### Final Output

https://github.com/MdAshrafUllah/remote_kitchen/assets/96839511/5cb8d07e-9c5d-4bc6-99e4-d3c741fdc259
