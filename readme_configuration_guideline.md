# How to configure and run this project?

**Step 1:** First of all click "Add/Edit Configurations" as like image 1:

<img align="center" alt="1" src="repo_data/flutter_getx_template_1.png" />

**Step 2:** Choose "Flutter" from configuration list and select your Dart entrypoint path according
to your flavor then give a name and allow dart support for this project. See on Image 2, 3 and 4:

![Select Flutter configuration option](repo_data/flutter_getx_template_2.png)

![Set 'dev' as build](https://user-images.githubusercontent.com/3769029/137329967-6a2421ce-98c7-4f42-9393-8817b2607678.png)

![Choose path to main_dev.dart](https://user-images.githubusercontent.com/3769029/137330462-303463b1-6b00-4755-9b96-a04d4546df4d.png)

**Step 3:** Create another configuration for prod following two steps above:

![Prod configuration](https://user-images.githubusercontent.com/3769029/137330499-ff822737-943a-493d-932e-09eb8afa9414.png)

N.B: In this step you may need to setup your dart sdk path. If you get warned for 
"dart sdk not found in specified location" then just click on "fix" and select your dart sdk path.

# How to configure and make android release build for production
Release build can be made using `flutter build <options> apk` command. Before that create a **key.properties** file in the **android** folder. Add folloiwng lines to that file:
```
keyAlias=<your keystore alias>
password=<your keystore password>
storeFile=<path to the keystore file>
```
Then run `flutter build appbundle -t lib/main_prod.dart --flavor prod` to generate app bundle (.aab) file. To generate .apk file, run `flutter build apk -t lib/main_prod.dart --flavor prod`.

For more details, please read through guide to build and relase android app documentation from [this link](https://docs.flutter.dev/deployment/android).

---

# 如何配置和运行此项目？

**步骤 1：** 首先点击“Add/Edit Configurations”，如图 1 所示：

<img align="center" alt="1" src="repo_data/flutter_getx_template_1.png" />

**步骤 2：** 在配置列表中选择“Flutter”，根据你的 flavor 选择 Dart 入口文件路径，然后命名并为项目启用 Dart 支持。参考下方图片 2、3、4：

![选择 Flutter 配置选项](repo_data/flutter_getx_template_2.png)

![设置 'dev' 为构建类型](https://user-images.githubusercontent.com/3769029/137329967-6a2421ce-98c7-4f42-9393-8817b2607678.png)

![选择 main_dev.dart 路径](https://user-images.githubusercontent.com/3769029/137330462-303463b1-6b00-4755-9b96-a04d4546df4d.png)

**步骤 3：** 按照上述两个步骤为 prod 创建另一个配置：

![Prod 配置](https://user-images.githubusercontent.com/3769029/137330499-ff822737-943a-493d-932e-09eb8afa9414.png)

注意：此步骤可能需要设置 Dart SDK 路径。如果出现“dart sdk not found in specified location”警告，请点击“fix”并选择你的 Dart SDK 路径。

# 如何为生产环境配置并生成 Android 发布包

可以使用 `flutter build <options> apk` 命令生成发布包。在此之前，请在 **android** 文件夹下创建 **key.properties** 文件，并添加如下内容：
```
keyAlias=<你的 keystore 别名>
password=<你的 keystore 密码>
storeFile=<keystore 文件路径>
```
然后运行 `flutter build appbundle -t lib/main_prod.dart --flavor prod` 生成 app bundle (.aab) 文件。若需生成 .apk 文件，运行 `flutter build apk -t lib/main_prod.dart --flavor prod`。

更多详情请参考 [官方文档](https://docs.flutter.dev/deployment/android)。