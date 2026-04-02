# clangd cpp 跨平台开发框架

一个可以使用 vacode, clangd, cmake 跨平台开发的 C++ 跨平台开发框架。

## 功能

- 跨平台开发 C/C++ 项目，支持 C++17 Android,iOS,MacOS,OHOS;
- 使用 clangd 语言服务器，提供智能提示、错误提示、格式化、代码补全、重构等功能；
- 集成 clang-tidy，提供静态分析功能；
- CMake 预配置，切换预配置项时，自动生成 `.clangd` 文件，用于 clangd 语言服务器；
- CMake 编译时，自动生成 `compile_commands.json` 文件，并复制到 `${workspaceFolder}`
   目录下，clangd 统一指向该文件。

## 项目结构

```tree
.
├── main.cpp              # 主程序入口
├── CMakeLists.txt        # CMake 构建配置
├── CMakePresets.json     # CMake 预设配置
├── compile_commands.json # 编译命令数据库（用于 clangd 自动生成）
├── .vscode               # VSCode 配置文件，配置了 cmake 和 clangd
├── .clangd               # clangd 配置文件
├── .clang-format         # 代码格式化配置
├── .gitattributes        # Git 换行符配置
├── scripts               # 脚本
├── .sub-projects         # 子项目
├── include/              # 头文件目录
│   └── clangd-demo/      # 项目头文件命名空间目录
├── src/                  # 源代码目录
└── out/                  # 构建输出目录
```

## 环境要求

- 软件与插件
  - VSCode
  - VSCode clangd、CMake Tools 扩展
  - C++17 兼容的编译器
  - CMake 3.22.0 或更高版本
  - clangd（用于 IDE 语言支持）
  
- 系统环境变量
  - IOS_DEVELOPMENT_TEAM ：设置 iOS 开发团队
  - ANDROID_NDK_HOME     ：设置 Android NDK 路径，/xx/xx/Android/sdk/ndk/27.0.12077973
  - /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin 加入到 PATH，
    让 clangd 自动找到 `clang-format`
  > D98A5BFD4E13BDD9D1C265C3104C045A9AFD5E07 "Apple Development: Peter Koprivc (V57D759G59)"
  
## 使用

  1. clone 本项目本地

     ```shell
     git clone --recurse-submodules https://github.com/ryan-yuan-dev/vscode-clangd-scaffold.git
     ```

  2. 在 VSCode 中打开项目目录
  3. 在 sub-projects 目录下，添加子项目，进行编译；

## 许可证

MIT
