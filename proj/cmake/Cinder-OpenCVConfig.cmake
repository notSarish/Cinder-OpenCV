if(NOT TARGET Cinder-OpenCV)
    # Define ${Cinder-Notifications_PROJECT_ROOT}. ${CMAKE_CURRENT_LIST_DIR} is just the current directory.
    get_filename_component(Cinder-OpenCV_PROJECT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)

    # Define ${CINDER_PATH} as usual.
    get_filename_component(CINDER_PATH "${Cinder-OpenCV_PROJECT_ROOT}/../.." ABSOLUTE)

    # Make a list of source files and define that to be ${SOURCE_LIST}.
    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS
            "${Cinder-OpenCV_PROJECT_ROOT}/src/rph/OpenCVManager.cpp"
            "${Cinder-OpenCV_PROJECT_ROOT}/src/rph/OpenCV.cpp"
            )

    # Create the library!
    add_library(cv-core STATIC IMPORTED)
    set_property(TARGET cv-core PROPERTY IMPORTED_LOCATION "${Cinder-OpenCV3_PROJECT_ROOT}/lib/macosx/libopencv_core.a")


    file(WRITE dummy.cc "")
    add_library(Cinder-OpenCV dummy.cc)
    target_link_libraries(Cinder-OpenCV cv-core)

    # Translate <includePath> tag.
    target_include_directories(Cinder-OpenCV INTERFACE
            "${Cinder-OpenCV_PROJECT_ROOT}/include"
            "${Cinder-OpenCV_PROJECT_ROOT}/include/opencv2"
            )

    target_include_directories(Cinder-OpenCV SYSTEM BEFORE INTERFACE "${CINDER_PATH}/include" )
endif()

#    # Add include directories.
#    # Notice that `cinderblock.xml` has `<includePath>src</includePath>`.
#    # So you need to set `../../src/` to include.
#    target_include_directories(Cinder-OpenCV PUBLIC "${Cinder-OpenCV_PROJECT_ROOT}/src" )
#    target_include_directories(Cinder-OpenCV SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )
#
#
#    # If your Cinder block has no source code but instead pre-build libraries,
#    # you can specify all of them here (uncomment the below line and adjust to your needs).
#    # Make sure to use the libraries for the right platform.
#    # # target_link_libraries(Cinder-Notifications "${Cinder-OpenCV_PROJECT_ROOT}/lib/libopencv_core.a")
#
#    if(NOT TARGET cinder)
#        include("${CINDER_PATH}/proj/cmake/configure.cmake")
#        find_package(cinder REQUIRED PATHS
#                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
#                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
#    endif()
#    target_link_libraries(Cinder-OpenCV PRIVATE cinder)
#
#endif()

#file(GLOB SOURCE_LIST CONFIGURE_DEPENDS
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/**/*.h"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/**/*.hpp"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/**/*.cc"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/**/*.cpp"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/**/*.c"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/*.h"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/*.hpp"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/*.cc"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/*.cpp"
#        "${Cinder-OpenCV_PROJECT_ROOT}/src/*.c")