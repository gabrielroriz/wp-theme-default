dir=`dirname $0`

. ./config.sh

# remove ./build if exists
if [ -d $dir/build ]; then    
    rm -rf $dir/build
fi

mkdir build

# copy all php files
cp $dir/*.php $dir/build

# copy all css files
cp -r $dir/*.css $dir/build

# js
cp -r $dir/js $dir/build

# assets
cp -r $dir/assets $dir/build

zipname=$(echo $THEME_NAME | tr '[:upper:]' '[:lower:]' | tr ' ' '_');

cd build; zip -r ./$zipname.zip *

echo -e "\x1b[40mBuild done successfully.\x1b[0m"