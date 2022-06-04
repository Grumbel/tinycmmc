# tinycmmc - Tiny CMake module collection
# Copyright (C) 2021 Ingo Ruhnke <grumbel@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

cmake_minimum_required(VERSION 3.0)
project(tinycmmc VERSION 0.1.0)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

set(TINYCMMC_MODULE_INSTALL_DIR "${CMAKE_INSTALL_FULL_DATADIR}/${PROJECT_NAME}/cmake/modules/")
set(TINYCMMC_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_FULL_LIBDIR}/cmake/${PROJECT_NAME}/")

install(DIRECTORY modules/
  DESTINATION ${TINYCMMC_MODULE_INSTALL_DIR})

configure_package_config_file(
  tinycmmcConfig.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/tinycmmcConfig.cmake
  INSTALL_DESTINATION ${TINYCMMC_CONFIG_INSTALL_DIR}
  PATH_VARS TINYCMMC_MODULE_INSTALL_DIR
)

write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/tinycmmcConfigVersion.cmake
  VERSION "${PROJECT_VERSION}"
  COMPATIBILITY AnyNewerVersion
)

install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/tinycmmcConfig.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/tinycmmcConfigVersion.cmake
  DESTINATION ${TINYCMMC_CONFIG_INSTALL_DIR}
)

# EOF #
