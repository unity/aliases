#!/usr/bin/env zsh

convert_to_horizontal_epub () {
  echo "Replacing content in $1"
  sed -i '' 's/\<meta name="viewport" content="width=768, height=1024"\/>/\<meta name="viewport" content="width=1024, height=768"\/>/g' $1/OEBPS/*.html;
  sed -i '' 's/\<meta name="viewport" content="width=768, height=1024"\/>/\<meta name="viewport" content="width=1024, height=768"\/>/g' $1/OEBPS/*.xhtml;
  sed -i '' 's/\<meta property="rendition:spread">auto/<meta property="rendition:spread">none/g' $1/OEBPS/*.opf;
}

convert_to_horizontal () {
  for file in "$@"; do
    echo "Converting $file";
    convert_to_horizontal_epub $file;
  done
}

