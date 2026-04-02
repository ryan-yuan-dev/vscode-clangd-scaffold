cmake_minimum_required(VERSION 3.22.0)
project(clangd-demo VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# 根据当前 Preset，配置 .clangd 文件
if(ANDROID)
    message(STATUS "Detected Android Platform, syncing .clangd...")
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy 
                    ${CMAKE_SOURCE_DIR}/.clangd.android 
                    ${CMAKE_SOURCE_DIR}/.clangd) 
elseif(APPLE)
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy 
                    ${CMAKE_SOURCE_DIR}/.clangd.macos 
                    ${CMAKE_SOURCE_DIR}/.clangd)
    message(STATUS "Detected Apple Platform, syncing .clangd...")
endif()

add_executable(clangd-demo main.cpp)

