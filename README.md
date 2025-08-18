# AI Movie App 🎬

This application is built following **Clean Architecture** principles, leveraging **Dependency Injection**, **Shared Preferences**, and **Cubit/BLoC** for state management.

The entire app is designed with scalability and maintainability in mind, following a modular structure to separate concerns and ensure clean, testable code.

---

## Project Highlights ✨

- **Clean Architecture** for clear separation of layers and maintainable code.
- **Dependency Injection** to manage and inject dependencies easily.
- **Cubit/BLoC** state management for predictable and testable states.
- **Shared Preferences** for lightweight persistent data storage.
- **GoRouter** for flexible and clean navigation handling.
- **Service Locator** for easy dependency management across the app.

These patterns and tools are integrated throughout the entire application from the very beginning.

---

## First Implemented Feature: Splash Screen ✨

The **Splash Screen** is the first feature added to the app.  
It handles initial routing logic through the `DecideStartDestinationUseCase` and integrates seamlessly with the app’s theme system.

**Key Highlights of Splash Feature:**
- Clean routing with **GoRouter**.
- Theme initialization using **Shared Preferences** and `ThemeCubit`.
- Integrated with **Service Locator** for dependency management.
- White theme option alongside the original color palette.
- Minor structural improvements and cleanup.

---

## Screenshots 📸

<p align="center">
  <img src="assets/screenshots/splash_features/splash_dark.png" alt="Splash Screen Dark" width="300">
</p>

---

## Second Implemented Feature: OnBoarding Screen 🎉

The **OnBoarding Screen** introduces new users to the app features with a clean UI and smooth navigation.  
It is fully integrated using **Clean Architecture** principles with **Cubit** for state management and **Shared Preferences** to track if the onboarding was already visited.

**Key Highlights of OnBoarding Feature:**
- Uses **local data only** for images and text (no remote API required).
- Implements **OnBoardingLocalDataSource** and **OnBoardingRepository**.
- Includes **GetOnBoardingDataUseCase** and **SetOnBoardingVisitedUseCase**.
- Integrates **OnBoardingCubit** for state management.
- Provides **skip functionality** to navigate directly to SignUp/SignIn.
- Connects UI buttons with Cubit actions instead of direct local calls.
- OnBoarding pages display **3 slides** with informative text and images.
- Images for OnBoarding included in README for reference.

---

## OnBoarding Screenshots 📸

<p align="center">
  <img src="assets/screenshots/on_boarding_feature/onboarding_1.png" alt="OnBoarding Screen 1" width="300">
  <img src="assets/screenshots/on_boarding_feature/onboarding_2.png" alt="OnBoarding Screen 2" width="300">
  <img src="assets/screenshots/on_boarding_feature/onboarding_3.png" alt="OnBoarding Screen 3" width="300">
</p>

---

## Third Implemented Feature: Authentication Screens 🔑

The **Authentication Feature** includes SignIn, SignUp, and Forgot Password screens with a clean UI and smooth animations.  
It follows the **Clean Architecture** principles and integrates **Cubit/BLoC** for state management.

**Key Highlights of Auth Feature:**
- SignIn, SignUp, and Forgot Password screens with consistent UI design
- Custom reusable text fields and buttons
- Smooth entrance and error animations for form fields
- Connected with Cubit for state management and validation
- Integrated with Shared Preferences for lightweight persistent data
- Prepared placeholders for future interactive improvements

---

## Authentication Screenshots 📸


<p align="center">
  <img src="assets/screenshots/auth_feature/sign_in.png" alt="SignIn Screen" width="300">
  <img src="assets/screenshots/auth_feature/sign_up_1.png" alt="SignUp Screen" width="300">
  <img src="assets/screenshots/auth_feature/sign_up_2.png" alt="SignUp Screen" width="300">
  <img src="assets/screenshots/auth_feature/forgot_password.png" alt="Forgot Password Screen" width="300">
</p>

---

### Fourth Implemented Feature: Home Feature 🏠 (⏳ in progress) 

The Home Feature is the core of the AI Movie App, providing users with a dynamic and interactive dashboard of movies and TV shows.
It follows Clean Architecture principles and integrates Cubit/BLoC for state management, fetching data from remote APIs, and rendering it efficiently.

Key Highlights of Home Feature:

Dynamic Content Fetching from TMDB API for Now Playing, Upcoming, Top Rated, and Popular Movies & TV Shows.

Separate Cubits/BLoCs for each category to ensure isolated and maintainable state management.

Interactive UI Components including carousels, horizontal lists, and grid views.

Loading & Error Handling using Skeletons/Shimmers for smooth UX.

Clean Separation of Concerns between Presentation, Domain, and Data layers.

Service Locator Integration for dependency injection of repositories and use cases.

Reusability of widgets like MovieCard, TVSeriesCard, and FeatureBoxListView.

Optimized Network Requests with caching where necessary.


---

Home Feature Screenshots 📸

<p align="center">
  <img src="assets/screenshots/home_feature/home.png" alt="Splash Screen Dark" width="300">
</p>

---