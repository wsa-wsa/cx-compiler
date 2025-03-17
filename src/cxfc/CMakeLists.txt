add_executable(
    cxfc
    main.cpp
    cxf_builder.cpp
)

target_link_libraries(
    cxfc
    IR_lib
    common
    codegen
    syntax
    stdc++fs
    passes
)

install(
    TARGETS cxfc
    RUNTIME DESTINATION bin
)
