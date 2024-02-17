# capacitor-undefined-demo

## Commands to setup project
> `npm init @capacitor/app` was used to create this base project 
> Also added Android app to dependencies `npm i @capacitor/android`

## Run commands

```bash
# Remove previous dependencies to install new custom Android package
cd app && rm -rf node_modules && npm install && npm run build

sh build-android.sh
```

**Note**

We added `appendUserAgent="fooTest"` (for this test any userAgent string works) to `capacitor.config.json`

Changed the order of `appendUserAgent` inside Capacitor Android package. We change this becaue we got another app loading issue when then appened string was added at the end of the useragent string but if we add the string first the app loads properly.

File: `app/packages/@capacitor/android/capacitor/src/main/java/com/getcapacitor/Bridge.java`

**From**
```javascript
String appendUserAgent = this.config.getAppendedUserAgentString();
if (appendUserAgent != null) {
    String defaultUserAgent = settings.getUserAgentString();
    settings.setUserAgentString(defaultUserAgent + " " + appendUserAgent);
}
```

**To**
```javascript
String appendUserAgent = this.config.getAppendedUserAgentString();
if (appendUserAgent != null) {
    String defaultUserAgent = settings.getUserAgentString();
    settings.setUserAgentString(appendUserAgent + " " + defaultUserAgent);
}
```
