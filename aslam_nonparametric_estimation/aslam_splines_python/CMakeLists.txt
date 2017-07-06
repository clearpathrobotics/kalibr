cmake_minimum_required(VERSION 2.8.3)
project(aslam_splines_python)

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

find_package(catkin_simple REQUIRED)
catkin_simple()

find_package(OpenCV REQUIRED)

find_package(Cholmod REQUIRED)
include_directories(${CHOLMOD_INCLUDE_DIR})

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)

add_python_export_library(${PROJECT_NAME} python/aslam_splines
  src/spline_module.cpp
  src/BSplineMotionError.cpp
  src/SimpleSplineError.cpp
)

cs_install()
cs_export()
