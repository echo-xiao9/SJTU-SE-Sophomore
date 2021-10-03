#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/kangyixiao/EchoFile/coding/SJTU-SE/SE344_ComputerGraphics/glfw-3.3.4/build
  make -f /Users/kangyixiao/EchoFile/coding/SJTU-SE/SE344_ComputerGraphics/glfw-3.3.4/build/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/kangyixiao/EchoFile/coding/SJTU-SE/SE344_ComputerGraphics/glfw-3.3.4/build
  make -f /Users/kangyixiao/EchoFile/coding/SJTU-SE/SE344_ComputerGraphics/glfw-3.3.4/build/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/kangyixiao/EchoFile/coding/SJTU-SE/SE344_ComputerGraphics/glfw-3.3.4/build
  make -f /Users/kangyixiao/EchoFile/coding/SJTU-SE/SE344_ComputerGraphics/glfw-3.3.4/build/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/kangyixiao/EchoFile/coding/SJTU-SE/SE344_ComputerGraphics/glfw-3.3.4/build
  make -f /Users/kangyixiao/EchoFile/coding/SJTU-SE/SE344_ComputerGraphics/glfw-3.3.4/build/CMakeScripts/ReRunCMake.make
fi

