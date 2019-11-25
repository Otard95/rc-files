
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## My settings

xset r rate 160 45

## Android react native

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


