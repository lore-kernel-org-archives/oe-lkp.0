Content-Type: multipart/mixed; boundary="===============0126856618603700043=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [genetlink] WARNING: CPU: 0 PID: 804 at net/netlink/genetlink.c:1037 genl_unbind+0xc0/0xd0()
Date: Mon, 09 Feb 2015 16:31:47 +0800
Message-ID: <1423470707.5968.69.camel@intel.com>
In-Reply-To: <1423469239.5968.64.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0126856618603700043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I found the test summary table for the test, just FYI.

+---------------------------------------------------+------------+---------=
---+
|                                                   | f555f3d76a | 5ad63005=
24 |
+---------------------------------------------------+------------+---------=
---+
| boot_successes                                    | 10         | 21      =
   |
| boot_failures                                     | 36         | 25      =
   |
| WARNING:at_net/netlink/genetlink.c:#genl_unbind() | 36         | 3       =
   |
+---------------------------------------------------+------------+---------=
---+

Best Regards,
Huang, Ying

On Mon, 2015-02-09 at 16:07 +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> commit 5ad6300524c0332ac67e912c20d6e5cf262ba58f ("genetlink: disallow sub=
scribing to unknown mcast groups")
> =

> Although the frequency decreased a lot, from 100% to about 8.33%, we stil=
l find the warning in dmesg after applying the commit.
> =

> [  299.872857] ------------[ cut here ]------------
> [  300.039960] WARNING: CPU: 0 PID: 804 at net/netlink/genetlink.c:1037 g=
enl_unbind+0xc0/0xd0()
> [  300.360780] CPU: 0 PID: 804 Comm: trinity-main Not tainted 3.19.0-rc4-=
00160-g5ad6300 #11
> [  300.360783] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [  300.360793]  ffffffff823ad820 ffff88001556be68 ffffffff81d86b84 000000=
0000000065
> [  300.360795]  0000000000000000 ffff88001556bea8 ffffffff810c2f30 ffffff=
ff82635dc0
> [  300.360796]  0000000000000000 ffffffff82635dc0 0000000000000001 ffffff=
ff836d7000
> [  300.360799] Call Trace:
> [  300.361185]  [<ffffffff81d86b84>] dump_stack+0x4f/0x7b
> [  300.361254]  [<ffffffff810c2f30>] warn_slowpath_common+0x80/0xc0
> [  300.361256]  [<ffffffff810c3035>] warn_slowpath_null+0x15/0x20
> [  300.361270]  [<ffffffff81d7a250>] genl_unbind+0xc0/0xd0
> [  300.361272]  [<ffffffff81d7782b>] netlink_setsockopt+0x24b/0x270
> [  300.361279]  [<ffffffff81d3d3be>] SyS_setsockopt+0x5e/0xc0
> [  300.361285]  [<ffffffff81d95f29>] system_call_fastpath+0x12/0x17
> [  300.361296] ---[ end trace 5d4dac2c7bb8ca45 ]---
> =

> Thanks,
> Huang, Ying
> =

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com



--===============0126856618603700043==--

