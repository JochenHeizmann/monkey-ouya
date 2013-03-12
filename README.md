# Ouya-Target for [Monkey][]

## What's this?

This is an [Ouya][]-Target for the [Monkey][]-Language. 

It's based on the ODK Version 1.0 and Monkey v68. (it does NOT work with older version, cause it uses the new Target-System).

## Install

### Clone this repo into the Monkey targets directory

    cd /Applications/Monkey/targets
    git clone https://github.com/JochenHeizmann/monkey-ouya.git ./ouya

### Create a new builder. 

Create a new file "ouya.monkey" in the Monkey trans builders directory (/Applications/Monkey/src/transcc/builders) with the following content:

    Import android

    Class OuyaBuilder Extends AndroidBuilder
        Method New( tcc:TransCC )
            Super.New( tcc )
        End
    End

### Add the new builder. 

Add the following import to it (/Applications/Moneky/src/transcc/builders/builders.monkey)

    Import ouya

### Also add a instance of it to the Builder-Map:

    builders.Set "ouya",New OuyaBuilder( tcc )

### Compile transcc and replace the original Monkey trans bianry:

    cd /Applications/Monkey/src/transcc
    [ -d transcc.build ] && rm -rf transcc.build
    /Applications/Monkey/bin/transcc_macos -config=release -target=C++_Tool -build transcc.monkey
    cp /Applications/Monkey/bin/transcc_macos /Applications/Monkey/bin/transcc_macos_backup
    cp ./transcc.build/cpptool/main_macos /Applications/Monkey/bin/transcc_macos

### Check if everthing was successful. 

If you call transcc without parameters OuyaGame should appear as target:

    /Applications/Monkey/bin/transcc_macos
    (output: Valid targets: Android_Game C++_Tool Glfw_Game Html5_Game Ouya_Game iOS_Game)

## The Ouya-Controller

To check the OUYA-Controller you can use the standard Monkey Key-Commands. The O-U-Y-A Buttons are mapped to KEY_O, KEY_U, KEY_Y, KEY_A. The DPad is mapped to KEY_DOWN, KEY_LEFT, KEY_RIGHT, KEY_UP. L1, L2, L3 are mapped to KEY_1, KEY_2, KEY_3. R1, R2, R3 to KEY_8, KEY_9, KEY_0.

The TouchPad is mapped to the default TouchX, TouchY-Commands.

## The Payment Module

A class (OuyaPayment) to handle the payment is already included. But to use it from Monkey it has to be wrapped. For this purpose you'll find a Payment module in this repo. If you want to use it you should move the directory "ouyaiap" to your modules-folder (/Applications/Monkey/modules/).

Check the official Ouya-Doc before you use it, so you know what happens behind the scenes.

## Message

This target is experimental. It would probably be better to use the new Gamepad-Commands instead of a Gamecontroller-to-Key-Mapping, but for now it works - and I quite like it that I don't have to alter my code if I already use Cursor-Key-Controls.


### License

    This is public domain.
    No warranty implied; use at your own risk.
    
[Monkey]: http://www.monkeycoder.co.nz/
[Ouya]: http://www.ouya.tv
