include $(TOPDIR)/rules.mk

PKG_NAME:=dogcom
PKG_VERSION=v1.6.0
PKG_RELEASE:=1

PKG_MAINTAINER:=fuyumi <280604399@qq.com>
PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mchome/dogcom.git
PKG_SOURCE_VERSION:=5237c3a45770cadbe2fa90ef9007bbd1de592d3a

PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dogcom
	SECTION:=net
	CATEGORY:=Network
	TITLE:=dogcom for OpenWRT
	URL:=https://github.com/mchome/dogcom
endef

define Package/dogcom/description
	dogcom is drcom-generic implementation in C.
endef

MAKE_FLAGS += \
	-C $(PKG_BUILD_DIR)

define Package/dogcom/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dogcom $(1)/usr/bin/dogcom
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) ./files/dogcom.conf $(1)/etc/dogcom.conf
endef

$(eval $(call BuildPackage,dogcom))
