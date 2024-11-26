# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appqt_communicator_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appqt_communicator_autogen.dir/ParseCache.txt"
  "appqt_communicator_autogen"
  )
endif()
