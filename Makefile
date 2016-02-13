ARCHS = armv7 arm64
GO_EASY_ON_ME=1
include theos/makefiles/common.mk

BUNDLE_NAME = ClearBadgeFlipSwitch
ClearBadgeFlipSwitch_FILES = Switch.x
ClearBadgeFlipSwitch_FRAMEWORKS = UIKit
ClearBadgeFlipSwitch_LIBRARIES = flipswitch
ClearBadgeFlipSwitch_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk