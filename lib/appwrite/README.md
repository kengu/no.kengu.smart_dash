# Smart Dash Backend
The backend is implemented using [Appwrite](https://appwrite.io/).

## Development
See [Appwrite Docs](https://appwrite.io/docs) for complete reference on how to implement 
Appwrite components. 

### Add new collection
Add new collection to `appwrite.json` and deploy with `appwrite deploy collection`. 
Database with `databaseId` not defined already are added automatically with name equal 
to `databaseId`.

### Add new function
Add new function to `appwrite.json` and deploy with `appwrite deploy function`.

## DevOps

Start Appwrite with
```console
docker compose up -d --remove-orphans
```

Stop Appwrite with
```console
docker compose stop
```

Delete Appwrite with
```console
docker compose down -v
```

Deploy Appwrite [collections](https://appwrite.io/docs/databases) with
```console
appwrite deploy collection
```

Deploy Appwrite [functions](https://appwrite.io/docs/functions) with
```console
appwrite deploy function
```


## Backup & Restore
[See video](https://www.youtube.com/watch?v=lM5yZEPtlvg) for complete instructions.