# ask

## Development

```
$ ./build_run.sh
```

Then, you can check the app is working in other terminal:

```
$ localhost:8000
Hello world!%
```

## ORmapper

- Delete
```
# delete id = 7
SearchLight.delete(SearchLight.find_one!!(Question, 7))
```
delete is exported, so We can write delete query
```
delete(SearchLight.find_one!!(Question, 7))
```