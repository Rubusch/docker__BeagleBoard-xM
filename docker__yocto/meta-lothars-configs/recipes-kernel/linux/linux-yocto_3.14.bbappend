## append patches and configs to the altera 4.17 long term support (LTSI) Kernel
## save a defconfig via: $ make savedefconfig
##
#FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
#SRC_URI += "file://defconfig"