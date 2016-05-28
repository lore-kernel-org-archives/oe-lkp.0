Content-Type: multipart/mixed; boundary="===============7778943899046590545=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [i2c: dev] d6760b14d4: BUG: KASAN: slab-out-of-bounds in of_device_uevent at addr ffff8800091b4c49
Date: Sat, 28 May 2016 15:24:33 +0800
Message-ID: <20160528072433.GA1844@wfg-t540p.sh.intel.com>
In-Reply-To: <20160528071234.GA1714@katana>
List-Id: <oe-lkp.lists.linux.dev>

--===============7778943899046590545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 28, 2016 at 09:12:34AM +0200, Wolfram Sang wrote:
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> =

> So, I got a success message from buildbot "[wsa:i2c/for-next]
> 72a71f869c95dc11b73f09fe18c593d4a0618c3f BUILD SUCCESS".
> =

> I assume now that the above message covers only compile-testing while

That's right. "BUILD SUCCESS" only covers compile testing and static
checks.

> linus master tree also gets boot testing? Correct?

All branches will get boot testing. linus/master naturally receives
much more tests since all branches are eventually based on some Linus
commit.

> I was under the impression before that the above message also covers
> simple boot tests.

There will be simple boot tests quickly after the compile tests.
However boot tests typically need more time to be detected, bisected
and especially manual checked. We are yet to automate more boot error
reports.

Thanks,
Fengguang

--===============7778943899046590545==--

