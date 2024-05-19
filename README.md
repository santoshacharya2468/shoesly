# SHOESLY 

## Project Setup Instructions

To get the project up and running on your local machine, follow these steps:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/santoshacharya2468/shoesly
    cd your-repository
    ```

2. **Install Flutter:**
    - Follow the instructions to install Flutter from the [official documentation](https://flutter.dev/docs/get-started/install).

3. **Set up FlutterFire:**
    - Install the FlutterFire CLI:
        ```bash
        dart pub global activate flutterfire_cli
        ```
    - Configure your Firebase project:
        ```bash
        flutterfire configure
        ```

4. **Install dependencies:**
    ```bash
    flutter pub get
    ```

5. **Run the application:**
    - For a specific device (e.g., iOS simulator, Android emulator):
        ```bash
        flutter run
        ```
    - To see the list of available devices:
        ```bash
        flutter devices
        ```

## Assumptions Made During Development

1. **Brand Images:** All brand images are in SVG format.
2. **Product Thumbnails and Images:** Products have both thumbnails and images, both transparent in nature.
3. **Product Gender:** Products are designed for only one gender or can be selected as unisex.
4. **Color Options:** Products have multiple color options available.
5. **Cart Selection:** While adding to the cart, the color and size of the product must be selected.
6. **Price Range:** The upper limit of the product price range is $1750.
7. **Checkout Process:** All products in the cart can be checked out at once; there is no feature to select particular items during checkout.
8. **Address and Payment:** Address and payment features are not implemented.

## Challenges Faced and How They Were Overcome
1. **Filter Feature:**
    - **Challenge:** Adding a filter feature with about 5 fields to be filtered once or in combination. Firestore requires creating composite indexes for each combination, leading to a large number of possible combinations.
    - **Solution:** Made a combination of all 5 fields in every query. In case the user did not select any of the fields, default values for those filters were passed in the query. This way, the query always includes all 5 fields, so only one composite index is needed.

2. **Color Filter for Images:**
    - **Challenge:** Creating a color filter for images where the provided image did not work for both cases (e.g., different color representations or formats).
    - **Solution:** Implemented a custom image filter using the `ImageFilter` widget provided by Flutter. However, faced issues when the product color was in a white background. Due to time constraints, was unable to fix 100% of the issues, but the filter works for most cases.

3. **Firebase Configuration:**
    - **Challenge:** Configuring Firebase for both Android and iOS.
    - **Solution:** Used FlutterFire CLI to simplify the configuration process and ensure consistent setup across platforms.

4. **Cross-Platform Consistency:**
    - **Challenge:** Ensuring the app functions seamlessly on both iOS and Android devices.
    - **Solution:** Regularly tested on both platforms during development and used platform-specific code sparingly.

5. **Dependency Management:**
    - **Challenge:** Keeping dependencies up to date and resolving conflicts.
    - **Solution:** Used `flutter pub outdated` to monitor outdated packages and resolve conflicts promptly.

## Additional Features and Improvements
1. **State Management:** Implemented a state management solution using Flutter bloc for better scalability and maintainability.
2. **Improved UI/UX:** Enhanced the user interface with custom widgets and animations for a better user experience.
