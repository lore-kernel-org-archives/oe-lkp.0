Content-Type: multipart/mixed; boundary="===============2594989211943337798=="
MIME-Version: 1.0
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [phy] kernel BUG at drivers/base/driver.c:153!
Date: Thu, 09 Jul 2015 11:12:08 +0300
Message-ID: <20150709081208.GA30554@kuha.fi.intel.com>
In-Reply-To: <559c0635./d2vMKAYuV88i4Ff%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2594989211943337798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2015 at 01:02:45AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 1c14905ef951fb968c8da90e4e64be02c309a2ae
> Author:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
> AuthorDate: Wed May 13 15:26:53 2015 +0300
> Commit:     Felipe Balbi <balbi@ti.com>
> CommitDate: Wed May 13 12:07:01 2015 -0500
> =

>     phy: add driver for TI TUSB1210 ULPI PHY
>     =

>     TUSB1210 ULPI PHY has vendor specific register for eye
>     diagram tuning. On some platforms the system firmware has
>     set optimized value to it. In order to not loose the
>     optimized value, the driver stores it during probe and
>     restores it every time the PHY is powered back on.
>     =

>     Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>     Acked-by: David Cohen <david.a.cohen@linux.intel.com>
>     Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
>     Signed-off-by: Felipe Balbi <balbi@ti.com>

This commit will fix the problem:
https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=3Dtest=
ing/next&id=3D6c97f002f678d5047bdf8a9e248dc50656c38ae2

I think we should consider it as a fix for this issue. Unfortunately
Felipe is on vacation at the moment. Greg, could help with this?

I will also be on vacation for the rest of the month and my access to
internet will be fairly limited.


Thanks,

-- =

heikki

--===============2594989211943337798==--

