@echo off
echo 正在创建构建目录...
mkdir build_static 2>nul
cd build_static

echo 使用静态链接配置进行CMake配置...
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../toolchain-mingw.cmake -DCMAKE_EXE_LINKER_FLAGS="-static" -DUA2F_ENABLE_UCI=OFF -DUA2F_ENABLE_BACKTRACE=OFF -f ../CMakeLists.static.txt ..

echo 开始编译静态链接版本的UA2F...
cmake --build . --config Release

echo 编译完成！
echo 可执行文件位于: %cd%\ua2f_static.exe
cd ..
