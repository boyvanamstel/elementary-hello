# Elementary Hello
project (com.github.boyvanamstel.elementary-hello)

# the oldest stable cmake version we support
cmake_minimum_required (VERSION 2.6)

# tell cmake where its modules can be found in our project directory
list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/src)

# where we install data directory (if we have any)
    set (DATADIR "${CMAKE_INSTALL_PREFIX}/share")

# what to call that directory where we install data too
    set (PKGDATADIR "${DATADIR}/com.github.boyvanamstel.elementary-hello.hello-again")

    set (EXEC_NAME "com.github.boyvanamstel.elementary-hello.hello-again")
    set (RELEASE_NAME "A hello world.")
    set (VERSION "0.1")
    set (VERSION_INFO "What's up world?")

# we're about to use pkgconfig to make sure dependencies are installed so let's find pkgconfig first
find_package(PkgConfig)

# now let's actually check for the required dependencies
pkg_check_modules(DEPS REQUIRED gtk+-3.0)

add_definitions(${DEPS_CFLAGS})
link_libraries(${DEPS_LIBRARIES})
link_directories(${DEPS_LIBRARY_DIRS})

# make sure we have vala
find_package(Vala REQUIRED)
# make sure we use vala
include(ValaVersion)
# make sure it's the desired version of vala
    ensure_vala_version("0.16" MINIMUM)

# files we want to compile
include(ValaPrecompile)
    vala_precompile(VALA_C ${EXEC_NAME}
            src/hello-again.vala

# tell what libraries to use when compiling
            PACKAGES
            gtk+-3.0
            )

# tell cmake what to call the executable we just made
add_executable(${EXEC_NAME} ${VALA_C})

# install the binaries we just made
install (TARGETS ${EXEC_NAME} RUNTIME DESTINATION bin)

# install our .desktop file so the Applications menu will see it
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/com.github.boyvanamstel.elementary-hello.hello-again.desktop DESTINATION ${DATADIR}/applications/)

# install our .appdata.xml file so AppCenter will see it
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/com.github.boyvanamstel.elementary-hello.hello-again.appdata.xml DESTINATION ${DATADIR}/metainfo/)
