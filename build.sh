# 
# BUILD THEME
# 

dir=`dirname $0`

. ./config.sh

# remove ./build if exists
if [ -d $dir/build ]; then    
    rm -rf $dir/build
fi

mkdir build

# php files
cp $dir/*.php $dir/build

# includes
cp -r $dir/includes $dir/build

# style.css
cp $dir/style.css $dir/build

# styles
cp -r $dir/styles $dir/build

# js
cp -r $dir/js $dir/build

# assets
cp -r $dir/assets $dir/build

rm -rf $dir/build/assets/images

zipname=$(echo $THEME_NAME | tr '[:upper:]' '[:lower:]' | tr ' ' '-')-v${THEME_VERSION};

cd build; 

zip -q ./$zipname.zip * # Without LOG
# zip -r ./$zipname.zip * #With LOG

echo -e "\x1b[40mBuild done successfully.\x1b[0m"

# 
# UPDATE VERSION
# 

cd ..

CONFIG_PATH="./config.sh"
CONFIG_PATH__TEMP="./__config.sh"

CURRENT_THEME_VERSION_VAR="THEME_VERSION=\"${THEME_VERSION}\"" # >> THEME_VERSION="1"
NEW_THEME_VERSION_VAR="THEME_VERSION=\"$((${THEME_VERSION} + 1))\"" # ADD 1 TO VERSION >> THEME_VERSION="2"

# Update Version in Another File "./__config.sh".
sed 's/'$CURRENT_THEME_VERSION_VAR'/'$NEW_THEME_VERSION_VAR'/g' ${CONFIG_PATH} > ${CONFIG_PATH__TEMP}

# Change new File to original File --> "./__config.sh" to "./config.sh".
mv ${CONFIG_PATH__TEMP} ${CONFIG_PATH}

echo -e "\x1b[40mVersion updated.\x1b[0m"