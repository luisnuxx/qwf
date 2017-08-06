clear

~/Development/tools/clang_3_9_0/bin/clang++  -std=c++14 \
-O3 -lboost_system -lboost_thread-mt -stdlib=libc++  \
-I./include/ \
-I./include/app/ \
-I/usr/local/Cellar/boost/1.64.0_1/include/ \
-I./include/spdlog/include/ \
-L/usr/local/Cellar/boost/1.64.0_1/lib/ \
-L./include/app/ \
-L./include/ \
main.cpp \
-o main

if [ $? -eq 0 ]
then
    echo "Compiled successfuly"
    #./main
else
  echo "Found error compiling"
fi

#./hello
#-I/usr/local/Cellar/boost/1.63.0/include/ \
#-L/usr/local/Cellar/boost/1.63.0/lib/ \
