macro(check_epoll VARIABLE)
  if(UNIX)
    if("${VARIABLE}" MATCHES "^${VARIABLE}$")
      message(STATUS "Checking for epoll support")

      include(CheckSymbolExists)
      check_symbol_exists(epoll_create "sys/epoll.h" EPOLL_PROTOTYPE_EXISTS)

      if(EPOLL_PROTOTYPE_EXISTS)
        message(STATUS "Checking for epoll support - yes")
        set(${VARIABLE} 1 CACHE INTERNAL "Result of check_epoll" FORCE)
      else(EPOLL_PROTOTYPE_EXISTS)
        message(STATUS "Checking for epoll support - no")
        set(${VARIABLE} "" CACHE INTERNAL "Result of check_epoll" FORCE)
      endif(EPOLL_PROTOTYPE_EXISTS)
    endif("${VARIABLE}" MATCHES "^${VARIABLE}$")
  endif(UNIX)
endmacro(check_epoll)

