# RepoRader iOS Project

[![Platform](https://img.shields.io/badge/platform-iOS-blue)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/swift-5.9-orange.svg)](https://swift.org/)
[![SwiftUI](https://img.shields.io/badge/swiftui-3.0-brightgreen.svg)](https://developer.apple.com/documentation/swiftui)
[![Kingfisher](https://img.shields.io/badge/Kingfisher-latest-blue)](https://github.com/onevcat/Kingfisher)
[![Alamofire](https://img.shields.io/badge/Alamofire-latest-blue)](https://github.com/onevcat/Alamofire)


Welcome to the RepoRader iOS project repository! This README provides an overview of the project structure, architecture, dependencies, common components and other important information.

## Table of Contents

- [Project Overview](#project-overview)
- [Project Folder Structure](#project-folder-structure)
- [Architecture](#architecture)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Common Components](#common-components)

## Project Overview

Welcome to the RepoRader iOS project repository! RepoRader is application for view repositories on Github.
## Project Folder Structure

The project follows a structured organization to ensure maintainability and scalability. Below is an overview of the main folders in the project:

- `RepoRader` (Root Directory)
  - `Modules`: Contains individual modules, each in a separate subfolder, following the MVVM pattern.
    - `Repositories`: Contains the Repositories features.
    - ... (Other modules)
  - `AppFiles`: Contains essential app files such as localizables, app delegates, fonts, and animations.
  - `Catalog`: Contains color and asset files.
  - `Extensions`: Houses custom extensions.
  - `Utils`: Holds main utility components.
    - `Enums`: Shared enumeration types.
    - `Views`: Reusable SwiftUI views.
    - `Constants`: Shared constants.
  - `Networking`: Contains the main network layer and its dependencies.
  
The modular structure promotes code organization and separation of concerns, enabling developers to work efficiently on different parts of the app.

## Architecture

The project follows a modular MVVM (Model-ViewModel-View) pattern-based architecture, with each module containing its own domain, data, and view layers. The key components of the architecture include:

- **Domain Layer**: Contains the business logic and data models specific to the module.
- **Data Layer**: Handles data retrieval, storage, and manipulation. It includes repository protocols and their implementations.
- **Use Case Layer**: Defines use case protocols and their implementations. Use cases encapsulate the application's business logic and interact with the data layer.
- **View Layer**: Implemented using SwiftUI, responsible for UI presentation and user interactions.
- **ViewModel**: Facilitates communication and data formatting between use cases and the view layer.

This modular architecture promotes separation of concerns, code reusability, and maintainability throughout the app.


## Dependencies

RepoRader utilizes the following Swift Package Manager (SPM) packages:

- [Kingfisher](https://github.com/onevcat/Kingfisher.git)
- [SwiftUIPullToRefresh](https://github.com/globulus/swiftui-pull-to-refresh)
- [Alamofire](https://github.com/Alamofire)

For easy installation, ensure you have SPM integrated into your Xcode project.

## Installation

To get started with RepoRader on your local machine, follow these steps:

1. Clone the repository: `git clone https://github.com/ammarelriyali/RepoRadar`
2. Open `RepoRader.xcodeproj` in Xcode.
3. Build and run the app on your simulator or device.

## Common Components

We have developed numerous common components that can be found in the `//RepoRader/RepoRader/Utils/Views` directory, including:

- `ResultView`
- `ImageView`
- `ImageWithTextView`
  
These components are designed to streamline UI development, enhance consistency, and improve code maintainability.
