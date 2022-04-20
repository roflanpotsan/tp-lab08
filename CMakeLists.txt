cmake_minimum_required(VERSION 3.20)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include("cmake/HunterGate.cmake")

HunterGate(
        URL "https://github.com/roflanpotsan/hunter/archive/v1.7.tar.gz"
        SHA1 "955ef1ee8dd5906faf4fc70388e2e7840c996037"
)

project(test_project)

hunter_add_package(factorial)
find_package(factorial)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} factorial)

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)
