`mindustry.sh`

```
version=$1

tag1=oscarhult/mindustry:${version}
tag2=oscarhult/mindustry:latest

docker build \
  --no-cache \
  --pull \
  --tag ${tag1} \
  --tag ${tag2} \
  --build-arg MINDUSTRY_VERSION=${version} \
  'https://github.com/oscarhult/mindustry.git'

docker push ${tag1}
docker push ${tag2}
```

`./mindustry.sh v126.2`
