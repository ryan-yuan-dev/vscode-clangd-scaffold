cmake_minimum_required(VERSION 3.22.0)
project(clangd-demo VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(clangd-demo main.cpp)

# 根据当前 Preset，配置 .clangd 文件
if(ANDROID)
    message(STATUS "Detected Android Platform, syncing .clangd...")
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy 
                    ${CMAKE_SOURCE_DIR}/.clangd.android 
                    ${CMAKE_SOURCE_DIR}/.clangd) 
elseif(MACOS)
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy 
                    ${CMAKE_SOURCE_DIR}/.clangd.macos 
                    ${CMAKE_SOURCE_DIR}/.clangd)
    message(STATUS "Detected Apple Platform, syncing .clangd...")
elseif(IOS) 
    message(STATUS "Detected iOS Platform, syncing .clangd...")
    # 读取 IOS_DEVELOPMENT_TEAM 环境变量
    if(DEFINED ENV{IOS_DEVELOPMENT_TEAM})
        # set(CMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM $ENV{IOS_DEVELOPMENT_TEAM})
        # set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_STYLE "Automatic")
        # set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "$ENV{XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY}")
        message(STATUS "IOS_DEVELOPMENT_TEAM: $ENV{IOS_DEVELOPMENT_TEAM}")
    else()
        execute_process(COMMAND sh "${CMAKE_SOURCE_DIR}/scripts/list-ios-development-teams.sh")
        message(ERROR "IOS_DEVELOPMENT_TEAM environment variable is not set. ")
    endif()
    # 假设你的 target 名字叫 a-lib-demo
    set_target_properties(clangd-demo PROPERTIES
        MACOSX_BUNDLE TRUE                              # 必须开启 Bundle 模式
        MACOSX_BUNDLE_GUI_IDENTIFIER "com.demo2.test2"    # 这就是 Bundle ID
        MACOSX_BUNDLE_BUNDLE_NAME "ClangdDemo"           # App 显示的名称
        MACOSX_BUNDLE_BUNDLE_VERSION "1.0.0"            # Build 版本号
        MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0"        # 营销版本号 (Version)
    )
endif()

add_subdirectory(sub-projects/a-lib-demo)

target_link_libraries(clangd-demo PRIVATE a-lib-demo)

