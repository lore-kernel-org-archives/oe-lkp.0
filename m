Content-Type: multipart/mixed; boundary="===============1062320933558722312=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@suse.com>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [lib] 0c5a9920fb: WARNING:at_lib/test_linktables/test-linktables.c:#test_linktable_init
Date: Thu, 05 Jan 2017 16:53:58 +0100
Message-ID: <20170105155358.GS13946@wotan.suse.de>
In-Reply-To: <20170104203606.GQ13946@wotan.suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1062320933558722312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2017 at 09:36:06PM +0100, Luis R. Rodriguez wrote:
> This seems to rely on klibc and klibc does not compile on the latest
> kernels.

My mistake, user error --  I was using:

make KLIBCKERNELSRC=3D/home/mcgrof/linux-next/

instead of:

make KLIBCKERNELSRC=3D/home/mcgrof/linux-next/usr

The klibc patch can be ignored of course then. This compiles fine
now :)

  Luis

--===============1062320933558722312==--

