Content-Type: multipart/mixed; boundary="===============3833902544396499619=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [llc_ui_release] BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
Date: Sun, 29 Apr 2018 03:30:48 +0000
Message-ID: <CA+55aFzeCvwUw=yi5oDy2ouv7onkXDapgamJJ5AhjybyBH8UCw@mail.gmail.com>
In-Reply-To: <20180429021235.vibzosv34t264nbs@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3833902544396499619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 28, 2018 at 7:12 PM Fengguang Wu <fengguang.wu@intel.com> wro=
te:

> FYI this happens in mainline kernel 4.17.0-rc2.
> It looks like a new regression.

> It occurs in 5 out of 5 boots.

> [main] 375 sockets created based on info from socket cachefile.
> [main] Generating file descriptors
> [main] Added 83 filenames from /dev
> udevd[507]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv
platform:regulatory': No such file or directory
> [  372.057947] caif:caif_disconnect_client(): nothing to disconnect
> [  372.082415] BUG: unable to handle kernel NULL pointer dereference at
0000000000000004

I think this is fixed by commit 3a04ce7130a7 ("llc: fix NULL pointer deref
for SOCK_ZAPPED")

                Liunus

--===============3833902544396499619==--

