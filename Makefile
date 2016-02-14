ARCHS = armv7 arm64
GO_EASY_ON_ME = 1
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
THEOS_DEVICE_IP = 192.168.0.12


BUNDLE_NAME = ClearBadge
ClearBadge_FILES = Switch.x
ClearBadge_FRAMEWORKS = UIKit
ClearBadge_LIBRARIES = flipswitch
ClearBadge_INSTALL_PATH = /Library/Switches

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk

before-package::
	sudo chown -R root:wheel $(THEOS_STAGING_DIR)
	sudo chmod -R 755 $(THEOS_STAGING_DIR)
	sudo chmod 644 $(THEOS_STAGING_DIR)/Library/Switches/ClearBadge.bundle/*

after-install::
	install.exec "killall -9 SpringBoard"
	make clean
	sudo rm -rf ./*.zip
	sudo mv _ $(THEOS_PACKAGE_NAME)_$(THEOS_PACKAGE_BASE_VERSION)_iphoneos-arm
	sudo rm -rf ./_
	zip -r $(THEOS_PACKAGE_NAME)_$(THEOS_PACKAGE_BASE_VERSION)_iphoneos-arm.zip ./$(THEOS_PACKAGE_NAME)_$(THEOS_PACKAGE_BASE_VERSION)_iphoneos-arm
	sudo rm -rf ./$(THEOS_PACKAGE_NAME)_$(THEOS_PACKAGE_BASE_VERSION)_iphoneos-arm
	rm -rf .obj
	rm -rf obj
#	rm -rf .theos
#	rm -rf *.deb