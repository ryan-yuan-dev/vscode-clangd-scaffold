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

```
.
├── main.cpp              # 主程序入口
├── CMakeLists.txt        # CMake 构建配置
├── CMakePresets.json     # CMake 预设配置
├── compile_commands.json # 编译命令数据库（用于 clangd 自动生成）
├── .vscode               # VSCode 配置文件，配置了 cmake 和 clangd
├── .clangd               # clangd 配置文件
├── .clang-format         # 代码格式化配置
├── .gitattributes        # Git 换行符配置
├── .sub-projects        # 子项目
├── include/              # 头文件目录
│   └── clangd-demo/      # 项目头文件命名空间目录
├── src/                  # 源代码目录
└── out/                  # 构建输出目录
```

## 环境要求

- VSCode
- VSCode clangd、CMake Tools 扩展
- C++17 兼容的编译器
- CMake 3.22.0 或更高版本
- clangd（用于 IDE 语言支持）

## 使用
  1. clone 本项目本地
  2. 在 VSCode 中打开项目目录
  3. 在 sub-projects 目录下，添加子项目，进行编译；

## 许可证

MIT
