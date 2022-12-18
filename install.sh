proverif_version="2.04"
target_folder="./proverif"
proverif_folder="./proverif/proverif$proverif_version"

## TODO
rm -rf $target_folder

# Check target folder
if [ -d "$target_folder" ]; then
    echo "Target folder $target_folder already exists. Please remove it to reinstall."
    exit 1
fi

# Download and extract proverif source
mkdir -p $target_folder
wget -c https://bblanche.gitlabpages.inria.fr/proverif/proverif$proverif_version.tar.gz -O - \
    | tar -xz -C $target_folder


# Build from source
pushd $proverif_folder > /dev/null
pwd
./build
popd > /dev/null

echo "Proverif installed in $target_folder"
