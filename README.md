# Firebase Authentication Lab

## CSC 4360 - Mobile App Development

### In-Class Activity 13B

This Flutter application demonstrates Firebase Authentication using
email and password. It includes account registration, sign-in,
authentication state handling, a protected profile screen, password
updates, session restoration, and sign-out.

## Features

-   Register a new user with email and password
-   Sign in with an existing account
-   Monitor Firebase authentication state
-   Automatically route users based on sign-in status
-   Protect the profile screen from signed-out users
-   Display the signed-in user's email
-   Change the user's password
-   Support re-authentication when Firebase requires a recent login
-   Sign out
-   Validate email and password input
-   Display safe authentication error messages
-   Restore the authenticated session after the app is reopened
-   Display loading states during authentication operations

## Technologies Used

-   Flutter
-   Dart
-   Firebase Core
-   Firebase Authentication
-   FlutterFire CLI

## Project Structure

``` text
lib/
├── main.dart
├── firebase_options.dart
├── screens/
│   ├── authentication_screen.dart
│   └── profile_screen.dart
└── services/
    └── auth_service.dart
```

## Firebase Setup

1.  Create a Firebase project.
2.  Add an Android application to the Firebase project.
3.  Enable **Email/Password** under Firebase Authentication sign-in
    methods.
4.  Install the required Flutter packages:

``` bash
flutter pub add firebase_core firebase_auth
```

5.  Configure the Flutter project with FlutterFire:

``` bash
flutterfire configure
```

6.  Make sure Firebase is initialized before `runApp()` in `main.dart`.

7.  Make sure Android INTERNET permission is included in:

``` text
android/app/src/main/AndroidManifest.xml
```

The manifest should contain:

``` xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Run the Application

Install dependencies:

``` bash
flutter pub get
```

Run the application:

``` bash
flutter run
```

## Code Analysis

``` bash
flutter analyze
```

## Testing

The application was manually tested for:

-   Empty email and password validation
-   New user registration
-   Successful sign-in
-   Protected profile access
-   Display of the authenticated user's email
-   Failed sign-in with incorrect credentials
-   Safe authentication error feedback
-   Session restoration after closing and reopening the app
-   Password update
-   Re-authentication support for recent-login requirements
-   Rejection of the old password after a password change
-   Successful sign-in using the new password
-   Sign out
-   Return to the authentication screen after sign out

Automated Flutter tests can be run with:

``` bash
flutter test
```

## Authentication Design

Firebase authentication operations are centralized in `AuthService`.
This keeps authentication logic separate from the user interface and
makes the code easier to maintain.

The application listens to Firebase authentication state changes using
`authStateChanges()`. It automatically displays the authentication
screen when there is no signed-in user and the protected Profile screen
when a user is authenticated.

## Password Update

The Profile screen allows an authenticated user to update their
password.

If Firebase requires a recent login, the authentication service can
re-authenticate the user using their current credentials and retry the
password update. Password values are not stored in the application.

## Security

-   Authentication is handled by Firebase Authentication.
-   Password fields are obscured.
-   Passwords are not stored in Firestore or application code.
-   Authentication errors avoid exposing unnecessary account
    information.
-   The Profile screen is only displayed while a Firebase user is
    authenticated.
-   No service-account credentials or user passwords should be committed
    to the repository.

## Build Release APK

``` bash
flutter build apk --release
```

The generated APK is normally located at:

``` text
build/app/outputs/flutter-apk/app-release.apk
```

The release APK should be installed and tested before submission to
confirm that Firebase Authentication works correctly in the release
build.

## Main Authentication Flow

1.  Open the application.
2.  Register a new account or sign in.
3.  Firebase updates the authentication state.
4.  The authenticated user is shown the protected Profile screen.
5.  The Profile screen displays the signed-in email.
6.  The user can update their password.
7.  The user can sign out.
8.  After sign-out, the application automatically returns to the
    authentication screen.
