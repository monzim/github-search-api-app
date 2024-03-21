# Git Search

### Api

- [GitHub API](https://docs.github.com/en/rest)

## Description

A simple app using the GitHub API to search for repositories. Use the search bar to search for repositories by name. Click on a repository to view more details.

## Installation

1. Clone the repository
2. cd into the repository
3. Run `flutter pub get`
4. Run `flutter run -d <device>` to run the app

## Features

- Search for repositories by name with pagination also have with sorting and order options with choose the limit search results
- View repository details
- Cache search results for offline use
- Perodic refresh data fetching with caching
- Centralized Api called with the option to add authentication.
- Setting page with the option to change the theme, font, and language, cache management, and more
- Material You support with dynamic theming
- [Internationalization](lib/services/localization) support (English and Bangla)
- Dark mode support
- Font customization
- Name route navigation with [go_router](https://pub.dev/packages/go_router)

## Device Support

-[x] Android -[x] iOS

## Technical Details

- State management with [Riverpod](https://riverpod.dev) with [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)
- API requests with [http](https://pub.dev/packages/http) package
- [Freezed](https://pub.dev/packages/freezed) with [JsonSerializable](https://pub.dev/packages/json_annotation) for models also with [json_serializable](https://pub.dev/packages/json_serializable) for json serialization with [freezed_annotation](https://pub.dev/packages/freezed_annotation)
- Internationalization with flutter_localizations
- Local storage with [isar](https://pub.dev/packages/isar)
- Code generation with [build_runner](https://pub.dev/packages/build_runner)
- [Aurora](https://docs.aurora.monzim.com/) architecture.

## Architecture

I am using my own made architecture called [Aurora](https://docs.aurora.monzim.com/). It is easy use because I already made starting template and tooling to generate code. You can check the [Aurora](https://docs.aurora.monzim.com/) documentation for more details.

In short it is a **_combination of principles from various design patterns and architectural styles such as provider pattern, model view preenter, modular architecture, and widget composition_**

You can use [mason](https://pub.dev/packages/mason) to get started with _aurora_. Just install and run `mason make aurora` to generate the starting template. Add new page with `mason make a_page <feature_name>`. By default it will generate the page with the aurora architecture. It is heavily dependent on Code Generation.

# Screenshots

| Screenshot 1                                                                                                            | Screenshot 2                                                                                                            | Screenshot 3                                                                                                            |
| ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| ![Screenshot 1](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.38.41.png)  | ![Screenshot 2](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.39.08.png)  | ![Screenshot 3](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.39.14.png)  |
| ![Screenshot 4](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.39.18.png)  | ![Screenshot 5](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.39.22.png)  | ![Screenshot 6](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.39.30.png)  |
| ![Screenshot 7](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.39.35.png)  |                                                                                                                         | ![Screenshot 9](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.40.33.png)  |
| ![Screenshot 10](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.40.49.png) | ![Screenshot 11](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.40.53.png) | ![Screenshot 12](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.41.12.png) |
| ![Screenshot 13](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.41.17.png) | ![Screenshot 14](docs/images/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-21%20at%2023.41.36.png) |                                                                                                                         |

## Project Structure

```tree
├── main.dart
├── services
│   ├── app_preference
│   │   ├── << more >>
│   ├── local_storage
│   │   └── isar
│   │       ├── << more >>
│   ├── localization
│   │   ├── << more >>
│   ├── riverpod
│   │   ├── << more >>
│   │   └── riverpod.dart
│   ├── routers
│   │   ├── app_router.dart
│   │   ├── router_provider.dart
│   └── themes
│       ├── << more >>
└── src
    ├── global
    │   ├── constant
    │   │   └── api.dart
    │   ├── extention
    │   │   └── extention.dart
    │   ├── global.dart
    │   └── package
    │       └── packages.dart
    ├── pages
    │   ├── details
    │   │   └── details_page.dart
    │   ├── error
    │   │   << more >>
    │   ├── home
    │   │   ├── home_page.dart
    │   │   ├── providers
    │   │   │   ├── home_provider.dart
    │   │   ├── sections
    │   │   │   ├── documentation_section.dart
    │   │   │   ├── result_section.dart
    │   │   │   └── searchbar_section.dart
    │   │   └── widgets
    │   │       ├── my_image_w.dart
    │   │       ├── repo_card_w.dart
    │   │       ├── shimmer_card_w.dart
    │   │       └── sort_button_w.dart
    │   ├── settings
    │   │   ├── providers
    │   │   │   ├── settings_provider.dart
    │   │   ├── sections
    │   │   │   ├── app_color_section.dart
    │   │   │   ├── font_section.dart
    │   │   │   └── language_section.dart
    │   │   ├── settings_page.dart
    │   │   └── widgets
    │   │       └── theme_toggle_widget.dart
    │   └── splash
    │       └── splash_scree.dart
    └── services
        ├── README.md
        ├── api
        │   ├── base
        │   │   └── api_base.dart
        │   ├── helper
        │   │   └── api_service.dart
        │   ├── model
        │   │   ├── api_response.dart
        │   │   ├── api_response.freezed.dart
        │   └── provider
        │       ├── api_service_provider.dart
        ├── cache
        │   ├── cache_model.dart
        │   ├── cache_provider.dart
        └── git_search
            ├── base
            │   └── stripe_base.dart
            ├── helper
            │   ├── github_search_helper.dart
            ├── model
            │   ├── enum.dart
            │   ├── github_repository.dart
            │   ├── github_repository.freezed.dart
            │   ├── license.dart
            │   ├── license.freezed.dart
            │   ├── repository_owner.dart
            │   ├── repository_owner.freezed.dart
            └── provider
                ├── repository_search_provider.dart

56 directories, 88 files
```
