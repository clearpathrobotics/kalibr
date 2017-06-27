cmake_minimum_required(VERSION 2.8.3)
project(aslam_splines)

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

find_package(catkin_simple REQUIRED)
catkin_simple()

find_package(Boost REQUIRED COMPONENTS system )


cs_add_library(${PROJECT_NAME}
  src/BSplinePoseDesignVariable.cpp
  src/BSplineExpressions.cpp
  src/EuclideanBSplineDesignVariable.cpp
)

target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES})

catkin_add_gtest(${PROJECT_NAME}_test
  test/test_main.cpp
  test/TestBSplineExpressions.cpp
  test/TestErrors.cpp
#  test/TestOPTBSpline.cpp
  )

find_package(Cholmod REQUIRED)
include_directories(${CHOLMOD_INCLUDE_DIR})

target_link_libraries(${PROJECT_NAME}_test ${PROJECT_NAME})

cs_install()
cs_export()
