add_custom_target(autopilot)

option(ENABLE_AUTOPILOT "Enable or Disable autopilot tests" On)
option(AUTOPILOT_RECORD "Enable or Disable autopilot record tests" OFF)
option(AUTOPILOT_RECORD_PATH "Directory to put recorded tests" OFF)

if(ENABLE_AUTOPILOT)
    find_program(AUTOPILOT_BIN autopilot)
    if(AUTOPILOT_BIN)
        message(STATUS "Autopilot tests enabled.")
    else()
        message(STATUS "Autopilot tests disabled: autopilot binary not found")
    endif()
endif()

if(AUTOPILOT_RECORD OR AUTOPILOT_RECORD_PATH)
    find_program(AUTOPILOT_REC_BIN recordmydesktop)
    if(AUTOPILOT_REC_BIN)
        message(STATUS "Record autopilot enabled")
        if(AUTOPILOT_RECORD_PATH)
            message(STATUS "Save autopilot tests video in: ${AUTOPILOT_RECORD_PATH}")
            set(AUTOPILOT_TESTS_ARGS -r -rd ${AUTOPILOT_RECORD_PATH})
        else()
            set(AUTOPILOT_TESTS_ARGS -r)
        endif()
    else()
        message(STATUS "recordmydesktop necessary for record autopilot tests not found.")
        set(AUTOPILOT_TESTS_ARGS "")
    endif()
endif()

function(declare_autopilot_test ENVIROMENT TEST_NAME WORKING_DIR)
    if(AUTOPILOT_BIN)
        add_custom_command(TARGET autopilot
            COMMAND ${ENVIROMENT} autopilot run ${TEST_NAME} ${AUTOPILOT_TESTS_ARGS}
            WORKING_DIRECTORY ${WORKING_DIR})
    endif()
endfunction()
