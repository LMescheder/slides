INFOLDER="$PWD/raw0"
OUTFOLDER="$PWD/raw/texnet"

cd $INFOLDER

for f in *.mp4; do
    echo $f
    echo $OUTFOLDER/$f
    echo ================================
    ffmpeg -i $f -filter_complex "[0:v]reverse,fifo[r];[0:v][r] concat=n=2:v=1 [v]" -map "[v]" "$OUTFOLDER/$f"
done

