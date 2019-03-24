#!/bin/bash

cp ../straight/straight.gif ./
cp ../not-straight/not-straight.gif ./

# Separate animations into coalesced frames (plus a ".anim" file)
./gif2anim.sh -c straight.gif &
./gif2anim.sh -c not-straight.gif &

echo "waiting for previous conversions to finish"
date
wait
date
echo "Done"

# Append the separated frames them together
for i in `seq -f '%03g' 1 116`; do \
    magick convert straight_$i.gif not-straight_$i.gif +append side-by-side_$i.gif; \
    done

# Rebuild the animation (using one of the ".anim" files)
./anim2gif.sh -c -b side-by-side  straight.anim

# Cleanup
rm -f straight.anim not-straight.anim
rm -f straight_* not-straight_* side-by-side_1* side-by-side_0*

echo "Finished the windless ones ! ! !! !"

cp ../straight/straight-wind.gif ./
cp ../not-straight/not-straight-wind.gif ./

# Separate animations into coalesced frames (plus a ".anim" file)
./gif2anim.sh -c straight-wind.gif &
./gif2anim.sh -c not-straight-wind.gif &

echo "waiting for previous conversions to finish"
date
wait
date
echo "Done"

# Append the separated frames them together
for i in `seq -f '%03g' 1 116`; do \
  magick convert straight-wind_$i.gif not-straight-wind_$i.gif +append side-by-side-wind_$i.gif; \
done

# Rebuild the animation (using one of the ".anim" files)
./anim2gif.sh -c -b side-by-side-wind  straight-wind.anim

# Cleanup
rm -f straight-wind.anim not-straight-wind.anim
rm -f straight-wind_* not-straight-wind_* side-by-side-wind_1* side-by-side-wind_0*
