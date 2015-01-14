for d in */ ; do
  if [[ -d $d ]]; then

    if [[ $d ==  'mobile.kaeuferportal.de.local/' ]]; then
      continue
    fi

    if [[ $d ==  'www.fcstrausberg.de.local/' ]]; then
      continue
    fi

    if [[ $d ==  'www.kpwordpress.de.local/' ]]; then
      continue
    fi

    if [[ $d ==  'www.meinkp.local/' ]]; then
      continue
    fi

    cd $d
    cap beta deploy
    cd ..
  fi
done
