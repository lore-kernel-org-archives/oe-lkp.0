Content-Type: multipart/mixed; boundary="===============7143686925868230026=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 289b7bfd48 BUG: KASAN: slab-out-of-bounds in of_device_uevent at addr ffff880012049289
Date: Tue, 28 Feb 2017 12:29:43 +0800
Message-ID: <20170228042943.zyt2oqqtwuheki5d@wfg-t540p.sh.intel.com>
In-Reply-To: <20170228042403.tl3d7v7iedqxoe4n@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7143686925868230026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 12:24:03PM +0800, Fengguang Wu wrote:
>Hi Linus Walleij,
>
>I'm not sure if this is a good bisect since the merged gpio branch
>suffers from another early hang problem which could hide the KASAN
>BUG. So also OF people are also included in the loop.
>
>The attached reproduce-* script may easily reproduce the bug.
>
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
>commit 289b7bfd483c8ca3dfde92d7e19a8b70e0b81248
>Merge: 183c948 9b8e3ec
>Author:     Linus Torvalds <torvalds@linux-foundation.org>
>AuthorDate: Sat Apr 9 13:28:50 2016 -0700
>Commit:     Linus Torvalds <torvalds@linux-foundation.org>
>CommitDate: Sat Apr 9 13:28:50 2016 -0700
>
>     Merge tag 'gpio-v4.6-3' of git://git.kernel.org/pub/scm/linux/kernel/=
git/linusw/linux-gpio

The below bisect log shows this old bug is still alive in mainline.
Not sure for linux-next because it now suffers from an early boot hang bug.

># extra tests on tree/branch linus/master
>git bisect  bad e5d56efc97f8240d0b5d66c03949382b6d7e5570  # 10:50      0- =
     3  Merge tag 'watchdog-for-linus-v4.11' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/groeck/linux-staging
># extra tests on tree/branch linux-next/master
>git bisect good 3e7350242c6f3d41d28e03418bd781cc1b7bad5f  # 01:04     60+ =
    72  Add linux-next specific files for 20170224

Thanks,
Fengguang

--===============7143686925868230026==--

