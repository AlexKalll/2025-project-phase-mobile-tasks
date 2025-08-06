# Simple Ecommerce App

This is a simple e-commerce application built with Flutter, demonstrating basic product listing, adding new products, editing existing products, and viewing product details to grap the concept of navigation and routing in Flutter. It includes image picking functionality for adding product images.


## Features

*   **Product Listing**: View a list of available products.
*   **Add Product**: Add new products with details such as name, category, price, description, and an image.
*   **Edit Product**: Modify details of existing products.
*   **Product Detail**: View detailed information about a specific product.
*   **Image Picking**: Select images from the device gallery for product images.

## How to Run the App

To run this Flutter application, follow these steps:

1.  **Clone the repository** (if applicable):
    ```bash
    git clone https://github.com/AlexKalll/2025-project-phase-mobile-tasks.git

    cd 2025-project-phase-mobile-tasks

    cd task7
    ```

2.  **Ensure Flutter is installed**: If you don't have Flutter installed, follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

3.  **Install dependencies**: Navigate to the project root directory (`task7`) and run:
    ```bash
    flutter pub get
    ```

4.  **Update Android NDK Version (if necessary)**: If you encounter an NDK version mismatch error during `flutter run`, ensure your `android/app/build.gradle.kts` file has the correct `ndkVersion` set due to the `image_picker` dependency. As of the last update, it should be:
    ```kotlin
    android {
        ndkVersion = "27.0.12077973"
    }
    ```

5.  **Run the application**: Connect a device or start an emulator, then run the app using:
    ```bash
    flutter run
    ```

## Additional Information for Reviewers

*   The `image_picker` package is used for image selection. The local `_image_picker_placeholder.dart` file was renamed to avoid conflicts with the package.
*   Product data is currently hardcoded within the `ProductList` widget for demonstration purposes.
*   Form validation is implemented for product input fields.
*   Navigation between screens is handled using Flutter's `Navigator`.
*   Routing is configured in the `main.dart` file, mapping routes to corresponding widgets.
*   The app follows a basic MVC (Model-View-Controller) architecture for organization.
*   The `ProductList` widget is the home screen, and it displays a list of products.
*   Tapping on a product item navigates to the `ProductDetail` screen, showing detailed information about the selected product.
*   The `NewProduct` screen allows users to add new products with input fields for name, category, price, description, and an image.
*   The `EditProduct` screen enables users to modify existing product details.
*   The `ProductDetail` screen displays product information and provides options to edit or delete the product.