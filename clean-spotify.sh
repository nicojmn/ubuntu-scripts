#!/bin/bash

SIZE=128
SPOTIFYDATAPATH="$HOME/snap/spotify/common/.cache/spotify/Data/"
DATASIZE=$(du -sm $HOME/snap/spotify/common/.cache/spotify/Data | cut -f 1)

if [ "$DATASIZE" -gt "$SIZE" ]; then
  echo "The size of spotify data folder is : $DATASIZE MB"
  rm -rf "$SPOTIFYDATAPATH"
  echo "Successfully remove data folder"
  echo "Done."
else
  echo "Spotify data folder size ($DATASIZE MB) is not exceeding the limit (limit is : $SIZE MB)"
  echo -n "Do you want to delete the folder anyway (YES/n): ";
  read -r;
  if [ "$REPLY" == "YES" ]; then
      rm -rf "$SPOTIFYDATAPATH"
  else
    echo "Aborting"
  fi
fi

