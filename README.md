# CRUD-With_SOFTIC

This is a flutter applicaton demonstrating `CRUD` operation, with a database and `hive` as local storage. </br>
<i>PS: Didn't had enough time to put into it bcz of my daily job and ramadan. Spent around 6 hours on it.</i></br>

## Features

1. Persistent `login` system.
2. Auth `token` system.
3. User `profile` data fetching.
3. User `product` data fetching.
3. User `product` data pagination.
4. Proper `Theme` integration.
5. Multi language support.

## Goals

This project was made with a hybrid system of `bloc` and `Clean` architecture. My initial intention was to try Uncle Bob's `Clean Architecture` for the veryfirst time. But I ended up shifting the `useCases` inside `repository`. And structured them based on features. Which is a style from `bloc Architecture`.</br>
<i>For this project it should work just fine. But it's not tested for larger projects. It's just an experiment.</i>
</br>

## Folder Structure

```folder
./lib

ª   main.dart
ª
+---global
ª   +---widgets
ª           bottom_sheet.dart
ª           loading_indicator.dart
ª           pop_ups.dart
ª           toast.dart
ª
+---src
    +---constants
    ª       app_constants.dart
    ª       assets.dart
    ª
    +---features
    ª   +---authentication
    ª   ª   +---controller
    ª   ª   ª       auth_controller.dart
    ª   ª   ª
    ª   ª   +---repository
    ª   ª   ª   +---database
    ª   ª   ª   ª       auth_repository.dart
    ª   ª   ª   ª
    ª   ª   ª   +---local
    ª   ª   ª   ª       local_auth_repository.dart
    ª   ª   ª   ª
    ª   ª   ª   +---models
    ª   ª   ª       +---login_request
    ª   ª   ª       ª       login_request.dart
    ª   ª   ª       ª       login_request.g.dart
    ª   ª   ª       ª
    ª   ª   ª       +---user_profile
    ª   ª   ª               user_profile.dart
    ª   ª   ª
    ª   ª   +---view
    ª   ª           login_screen.dart
    ª   ª
    ª   +---home
    ª       +---controller
    ª       ª       product_controller.dart
    ª       ª
    ª       +---repository
    ª       ª   +---database
    ª       ª   ª       product_repository.dart
    ª       ª   ª
    ª       ª   +---local
    ª       ª   ª       local_product_repository.dart
    ª       ª   ª
    ª       ª   +---models
    ª       ª       +---product_data
    ª       ª               product_data_model.dart
    ª       ª
    ª       +---view
    ª           ª   home_screen.dart
    ª           ª   product_page.dart
    ª           ª   profile_page.dart
    ª           ª
    ª           +---widgets
    ª                   navbar.dart
    ª                   single_product_card.dart
    ª
    +---helpers
    ª       connectivity_check.dart
    ª       getit_locator.dart
    ª
    +---services
        +---domain
        ª   +---database
        ª   ª       api_repository.dart
        ª   ª       request_handler.dart
        ª   ª
        ª   +---localstorage
        ª           hive_config.dart
        ª
        +---localization
        ª       choose_language_screen.dart
        ª       language_controller.dart
        ª       language_model.dart
        ª       localization_controller.dart
        ª       translate.dart
        ª       translator_helper.dart
        ª
        +---settings
        ª       main_settings.dart
        ª
        +---theme
            ª   dark_theme.dart
            ª   light_theme.dart
            ª   theme_controller.dart
            ª
            +---extensions
                    color_theme.dart
```

**Some of the things are still out of place. An unfinished! Hoping to finish them as soon as i get some free time.**
@Mostafij.
