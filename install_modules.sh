moduledir="./MagicMirror/modules"

jq -M -r '.[] | .name, .url, .npmInstall' "./modules.json" | \
while read -r name; read -r url; read -r npmInstall; do
  
  printf "Cloning module repository for module: $name \n";

  if (git clone $url "$moduledir/$name"); then

    if [ "$npmInstall" = true ]; then
      printf "Installing npm dependencies for module: $name \n\n";
      npm install --prefix "$moduledir/$name";
    fi

    printf "Done installing $name! \n\n\n\n\n";
  else 
    printf "Unable to clone repository $name. Skipping... \n\n";
  fi

done