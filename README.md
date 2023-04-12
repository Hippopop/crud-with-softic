# CRUD-With_SOFTIC

This is a flutter applicaton demonstrating `CRUD` operation, with a database and `hive` as local storage. </br>
<i>PS: Didn't had enough time to put into it bcz of my daily job and ramadan. Spent around 6 hours on it.</i></br>

## Features

1. Persistent `login` system.
2. Auth `token` system.
3. User `profile` data fetching.
4. User `product` data fetching.
5. User `product` data pagination.
6. Proper `Theme` integration.
7. Multi language support.

## Goals

This project was made with a hybrid system of `bloc` and `Clean` architecture. My initial intention was to try Uncle Bob's `Clean Architecture` for the veryfirst time. But I ended up shifting the `useCases` inside `repository`. And structured them based on features. Which is a style from `bloc Architecture`.</br>
<i>For this project it should work just fine. But it's not tested for larger projects. It's just an experiment.</i>
</br>

## Folder Structure

```folder
./lib

|   main.dart
|
+---global
|   +---widgets
|           bottom_sheet.dart
|           loading_indicator.dart
|           pop_ups.dart
|           toast.dart
|
+---src
    +---constants
    |       app_constants.dart
    |       assets.dart
    |
    +---features
    |   +---authentication
    |   |   +---controller
    |   |   |       auth_controller.dart
    |   |   |
    |   |   +---repository
    |   |   |   +---database
    |   |   |   |       auth_repository.dart
    |   |   |   |
    |   |   |   +---local
    |   |   |   |       local_auth_repository.dart
    |   |   |   |
    |   |   |   +---models
    |   |   |       +---login_request
    |   |   |       |       login_request.dart
    |   |   |       |       login_request.g.dart
    |   |   |       |
    |   |   |       +---user_profile
    |   |   |               user_profile.dart
    |   |   |
    |   |   +---view
    |   |           login_screen.dart
    |   |
    |   +---home
    |       +---controller
    |       |       product_controller.dart
    |       |
    |       +---repository
    |       |   +---database
    |       |   |       product_repository.dart
    |       |   |
    |       |   +---local
    |       |   |       local_product_repository.dart
    |       |   |
    |       |   +---models
    |       |       +---product_data
    |       |               product_data_model.dart
    |       |
    |       +---view
    |           |   home_screen.dart
    |           |   product_page.dart
    |           |   profile_page.dart
    |           |
    |           +---widgets
    |                   navbar.dart
    |                   single_product_card.dart
    |
    +---helpers
    |       connectivity_check.dart
    |       getit_locator.dart
    |
    +---services
        +---domain
        |   +---database
        |   |       api_repository.dart
        |   |       request_handler.dart
        |   |
        |   +---localstorage
        |           hive_config.dart
        |
        +---localization
        |       choose_language_screen.dart
        |       language_controller.dart
        |       language_model.dart
        |       localization_controller.dart
        |       translate.dart
        |       translator_helper.dart
        |
        +---settings
        |       main_settings.dart
        |
        +---theme
            |   dark_theme.dart
            |   light_theme.dart
            |   theme_controller.dart
            |
            +---extensions
                    color_theme.dart
```

**Some of the things are still out of place. An unfinished! Hoping to finish them as soon as i get some free time.**
@Mostafij.
