ARGS="-pix_fmt yuv420p -c:v libx264 -movflags +faststart -filter:v crop='floor(in_w/2)*2:floor(in_h/2)*2'"
DIVIDE=$PWD/divide.py

root=$PWD
cd raw
for d in *; do
    cd $d
    mkdir -p $root/$d
    # for f in *.mp4; do
    #     ffmpeg -n -i $f $ARGS $root/$d/$f
    #     ffmpeg -n -ss 00:00:00.2 -i $f -vframes 1 -q:v 2 $root/$d/${f%.*}.png
    # done
    for f in *.svg; do
        python $DIVIDE $f "$root/$d/${f%.*}_%02d.svg"
    done
    cd ..
done

cd $root
