# cordova-plugin

Cordova plugin  


## Notes
This plugin supports Android and iOS.    


## Quick Example

Call below function wherever required

```javascript

 changeappicon.ChanageToIcon($parameters.IconName,successCallback,errorCallback)



function successCallback(value){

$parameters.Issuccess = true;
$parameters.Msg = value;
$actions.LogMessage("Success ::::"+value,"ChangeToIcon")
 $resolve();

}

function errorCallback(err){
   $parameters.Issuccess = false; 
$parameters.Msg = err;
$actions.LogMessage("Errorrr:::::"+err,"ChangeToIcon")
 $resolve();
}


```

## License

MIT
