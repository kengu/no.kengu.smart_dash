# Update Device Drivers

This function executes driver updates on all registered device.

`functionId`: `update_drivers`

## 🤖 Documentation

This function is scheduled to execute every 60 seconds with cron 
schedule "* * * * *" that it fires an update loop every 5 seconds for 
55 seconds. It will time out if the update loop is not completed within 
90 seconds (see `appwrite.json`).

_Example input:_

This function have no input. 

_Example output:_

```json
{
 "loops": 10,
 "changed": 33
}
```

## 📝 Environment Variables

List of environment variables used by this cloud function:

- **APPWRITE_FUNCTION_ENDPOINT** - Endpoint of Appwrite project
- **APPWRITE_FUNCTION_API_KEY** - Appwrite API Key
- **APPWRITE_FUNCTION_UPDATE_PERIOD** - Period between each update (given in seconds)

## 🚀 Deployment

Deploy this function with
```console
appwrite deploy function
```
... and select function "Update Device Drivers (update_drivers)"