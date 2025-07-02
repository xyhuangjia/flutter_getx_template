# Flutter GetX Template (GetX, Dio, MVVM)

This Flutter Template using [GetX](https://pub.dev/packages/get) package for State management, routing and Dependency Injection (bindings). We are using [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) (Model View ViewModel) architectural pattern here. For network call we are using [Dio](https://pub.dev/packages/dio) package. We followed the recommended folder structure of GetX and used [Get CLI](https://pub.dev/packages/get_cli) command line tool for creating the folder structure.

# Architecture of this project: MVVM

MVVM (Model View ViewModel) is one of the most popular architectural pattern for Android App development. Basically
this pattern separates User interface from business-logic and data-logic. So that it's divided into three layers: Model layer, 
View layer and View model layer. Let's explore it more deeply.

![mvvm](https://user-images.githubusercontent.com/3769029/137336079-1f3384d0-b9d6-4462-a2c4-4a3d2cc77e8a.png)

<b>ViewModel:</b> At first let's talk about ViewModel. Actually view model is a controller where we 
implement our business logics. It receives the data from the model and process the data according to
business logic and pushed into the live data observers which is observing by view.

<b>View:</b> View is the collections of widgets like Text, Image, Dropdown etc. Which will be displayed
to the users. Even it controls the user input. When it needs any data it command the view model (In this project it's controller)
for data and observe the response. Till then it may display a loader to the user.

<b>Model:</b> Model is basically backend logic. It controls the data source.

# To configure and run this project [check here](readme_configuration_guideline.md) 
You will find at above link step by step instructions with screenshots.

# run this project by command line
Dev: `flutter run --flavor dev lib/main_dev.dart`

Prod: `flutter run --flavor prod lib/main_prod.dart`

# How to update app information and continue development for your own project?

1. Rename root folder name
2. Update project name and description from pubspec.yaml. 
3. Update app launcher name and icon. [Reference](https://medium.com/@vaibhavi.rana99/change-application-name-and-icon-in-flutter-bebbec297c57)
4. Update your app's package name by [running this command](https://pub.dev/packages/change_app_package_name):

`flutter pub run change_app_package_name:main your_package_name`

# How was this project developed?
- Run [get cli](https://pub.dev/packages/get_cli) command to create project in the required directory: `get create project`
- Create `main_view` by running this command: `get create page:main` and so on...

# 上述文档中文翻译

# Flutter GetX 模板（GetX、Dio、MVVM）

本 Flutter 模板使用 [GetX](https://pub.dev/packages/get) 包进行状态管理、路由和依赖注入（bindings）。我们在此采用了 [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)（模型-视图-视图模型）架构模式。网络请求使用 [Dio](https://pub.dev/packages/dio) 包。我们遵循了 GetX 推荐的文件夹结构，并使用 [Get CLI](https://pub.dev/packages/get_cli) 命令行工具创建了项目结构。

# 本项目架构：MVVM

MVVM（模型-视图-视图模型）是 Android 应用开发中最流行的架构模式之一。该模式将用户界面与业务逻辑和数据逻辑分离，分为三层：模型层、视图层和视图模型层。让我们更深入地了解一下。

![mvvm](https://user-images.githubusercontent.com/3769029/137336079-1f3384d0-b9d6-4462-a2c4-4a3d2cc77e8a.png)

<b>视图模型（ViewModel）：</b> 首先来说视图模型。实际上，视图模型就是控制器，我们在其中实现业务逻辑。它从模型层接收数据，根据业务逻辑处理数据，并推送到被视图观察的 LiveData 观察者中。

<b>视图（View）：</b> 视图是各种小部件（如 Text、Image、Dropdown 等）的集合，展示给用户。它还负责用户输入的控制。当需要数据时，会向视图模型（本项目中即 controller）请求数据并监听响应。在此期间可以向用户展示加载动画。

<b>模型（Model）：</b> 模型主要是后端逻辑，负责数据源的管理。

# 如何配置和运行本项目 [点击这里](readme_configuration_guideline.md)
你可以在上述链接中找到带有截图的逐步操作说明。

# 命令行运行本项目
开发环境：`flutter run --flavor dev lib/main_dev.dart`

生产环境：`flutter run --flavor prod lib/main_prod.dart`

# 如何更新应用信息并继续开发属于你自己的项目？

1. 重命名根目录文件夹名称
2. 在 pubspec.yaml 中更新项目名称和描述
3. 更新应用启动名称和图标。[参考](https://medium.com/@vaibhavi.rana99/change-application-name-and-icon-in-flutter-bebbec297c57)
4. 通过[运行此命令](https://pub.dev/packages/change_app_package_name)更新应用包名：

`flutter pub run change_app_package_name:main your_package_name`

# 本项目是如何开发的？
- 运行 [get cli](https://pub.dev/packages/get_cli) 命令在指定目录创建项目：`get create project`
- 通过命令创建 `main_view`：`get create page:main`，以此类推...
