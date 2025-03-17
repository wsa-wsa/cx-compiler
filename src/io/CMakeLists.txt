add_library(cx_io io.c)

install(
    TARGETS cx_io
    ARCHIVE DESTINATION lib
)
