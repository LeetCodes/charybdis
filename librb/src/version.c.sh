#!/bin/sh

package="librb"

echo "Extracting ${package}/src/version.c"

if test -r "version.c.last"; then
	generation=`sed -n 's/^const char \*'"${package}"'_generation = \"\(.*\)\";/\1/p' < version.c.last`
	if test ! "${generation}"; then
		generation="0"
	fi
else
	generation="0"
fi

generation=`expr "${generation}" + 1`

cat > version.c << !SUB!THIS!
/*
 *   $package: a library used by charybdis and other things
 *   version.c
 *
 *   Copyright (C) 1990 Chelsea Ashley Dyerman
 *   Copyright (C) 2008 ircd-ratbox development team
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2, or (at your option)
 *   any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

/*
 * This file is generated by version.c.sh. Any changes made will go away.
 */

#include "../include/serno.h"

const char *${package}_generation = "${generation}";
const char *${package}_serno = SERNO;
!SUB!THIS!
