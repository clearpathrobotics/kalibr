cmake_minimum_required(VERSION 2.8.3)
project(sparse_block_matrix)

# This helps find the TBB library
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/../cmake")
LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

find_package(catkin_simple REQUIRED)
catkin_simple()

find_package(Cholmod REQUIRED)
include_directories(${CHOLMOD_INCLUDE_DIR})

find_package(Eigen3)
include_directories(${Eigen_INCLUDE_DIRS})

cs_add_library(${PROJECT_NAME}
  src/matrix_structure.cpp
  src/sparse_helper.cpp
  src/marginal_covariance_cholesky.cpp
)

# Avoid clash with tr1::tuple: https://code.google.com/p/googletest/source/browse/trunk/README?r=589#257
add_definitions(-DGTEST_USE_OWN_TR1_TUPLE=0)

catkin_add_gtest( ${PROJECT_NAME}_tests
  test/test_main.cpp
  test/solver_tests.cpp
  test/sparse_block_matrix_tests.cpp
)

target_link_libraries(${PROJECT_NAME}_tests ${PROJECT_NAME} ${TBB_LIBRARIES})

cs_install()
cs_export()


