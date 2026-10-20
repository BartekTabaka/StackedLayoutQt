#
# App
#

# Files
set(APP_SOURCES
    Source/Main.cpp

    Source/BasePage.h
    Source/BasePage.cpp
)

set(UI_RESOURCES
    Resources/Embedded/Styles/Main.qss
)

# Executable target (.exe)
qt_add_executable(StackedLayoutQt)

# Set sources
target_sources(StackedLayoutQt PRIVATE ${APP_SOURCES} ${UI_RESOURCES})
target_include_directories(StackedLayoutQt PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/Source)

# Link libraries
target_link_libraries(StackedLayoutQt PRIVATE Qt6::Widgets)

# Windows-only stuff
if(WIN32)
    set_target_properties(StackedLayoutQt PROPERTIES
        # GUI subsystem (no console window) in every config except Debug
        WIN32_EXECUTABLE $<NOT:$<CONFIG:Debug>>
        VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    )
endif()

# Embedded resources (compiled into the exe, accessed via ":/...")
qt_add_resources(StackedLayoutQt "app_resources"
    PREFIX "/"
    BASE   "Resources/Embedded"
    FILES  ${UI_RESOURCES}
)

# Resource files tree in VS
source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}" FILES ${UI_RESOURCES})

# Windows-only: application icon embedded via a resource script
if(WIN32)
    #target_sources(StackedLayoutQt PRIVATE Resources/Windows/app.rc)
endif()

