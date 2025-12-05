from glob import glob

for file in glob("*preview*.jpg"):
    res = file.split("_")[2]
    width, height = res.split("x")
    print(f"""<a class="Thumbnails-thumb" href="./assets/pictures/{file}" style="--image-width: {width}; --image-height: {height};">
    <img class="Thumbnails-thumbImg" loading="lazy" src="./assets/pictures/{file}" alt="">
  </a>""")
