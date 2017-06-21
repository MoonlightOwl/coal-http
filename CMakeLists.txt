cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(coal-http VERSION 0.1 LANGUAGES C)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/target)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake-modules" ${CMAKE_SOURCE_PATH})
set(CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE sources src/*.c)

set(TARGET coal-http)
add_executable(${TARGET} "${sources}")
set_property(TARGET ${TARGET} PROPERTY C_STANDART 11)
target_include_directories(${TARGET} PUBLIC src/)
target_compile_options(${TARGET} PUBLIC -O2 -Wall -Wextra -pedantic)

include(CheckEpoll)
check_epoll(HAS_EPOLL)
if(NOT HAS_EPOLL)
  message(FATAL_ERROR "No epoll support")
endif(NOT HAS_EPOLL)

