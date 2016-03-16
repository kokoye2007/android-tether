
#ADB
    adb devices
    adb -s DEVICE_ID
    
## Entering the device’s shell

	adb shell

##Install an application
Use the `install` command to install an apk, the optional `-r` argument reinstalls and keeps any data if the application is already installed on the device.

    adb install -r APK_FILE
    
  >example
  >  
    adb install -r ~/application.apk

##GPS

	adb shell settings put secure location_providers_allowed gps
	adb shell settings put secure location_providers_allowed gps,network

>Disable

	adb shell settings put secure location_providers_allowed ' '

##Uninstall an application
	adb uninstall PACKAGE_NAME
  
  > example
   >
	adb uninstall com.growingwiththeweb.example
    
##Start an activity

	adb shell am start PACKAGE_NAME/ACTIVITY_IN_PACKAGE
	adb shell am start PACKAGE_NAME/FULLY_QUALIFIED_ACTIVITY

> example
>
    adb shell am start -n com.growingwiththeweb.example/.MainActivity
    adb shell am start -n com.growingwiththeweb.example/com.growingwiththeweb.example.MainActivity
    
##Launch the default browser at a URL
	  
	adb shell am start -a android.intent.action.VIEW -d URL

>example
>
	adb shell am start -a android.intent.action.VIEW -d http://www.growingwiththeweb.com


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
>
	adb shell pm clear com.growingwiththeweb.example

##SVC

    adb shell svc data enable
    adb shell svc data disable
    adb shell svc wifi enable
    adb shell svc wifi disable
   
>other command
>    
    help     Show information about the subcommands
    power    Control the power manager
    data     Control mobile data connectivity
    wifi     Control the Wi-Fi manager
    usb      Control Usb state
    nfc      Control NFC functions


##Input

###Insert Text

Insert text:

	adb shell input text "I%sam%sKo%sKo"
>(obs: %s means SPACE)
>I am Ko Ko

### Event Code

    adb shell input keyevent 26
>(26 ---> POWER_BUTTON)

    0 -->  "KEYCODE_0" 
    1 -->  "KEYCODE_SOFT_LEFT" 
    2 -->  "KEYCODE_SOFT_RIGHT" 
    3 -->  "KEYCODE_HOME" 
    4 -->  "KEYCODE_BACK" 
    5 -->  "KEYCODE_CALL" 
    6 -->  "KEYCODE_ENDCALL" 
    7 -->  "KEYCODE_0" 
    8 -->  "KEYCODE_1" 
    9 -->  "KEYCODE_2" 
    10 -->  "KEYCODE_3" 
    11 -->  "KEYCODE_4" 
    12 -->  "KEYCODE_5" 
    13 -->  "KEYCODE_6" 
    14 -->  "KEYCODE_7" 
    15 -->  "KEYCODE_8" 
    16 -->  "KEYCODE_9" 
    17 -->  "KEYCODE_STAR" 
    18 -->  "KEYCODE_POUND" 
    19 -->  "KEYCODE_DPAD_UP" 
    20 -->  "KEYCODE_DPAD_DOWN" 
    21 -->  "KEYCODE_DPAD_LEFT" 
    22 -->  "KEYCODE_DPAD_RIGHT" 
    23 -->  "KEYCODE_DPAD_CENTER" 
    24 -->  "KEYCODE_VOLUME_UP" 
    25 -->  "KEYCODE_VOLUME_DOWN" 
    26 -->  "KEYCODE_POWER" 
    27 -->  "KEYCODE_CAMERA" 
    28 -->  "KEYCODE_CLEAR" 
    29 -->  "KEYCODE_A" 
    30 -->  "KEYCODE_B" 
    31 -->  "KEYCODE_C" 
    32 -->  "KEYCODE_D" 
    33 -->  "KEYCODE_E" 
    34 -->  "KEYCODE_F" 
    35 -->  "KEYCODE_G" 
    36 -->  "KEYCODE_H" 
    37 -->  "KEYCODE_I" 
    38 -->  "KEYCODE_J" 
    39 -->  "KEYCODE_K" 
    40 -->  "KEYCODE_L" 
    41 -->  "KEYCODE_M" 
    42 -->  "KEYCODE_N" 
    43 -->  "KEYCODE_O" 
    44 -->  "KEYCODE_P" 
    45 -->  "KEYCODE_Q" 
    46 -->  "KEYCODE_R" 
    47 -->  "KEYCODE_S" 
    48 -->  "KEYCODE_T" 
    49 -->  "KEYCODE_U" 
    50 -->  "KEYCODE_V" 
    51 -->  "KEYCODE_W" 
    52 -->  "KEYCODE_X" 
    53 -->  "KEYCODE_Y" 
    54 -->  "KEYCODE_Z" 
    55 -->  "KEYCODE_COMMA" 
    56 -->  "KEYCODE_PERIOD" 
    57 -->  "KEYCODE_ALT_LEFT" 
    58 -->  "KEYCODE_ALT_RIGHT" 
    59 -->  "KEYCODE_SHIFT_LEFT" 
    60 -->  "KEYCODE_SHIFT_RIGHT" 
    61 -->  "KEYCODE_TAB" 
    62 -->  "KEYCODE_SPACE" 
    63 -->  "KEYCODE_SYM" 
    64 -->  "KEYCODE_EXPLORER" 
    65 -->  "KEYCODE_ENVELOPE" 
    66 -->  "KEYCODE_ENTER" 
    67 -->  "KEYCODE_DEL" 
    68 -->  "KEYCODE_GRAVE" 
    69 -->  "KEYCODE_MINUS" 
    70 -->  "KEYCODE_EQUALS" 
    71 -->  "KEYCODE_LEFT_BRACKET" 
    72 -->  "KEYCODE_RIGHT_BRACKET" 
    73 -->  "KEYCODE_BACKSLASH" 
    74 -->  "KEYCODE_SEMICOLON" 
    75 -->  "KEYCODE_APOSTROPHE" 
    76 -->  "KEYCODE_SLASH" 
    77 -->  "KEYCODE_AT" 
    78 -->  "KEYCODE_NUM" 
    79 -->  "KEYCODE_HEADSETHOOK" 
    80 -->  "KEYCODE_FOCUS" 
    81 -->  "KEYCODE_PLUS" 
    82 -->  "KEYCODE_MENU" 
    83 -->  "KEYCODE_NOTIFICATION" 
    84 -->  "KEYCODE_SEARCH" 
    85 -->  "KEYCODE_MEDIA_PLAY_PAUSE"
    86 -->  "KEYCODE_MEDIA_STOP"
    87 -->  "KEYCODE_MEDIA_NEXT"
    88 -->  "KEYCODE_MEDIA_PREVIOUS"
    89 -->  "KEYCODE_MEDIA_REWIND"
    90 -->  "KEYCODE_MEDIA_FAST_FORWARD"
    91 -->  "KEYCODE_MUTE"
    92 -->  "KEYCODE_PAGE_UP"
    93 -->  "KEYCODE_PAGE_DOWN"
    94 -->  "KEYCODE_PICTSYMBOLS"
    ...
    122 -->  "KEYCODE_MOVE_HOME"
    123 -->  "KEYCODE_MOVE_END"

   
### Tap X,Y position

    adb shell input tap 500 1450
   
To find the exact X,Y position you want to Tap go to:
>Settings > Developer Options > Check the option POINTER LOCATION

### Swipe X1 Y1 X2 Y2 [duration(ms)]:

    adb shell input swipe 100 500 100 1450 100

>   in this example  X1=100, Y1=500, X2=100, Y2=1450, Duration = 100ms

### LongPress X Y:

    adb shell input swipe 100 500 100 500 250

we utilise the same command for a swipe to emulate a long press

>in this example X=100, Y=500, Duration = 250ms

###tip

>Notification – Show the list of notifications

	adb shell input swipe     10 10 10 1000

>CloseNotification – Close the notification list

	adb shell input swipe     10 1000 10 10

>OpenPatternLock – Open for Pattern Lock Drawer 
	
	adb shell input swipe     100 500 100 1450 100


##Service 

#### Service
    adb shell service list

	adb shell service check <service>

>example
>	
	adb shell service check media.player

#### Dumpsys 

    dumpsys <service>

>example
	>   
	 adb shell dumpsys media.player


All about detail 

    adb shell dumpsys activity services

##Logging
To show the log stream on your command line.

	adb logcat

##Filter by tagname

	adb logcat -s TAG_NAME
	adb logcat -s TAG_NAME_1 TAG_NAME_2

>example
>
	adb logcat -s TEST
	adb logcat -s TEST MYAPP

##Filter by priority
To show logs of a specific priority warning and above.

	adb logcat "*:PRIORITY"

>example
>
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
>
    adb logcat -s TEST: W

##Filter using grep
Alternatively the output of logcat can be piped to grep on a system that supports it.

    adb logcat | grep "SEARCH_TERM"
    adb logcat | grep "SEARCH_TERM_1\|SEARCH_TERM_2"

>example
>
    adb logcat | grep "Exception"
    adb logcat | grep "Exception\|Error"

##Clearing the logcat buffer
Use this to clear the buffer to remove any old log data.

    adb logcat -c


