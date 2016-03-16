

>adb devices
adb -s DEVICE_ID

##Install an application
Use the `install` command to install an apk, the optional `-r` argument reinstalls and keeps any data if the application is already installed on the device.

    adb install -r APK_FILE
    
  >*example*
    
    adb install -r ~/application.apk

##GPS

	adb shell settings put secure location_providers_allowed gps
	adb shell settings put secure location_providers_allowed gps,network
>*Disable*

	adb shell settings put secure location_providers_allowed ' '

##Uninstall an application
	adb uninstall PACKAGE_NAME
  > *example*
   
	adb uninstall com.growingwiththeweb.example
    
##Start an activity

	adb shell am start PACKAGE_NAME/ACTIVITY_IN_PACKAGE
	adb shell am start PACKAGE_NAME/FULLY_QUALIFIED_ACTIVITY

> *example*

    adb shell am start -n com.growingwiththeweb.example/.MainActivity
    adb shell am start -n com.growingwiththeweb.example/com.growingwiththeweb.example.MainActivity
##Launch the default browser at a URL
	  
	adb shell am start -a android.intent.action.VIEW -d URL

>*example*

	adb shell am start -a android.intent.action.VIEW -d http://www.growingwiththeweb.com
##Entering the device’s shell

	adb shell
##Take a screenshot

Sergei Shvetsov came up with a nice one liner that takes a screenshot with shell screencap and outputs it to a local directory using perl. Checkout his blog for an explanation.
	
	adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > screen.png

##Power button
This command sends the power button event to turn the device on or off.

	adb shell input keyevent 26

##Unlock screen
This command sends the event that unlocks the lockscreen on the device. It can be combine with the power button command above to turn on and unlock the device.

	adb shell input keyevent 82

##Print all installed packages
	
	adb shell pm list packages -f

##Clear application data
		
	adb shell pm clear PACKAGE_NAME

>example

	adb shell pm clear com.growingwiththeweb.example

##Logging
To show the log stream on your command line.

	adb logcat

##Filter by tagname

	adb logcat -s TAG_NAME
	adb logcat -s TAG_NAME_1 TAG_NAME_2

>example

	adb logcat -s TEST
	adb logcat -s TEST MYAPP

##Filter by priority
To show logs of a specific priority warning and above.

	adb logcat "*:PRIORITY"

>example

	adb logcat "*:W"

Here are the priority levels:

 - V - Verbose (lowest priority) 
 - D - Debug 
 - I - Info 
 - W - Warning 
 - E -  Error 
 - F - Fatal 
 - S - Silent 
(highest priority, on which nothing is ever printed)

##Filter by tagname and priority

    adb logcat -s TAG_NAME:PRIORITY
    adb logcat -s TAG_NAME_1:PRIORITY TAG_NAME_2:PRIORITY

>example

    adb logcat -s TEST: W

##Filter using grep
Alternatively the output of logcat can be piped to grep on a system that supports it.

    adb logcat | grep "SEARCH_TERM"
    adb logcat | grep "SEARCH_TERM_1\|SEARCH_TERM_2"

>example

    adb logcat | grep "Exception"
    adb logcat | grep "Exception\|Error"

##Clearing the logcat buffer
Use this to clear the buffer to remove any old log data.

    adb logcat -c






