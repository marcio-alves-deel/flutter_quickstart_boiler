# Flutter Quickstart Boilerplate

Thinking about the initial boring job of creating the entire structure of an application in flutter, I created this boilerplate to help this initial work with some basic implementations and a well-defined architecture.
I hope this project is useful for you!

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/marciowelben/flutter_quickstart_boiler/Flutter)](https://github.com/marciowelben/flutter_quickstart_boiler/actions) [![Downloads](https://img.shields.io/github/downloads/marciowelben/flutter_quickstart_boiler/total)](https://github.com/marciowelben/flutter_quickstart_boiler/releases)   [![GitHub issues](https://img.shields.io/github/issues-raw/marciowelben/flutter_quickstart_boiler)](https://github.com/marciowelben/flutter_quickstart_boiler/issues)

## Table of Contents

- [Flutter Quickstart Boilerplate](#flutter-quickstart-boilerplate)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Clone](#clone)
    - [Setup](#setup)
    - [Run](#run)
  - [Features](#features)
    - [Internationalization](#internationalization)
      - [Suppoting a new location](#suppoting-a-new-location)
    - [Global Configuration](#global-configuration)
  - [Organization](#organization)
    - [Folders](#folders)
      - [Features](#features-1)
      - [Data](#data)
      - [Domain](#domain)
      - [Ui](#ui)
  - [Tests](#tests)
  - [Team](#team)
  - [License](#license)


## Installation

In order to use this boiler, you will need to download or clone the repository and configure with your informations.

### Clone
Download or clone the [Repository](https://github.com/marciowelben/flutter_quickstart_boiler.git) on your PC.

### Setup
Inside your project directory install the dart packages running. <br>
``` shell
$ flutter pub get
```

Setup your configurations on `/lib/core/constants` and run your application.

### Run

```shell
$ flutter run
```

## Features

### Internationalization

You can use a default configuration for internationalization support on the app.
All the files with the strings should be created under `lib/core/intl/messages`.

#### Suppoting a new location

**New locations**

In order to add new languages to the application, you need to open `lib/core/intl/intl_delegate.dart` and add the new language with the current ones for example, if you want to add support for Franch, you will change to.

```dart
@override
  bool isSupported(Locale locale) =>
      ['pt', 'en', 'fr'].toList().contains(locale.languageCode);
```

You will do the same proccess on `main.dart`

```dart
 supportedLocales: [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
        Locale('fr'),
      ],
```

Go to `lib/core/intl/messages` and add the file for your new language, continue with the example of French, we should create a file called `intl_fr.arb`. There you will write your translations.

When finished the process you will need to generate the files correspondent to your language. 

```shell
$ flutter pub pub run intl_translation:generate_from_arb lib/core/intl/intl_config.dart lib/core/intl/messages/intl_fr.arb  --output-dir=lib/core/intl/generated
```

**New Strings**

To create new strings for translations, you will first need to add the new values on `intl_config.dart`. 

```dart
String get newString => Intl.message('', name: 'newString');
```

You can add this line at the bottom of the class.<br>
You will need to update you current .arb files with the new key.

The last process is to re-generate the message files.


```shell
$ flutter pub pub run intl_translation:generate_from_arb lib/core/intl/intl_config.dart lib/core/intl/messages/*.arb  --output-dir=lib/core/intl/generated
```

### Global Configuration

To set a bunch of basic configurations you need to find `lib/core/constants/envs` there you can create the files for each environment, e.g.: dev, test, prod, demo.

You can add your keys for the environments (All environments must have same keys).

For each key you add you will need to update `config.dart`

```dart
 AppConfig.fromJson(Map<String, dynamic> json)
      : apiBaseUrl = json['apiBaseUrl'],
        newKey = json['newKey'];
```

## Organization

This project organize itself into features, each feature will have his own layers (Domain, Data and Ui), this abstraction will help to maintain and scale the application. This implementation is based on [Reso Coder](https://resocoder.com) clean architecture.

### Folders

```
lib/
|- core/
|- features/
|- main.dart
|- data.dart
|- domain.dart
|- ui.dart
|- core.dart
```

Core will handle the implementation for common features, for example, errors, contants, configurations, etc..

We have the 1 file for each layer and 1 file for core.
Those files will help us to share classes inside the application. For example: `core.dart` will have export all classes under core folder and group it as a package.

Going deeper inside `features/` we will have:

#### Features

```
feature/
|- data/
|- domain/
|- ui/
|- domain.dart
|- ui.dart
|- data.dart
```

As explained before, we have the same 3 files to export our layers.

#### Data
Our data layer will handle datasources, for example local storage as sharedpreferences, or remote sources like cloud storage, databases and etc, or even both.

```
data/
|- datasources/
|- models/
|- repositories/
```

#### Domain
Domain layer will be responsible for connecting the data source and ui trough usecases and models.

```
domain/
|- entities/
|- repositories/
|- usecases/
```

#### Ui
The ui will handle the entire visible part of the app. The one that the user will see, it will also comunicates with domain layer.

```
ui/
|- layouts/
|- pages/
|- widgets/
```

## Tests


## Team

|                                                                                                                                                                              <a href="http://linkedin.com/in/marcio-montenegro" target="_blank">**Marcio Montenegro**</a>                                                                                                                                                                               |
| :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|                                                                                                                                                                     [![Marcio Montenegro](https://avatars3.githubusercontent.com/u/31051083?s=140)](http://github.com/marciowelben)                                                                                                                                                                     |
| <a href="https://github.com/marciowelben"><img src="https://image.flaticon.com/icons/png/512/25/25231.png" data-canonical-src="https://image.flaticon.com/icons/png/512/25/25231.png" width="30" /></a> <a href="https://linkedin.com/in/marcio-montenegro"><img src="https://clipartart.com/images/free-clipart-of-linkedin-symbols-1.png" data-canonical-src="https://clipartart.com/images/free-clipart-of-linkedin-symbols-1.png" width="30" /></a> |

---

## License

[![license](https://img.shields.io/github/license/marciowelben/frontend_projects.svg)](/license)

- [MIT](/license) 
- &copy; Marcio Montenegro