Content-Type: multipart/mixed; boundary="===============5374090044488641783=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [rcuwalk] e2a728c2785: -29.4% aim7.2000.jobs-per-min, +71% turbostat.Pkg_W
Date: Sat, 22 Mar 2014 13:54:12 +0000
Message-ID: <20140322135412.GF18016@ZenIV.linux.org.uk>
In-Reply-To: <20140322115636.GA14400@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5374090044488641783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2014 at 07:56:36PM +0800, Fengguang Wu wrote:
> Hi Al,
> =

> We noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git untested-mnt_h=
ash
> commit e2a728c2785d6aab45d1a6d2c61e986d385c30bf ("rcuwalk: recheck mount_=
lock after mountpoint crossing attempts")

*doh*

Sorry about that - what happens is that __follow_mount_rcu() does that
check every time it's called, not on every negative lookup from
__lookup_mnt().  IOW, it's a massive overkill - most of the time
we don't call __lookup_mnt() at all, due to d_mountpoint() being false,
or get a positive from it.

Fixed and force-pushed; should get much better now...

--===============5374090044488641783==--

