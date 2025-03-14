#!/bin/bash

# 添加assert.h到ua2f.c
if ! grep -q "#include <assert.h>" src/ua2f.c; then
  sed -i '/#include <syslog.h>/a #include <assert.h>' src/ua2f.c
  echo "添加了assert.h到ua2f.c"
fi

# 添加assert.h到handler.c
if ! grep -q "#include <assert.h>" src/handler.c; then
  sed -i '/#include <linux\/if_ether.h>/a #include <assert.h>' src/handler.c
  echo "添加了assert.h到handler.c"
fi

# 禁用backtrace功能
sed -i 's/#define UA2F_ENABLE_BACKTRACE 1/#define UA2F_ENABLE_BACKTRACE 0/g' src/backtrace.h 2>/dev/null || echo "无法修改backtrace.h"

echo "头文件修复完成"
