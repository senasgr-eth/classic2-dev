package=fontconfig
$(package)_version=2.11.95
$(package)_download_path=http://www.freedesktop.org/software/fontconfig/release/
$(package)_file_name=$(package)-$($(package)_version).tar.bz2
$(package)_sha256_hash=7b165eee7aa22dcc1557db56f58d905b6a14b32f9701c79427452474375b4c89
$(package)_dependencies=freetype expat
$(package)_patches=char_width_prio.patch

define $(package)_set_vars
  $(package)_config_opts=--disable-docs --disable-static
endef

define $(package)_preprocess_cmds
  echo '#define PRI_CHAR_WIDTH_STRONG 9' >> src/fcmatch.c && \
  echo '#define PRI_CHAR_WIDTH_WEAK 2' >> src/fcmatch.c
endef

define $(package)_config_cmds
  $($(package)_autoconf)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
