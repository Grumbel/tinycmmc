# Old file for backward compatibility only, see
# tinycmmc/ExportAndInstallLibrary.cmake for the new versions

install(TARGETS "${PROJECT_NAME}"
  EXPORT "${PROJECT_NAME}"
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}")

add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

string(TOLOWER "${PROJECT_NAME}" PROJECT_NAME_LOWERCASE)

include(CMakePackageConfigHelpers)
configure_package_config_file("${PROJECT_NAME_LOWERCASE}-config.cmake.in" "${PROJECT_NAME_LOWERCASE}-config.cmake"
  INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/${PROJECT_NAME}")
write_basic_package_version_file("${PROJECT_NAME_LOWERCASE}-config-version.cmake"
  VERSION "${PROJECT_VERSION}"
  COMPATIBILITY SameMinorVersion)
export(EXPORT "${PROJECT_NAME}"
  NAMESPACE "${PROJECT_NAME}::"
  FILE "${PROJECT_NAME_LOWERCASE}-targets.cmake")
install(EXPORT "${PROJECT_NAME}"
  FILE "${PROJECT_NAME_LOWERCASE}-targets.cmake"
  NAMESPACE "${PROJECT_NAME}::"
  DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
install(FILES
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_LOWERCASE}-config-version.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_LOWERCASE}-config.cmake"
  DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")

# EOF #
