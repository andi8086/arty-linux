FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://platform-top.h file://bsp.cfg file://config.cfg"

do_configure:prepend () {
	install ${WORKDIR}/config.cfg ${S}/
}

do_configure:append () {
	install ${WORKDIR}/platform-top.h ${S}/include/configs/
}

do_configure:append:microblaze () {
	if [ "${U_BOOT_AUTO_CONFIG}" = "1" ]; then
		install ${WORKDIR}/platform-auto.h ${S}/include/configs/
		install -d ${B}/source/board/xilinx/microblaze-generic/
		install ${WORKDIR}/config.mk ${B}/source/board/xilinx/microblaze-generic/
	fi
}

