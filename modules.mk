mod_ward.la: mod_ward.slo
	$(SH_LINK) -rpath $(libexecdir) -module -avoid-version  mod_ward.lo
DISTCLEAN_TARGETS = modules.mk
shared =  mod_ward.la
