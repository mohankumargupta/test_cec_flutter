#! /usr/bin/python3

# sudo apt install -y cec-utils python3-evdev python3-cec

import cec
from time import sleep
from evdev import UInput, ecodes as e
# const values for key press comes from https://github.com/Pulse-Eight/libcec/blob/master/include/cectypes.h#L630

ui = UInput()

class pyCecClient:
  cecconfig = cec.libcec_configuration()
  lib = {}
  # don't enable debug logging by default
  #log_level = cec.CEC_LOG_TRAFFIC
  log_level = cec.CEC_LOG_TRAFFIC
  
  def __init__(self):
    self.SetConfiguration()

  def SetConfiguration(self):
    self.cecconfig.strDeviceName   = "pyLibCec"
    self.cecconfig.bActivateSource = 0
    self.cecconfig.deviceTypes.Add(cec.CEC_DEVICE_TYPE_RECORDING_DEVICE)
    self.cecconfig.deviceTypes.Add(cec.CEC_DEVICE_TYPE_PLAYBACK_DEVICE)
    self.cecconfig.deviceTypes.Add(cec.CEC_DEVICE_TYPE_TUNER)
    self.cecconfig.clientVersion = cec.LIBCEC_VERSION_CURRENT

  def SetLogCallback(self, callback):
    self.cecconfig.SetLogCallback(callback)

  def SetKeyPressCallback(self, callback):
    self.cecconfig.SetKeyPressCallback(callback)

  def SetCommandCallback(self, callback):
    self.cecconfig.SetCommandCallback(callback)

  def sendKey(self, key):
    if key == e.KEY_EXIT or key == e.KEY_CHANNELUP or e.KEY_CHANNELDOWN:
        ui.write(e.EV_KEY, key, 1)
        ui.write(e.EV_KEY, key, 0)
    else:
        ui.write(e.EV_KEY, key, 1)
    ui.syn()

  # key press callback
  def KeyPressCallback(self, key, duration):
    if not duration == 0:
        return
    print("[key pressed mohan] " + str(key))
    print(key)

    if key == cec.CEC_USER_CONTROL_CODE_UP:
        print("UP")
        self.sendKey(e.KEY_UP)

    elif key == cec.CEC_USER_CONTROL_CODE_DOWN:
        print("DOWN")
        self.sendKey(e.KEY_DOWN)

    elif key == cec.CEC_USER_CONTROL_CODE_LEFT:
         print("LEFT")
         self.sendKey(e.KEY_LEFT)

    elif key == cec.CEC_USER_CONTROL_CODE_RIGHT:
         print("RIGHT")
         self.sendKey(e.KEY_RIGHT)
    elif key == cec.CEC_USER_CONTROL_CODE_EXIT:
         print("EXIT")
         self.sendKey(e.KEY_EXIT)

    elif key == cec.CEC_USER_CONTROL_CODE_PLAY:
        print("PLAY")
        self.sendKey(e.KEY_PLAY)

    elif key == cec.CEC_USER_CONTROL_CODE_SELECT:
        print("OK")
        self.sendKey(e.KEY_ENTER)

    elif key == cec.CEC_USER_CONTROL_CODE_ROOT_MENU:
        print("ROOT MENU")

    elif key == cec.CEC_USER_CONTROL_CODE_TOP_MENU:
        print("TOP MENU")

    elif key == cec.CEC_USER_CONTROL_CODE_CHANNEL_UP:
        print("CHANNEL UP")
        self.sendKey(e.KEY_CHANNELUP)

    elif key == cec.CEC_USER_CONTROL_CODE_CHANNEL_DOWN:
        print("CHANNEL DOWN")
        self.sendKey(e.KEY_CHANNELDOWN)

    elif key == cec.CEC_USER_CONTROL_CODE_SETUP_MENU:
        print("SETUP MENU")

    elif key == cec.CEC_USER_CONTROL_CODE_DISPLAY_INFORMATION:
        print("INFO")

    elif key == cec.CEC_USER_CONTROL_CODE_ELECTRONIC_PROGRAM_GUIDE:
        print("GUIDE")
    
    elif key == cec.CEC_USER_CONTROL_CODE_F2_RED:
        print("RED")
        self.sendKey(e.KEY_PROG1)

    elif key == cec.CEC_USER_CONTROL_CODE_F3_GREEN:
        print("GREEN")
        self.sendKey(e.KEY_GREEN)

    elif key == cec.CEC_USER_CONTROL_CODE_F4_YELLOW:
        print("YELLOW")
        self.sendKey(e.KEY_YELLOW)

    elif key == cec.CEC_USER_CONTROL_CODE_F1_BLUE:
        print("BLUE")
        self.sendKey(e.KEY_BLUE)


    return 0

  # command received callback
  def CommandCallback(self, cmd):
    #print("[command received] " + cmd)
    return 0

# initialise libCEC 
  def InitLibCec(self):
    self.lib = cec.ICECAdapter.Create(self.cecconfig)
    # print libCEC version and compilation information
    print("libCEC version " + self.lib.VersionToString(self.cecconfig.serverVersion) + " loaded: " + self.lib.GetLibInfo())

    # search for adapters
    #adapter = self.DetectAdapter()
    adapters = self.lib.DetectAdapters()
    adapter = adapters[0].strComName
    if adapter == None:
        print("No adapters found")
    else:
        if self.lib.Open(adapter):
            print("connection opened")
            while True:
                pass
        else:
            print("failed to open a connection to the CEC adapter")




# logging callback
def log_callback(level, time, message):
  return lib.LogCallback(level, time, message)

# key press callback
def key_press_callback(key, duration):
  return lib.KeyPressCallback(key, duration)

# command callback
def command_callback(cmd):
  return lib.CommandCallback(cmd)


if __name__ == '__main__':
  # initialise libCEC
  lib = pyCecClient()
  lib.SetLogCallback(log_callback)
  lib.SetKeyPressCallback(key_press_callback)
  lib.SetCommandCallback(command_callback)

  # initialise libCEC and enter the main loop
  lib.InitLibCec()



