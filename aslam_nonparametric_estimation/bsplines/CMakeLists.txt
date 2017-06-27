cmake_minimum_required(VERSION 2.8.3)
project(bsplines)

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

find_package(catkin_simple REQUIRED)

catkin_simple()

find_package(Cholmod REQUIRED)
include_directories(${CHOLMOD_INCLUDE_DIR})

cs_add_library(${PROJECT_NAME}
  src/BSpline.cpp
  src/BSplinePose.cpp
)


cs_install()
cs_export()
