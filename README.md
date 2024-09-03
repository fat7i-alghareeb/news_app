# news_app
The News App delivers real-time news updates across various categories, offering a comprehensive and dynamic news-reading experience. This application emphasizes performance and scalability, with features like short-term caching, dark mode, and seamless API integration, making it an essential tool for staying informed.

**For full details please check my LinkedIn profile**: [My Profile](https://www.linkedin.com/in/fathi-alghareeb/)

## Features
- **Trending News by Category:** Access the most current news from a variety of categories, all in one place.
- **Instant News Updates:** Receive real-time news updates as they happen, ensuring you're always informed.
- **Go to Source:** Each news article includes a link to the original source, allowing users to read the full story on the official website.
- **Shimmer Effect:** A Shimmer effect is applied during loading, providing a visually appealing placeholder while news content is being fetched.
- **Dark Theme Support:** Users can switch between light and dark themes, enhancing readability in different lighting conditions.
- **Short-term Caching:** To improve performance, the app caches news articles for a short duration, reducing the need to repeatedly fetch the same data.
- **Splash Screen:** A dynamic splash screen that is fully compatible with Android 12 and earlier versions, creating a seamless start-up experience.
- **Refresh Indicator** Just drop the screen down to re-fetch your data

### News App Interface
![Picsart_24-08-09_10-30-02-126](https://github.com/user-attachments/assets/22dd7422-503e-4aee-bed6-3d647590871e)

## Technology

1. **Bloc**  
   A state management solution that simplifies the control of the application's state, making it easier to manage and test the app.
4. **Retrofit with Dio**  
   A combination of powerful HTTP clients used to handle complex API requests, including pagination and data serialization, ensuring smooth data processing.
3. **MVVM Architecture**  
   The MVVM pattern enhances the modularity of the codebase, allowing for easier maintenance and scalability of the app.
4. **Hive**  
   A lightweight and fast key-value database is used to persist data locally, ensuring that tasks are stored securely and efficiently.
5. **Url Launcher**  
   A Flutter plugin that allows the app to open URLs directly in the browser, providing users with quick access to the original news sources.
6. **Card Swiper**  
   A flexible Swiper/Carousel package that provides an engaging way to browse through different news categories.
