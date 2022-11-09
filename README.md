# Person Manager

## Getting Started

This project is a Person Manager

- clean architecture with [Bloc](https://https://pub.dev/packages/get)
- Report bar chat using [Dchart](https://pub.dev/packages/d_chart) between difference start alarm and stop gesture to move clock hands to adjust the time for the alarm 
- Rest API service with [DIO](https://pub.dev/packages/dio)
- Auto Route with [NAV ROUTER](https://github.com/chairilrafi11/nav_router)
- Loading screen with shimmer effect [SHIMMER](https://pub.dev/packages/shimmer)

For help getting started with Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Development Setup
Clone the repository and run the following commands:
```
flutter pub get
flutter run
```

## Guide & Screenschoot

### Home
<img src="assets/screenshots/home.PNG" />

modern interface with simple material wigdet, all buttons are above the user list to make it visible and easier

Users can search for objects by name, address, email and phone number

<img src="assets/screenshots/option.PNG" />

also sort the list by name
filter object by city
clear current filter

<img src="assets/screenshots/shimmer.PNG" />

loading screen shimmer when get response form api 

### Form 
<img src="assets/screenshots/form.PNG" />

simple but modern user data addition form. 

there is a form validation (user must fill in all data to be able to create)
