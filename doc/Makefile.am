prefix = @prefix@
exec_prefix = @exec_prefix@
exec_suffix = @exec_suffix@
bindir = @bindir@
libexecdir = @libexecdir@
sysconfdir = @sysconfdir@
localstatedir = @localstatedir@

# Local to the etc Makefile
CONFS = ircd.conf.example reference.conf

install-mkdirs:
	-@if test ! -d "${DESTDIR}${sysconfdir}"; then \
		mkdir -p ${DESTDIR}${sysconfdir}; \
	fi

install: install-mkdirs
	@echo "Installing example config files (${CONFS})"

	@for i in ${CONFS}; do \
		if test -f ${DESTDIR}${sysconfdir}/$$i; then \
			${MV} ${DESTDIR}${sysconfdir}/$$i ${DESTDIR}${sysconfdir}/$$i.old; \
		fi; \
		${INSTALL_DATA} $$i ${DESTDIR}${sysconfdir}; \
	done

	-@if test ! -f "${DESTDIR}${sysconfdir}/ircd.motd"; then \
		echo "Installing motd file (ircd.motd)"; \
		${INSTALL_DATA} ircd.motd ${DESTDIR}${sysconfdir}; \
	fi

	-@if test -f "${DESTDIR}${sysconfdir}/links.txt"; then \
		${RM} ${DESTDIR}${sysconfdir}/links.txt; \
	fi
