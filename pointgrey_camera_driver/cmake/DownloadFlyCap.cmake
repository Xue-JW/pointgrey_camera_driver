function(download_flycap POINTGREY_LIB_VAR POINTGREY_INCLUDE_DIR_VAR)
  if(NOT UNIX)
    message(FATAL_ERROR "Downloading libflycapture for non-linux systems not supported")
  endif()

  include(cmake/TargetArch.cmake)
  target_architecture(POINTGREY_ARCH)
  execute_process(
    COMMAND lsb_release -cs
    OUTPUT_VARIABLE OS_CODE_NAME
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  # string(STRIP "${OS_CODE_NAME}" OS_CODE_NAME)

  set(POINTGREY_LIB "${CATKIN_DEVEL_PREFIX}/${CATKIN_PACKAGE_LIB_DESTINATION}/libflycapture.so.2")
  set(DOWNLOAD_SCRIPT "${PROJECT_SOURCE_DIR}/cmake/download_flycap")
  set(POINTGREY_DRIVE "${PROJECT_SOURCE_DIR}/cmake/flycapture.2.13.3.31_arm64_xenial.tar.gz")

  execute_process(
    COMMAND /usr/bin/env python ${DOWNLOAD_SCRIPT} ${POINTGREY_ARCH} ${POINTGREY_LIB} ${OS_CODE_NAME} ${POINTGREY_DRIVE}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

  set(${POINTGREY_LIB_VAR} ${POINTGREY_LIB} PARENT_SCOPE)
  set(${POINTGREY_INCLUDE_DIR_VAR} "${CMAKE_CURRENT_BINARY_DIR}/usr/include" PARENT_SCOPE)
endfunction()
