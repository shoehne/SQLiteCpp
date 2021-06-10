project "SQLiteCpp"
  kind "StaticLib"
  language "C++"

  location "./"

  targetdir ("../../bin/" .. output_dir .. "/%{prj.name}")
  objdir ("../../bin-obj/" .. output_dir .. "/%{prj.name}")

  files {
    "./include/SQLiteCpp/**.h",
    "./src/**.cpp"
  }

  includedirs {

    "./sqlite3",
    "./include"
  }

  defines {

    "SQLITE_ENABLE_FTS5",
    "SQLITE_ENABLE_COLUMN_METADATA",
    "SQLITE_ENABLE_JSON1"
  }

  filter "system:windows"
    systemversion "latest"
    cppdialect "C++17"
    staticruntime "On"

    defines {

      "WIN32",
      "_WINDOWS",
      "_CRT_SECURE_NO_WARNINGS"
    }

  filter { "system:windows", "configurations:Debug" }
    buildoptions "/MTd"
    links {

      ("../../bin/" .. output_dir .. "/SQLite3/SQLite3")
    }

  filter { "system:windows", "configurations:Release" }
    buildoptions "/MT"
    links {

      ("../../bin/" .. output_dir .. "/SQLite3/SQLite3")
    }

project "SQLite3"
  kind "StaticLib"
  language "C"

  location "./"
  
  objdir ("../../bin-obj/" .. output_dir .. "/%{prj.name}")
  targetdir ("../../bin/" .. output_dir .. "/%{prj.name}")
  
  files {
    "./sqlite3/sqlite3.c",
    "./sqlite3/sqlite3.h"
  }

  includedirs {

    "./sqlite3"
  }

  defines {

    "SQLITE_ENABLE_FTS5",
    "SQLITE_ENABLE_COLUMN_METADATA",
    "SQLITE_ENABLE_JSON1"
  }
  
  filter "system:windows"
    systemversion "latest"
    staticruntime "On"

    defines {

      "WIN32",
      "_WINDOWS",
      "_CRT_SECURE_NO_WARNINGS"
    }

  filter { "system:windows", "configurations:Debug" }
    buildoptions "/MTd"

  filter { "system:windows", "configurations:Release" }
    buildoptions "/MT"