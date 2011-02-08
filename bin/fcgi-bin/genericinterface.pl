#!/usr/bin/perl -w
# --
# bin/fcgi-bin/genericinterface.pl - the global FastCGI generic interface handle file
# Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
# --
# $Id: genericinterface.pl,v 1.2 2011-02-08 15:21:08 martin Exp $
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU AFFERO General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

# use ../../ as lib location
use FindBin qw($Bin);
use lib "$Bin/../..";
use lib "$Bin/../../Kernel/cpan-lib";

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

# Imports the library; required line
use CGI::Fast;

# load agent web interface
use Kernel::GenericInterface::Provider();

#my $Cnt = 0;

# Response loop
while ( my $WebRequest = new CGI::Fast ) {

    # create new object
    my $Provider = Kernel::GenericInterface::Provider->new( WebRequest => $WebRequest );

    # execute object
    $Provider->Run();

    #    $Cnt++;
    #    print STDERR "This is connection number $Cnt\n";
}
