FIND_PATH(MYSQLCPPCONN_INCLUDE_DIR cppconn/version_info.h)
FIND_LIBRARY(MYSQLCPPCONN_LIBRARIES NAMES mysqlcppconn)

IF(MYSQLCPPCONN_INCLUDE_DIR AND MYSQLCPPCONN_LIBRARIES)
	SET(MYSQLCPPCONN_FOUND TRUE)
ENDIF(MYSQLCPPCONN_INCLUDE_DIR AND MYSQLCPPCONN_LIBRARIES)

IF(MYSQLCPPCONN_FOUND)
	IF (NOT MySQLcppconn_FIND_QUIETLY)
		MESSAGE(STATUS "Found mysqlcppconn includes:	${MYSQLCPPCONN_INCLUDE_DIR}")
		MESSAGE(STATUS "Found mysqlcppconn library: ${MYSQLCPPCONN_LIBRARIES}")
	ENDIF (NOT MySQLcppconn_FIND_QUIETLY)
ELSE(MYSQLCPPCONN_FOUND)
	IF (MySQLcppconn_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could NOT find mysqlcppconn development files")
	ENDIF (MySQLcppconn_FIND_REQUIRED)
ENDIF(MYSQLCPPCONN_FOUND)

# Check for buried mysql_version.h
FIND_PATH(MYSQL_INCLUDE_MYSQL_VERSION_H mysql_version.h)
IF(NOT MYSQL_INCLUDE_MYSQL_VERSION_H)
	FIND_PATH(MYSQL_INCLUDE_BURIED_MYSQL_VERSION_H mysql/mysql_version.h)
	IF(MYSQL_INCLUDE_BURIED_MYSQL_VERSION_H)
		ADD_DEFINITIONS(-DMYSQLPP_MYSQL_HEADERS_BURIED)
	ENDIF(MYSQL_INCLUDE_BURIED_MYSQL_VERSION_H)
ENDIF(NOT MYSQL_INCLUDE_MYSQL_VERSION_H)
