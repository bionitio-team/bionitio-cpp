Bionitio uses the `cmake` tool to build an executable. You will need to have `cmake` installed on your system.

On OS X you can install `cmake` via Homebrew like so (you might need to run `brew update` first):
```
% brew install cmake
```

The instructions below show you how to build bionitio. They assume that you set the shell variable `BIONITIO_CPP_PATH` to refer to the source directory of bionitio. For example, you might set it like so:

```
% export BIONITIO_CPP_PATH=$HOME/code/bionitio/cpp/src
```

Execute the commands below to build bionitio. Note that bionitio depends on the `Seqan` library.
```
% cd $BIONITIO_CPP_PATH    
% wget http://packages.seqan.de/seqan-library/seqan-library-2.1.1.tar.xz
% tar xvf seqan-library-2.1.1.tar.xz
% mkdir bionitio-build
% cd bionitio-build
% cmake $BIONITIO_CPP_PATH -DCMAKE_MODULE_PATH=$BIONITIO_CPP_PATH/seqan-library-2.1.1/share/cmake/Modules/ -DSEQAN_INCLUDE_PATH=$BIONITIO_CPP_PATH/seqan-library-2.1.1/include/ -DCMAKE_CXX_FLAGS=-std=c++11
% make
```

If you want to use a specific compiler, such as clang++ on OSX then add a flag like so to the `cmake` command above:
```
-DCMAKE_CXX_COMPILER=clang++
```

If your BOOST library is in a non-standard location (not in a system directory) then add the following flags to the command above:
```
-DBoost_NO_BOOST_CMAKE=TRUE -DBOOST_ROOT=/path/to/your/boost/installation
```
