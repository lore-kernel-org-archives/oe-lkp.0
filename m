Content-Type: multipart/mixed; boundary="===============5084707418273768171=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Thu, 06 Apr 2017 13:54:07 +0000
Message-ID: <070BEF4AC20468458C22969097656CD94BFB54A4@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <20170406062654.GN17682@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5084707418273768171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thursday, April 06, 2017 2:27 PM, Ye, Xiaolong wrote:
> On 04/06, Li, Aubrey wrote:
> >Hi Xiaolong,
> >
> >Thanks to report this. Several questions on my side:
> >(1) how to make a report between <linux-stable tree tag:4.8.8> and
> ><fast_idle tree HEAD>
> =

> You can queue the same job for linux-stable tree tag:4.8.8 and fast_idle =
tree
> HEAD, then get the comparison by `compare` tool in inn server.
> =

Can you point me a documentation how to do this?
Or can you please show me the detailed steps?

> >
> >(2) Where can I get the raw data of the report
> =

> You can get detailed result root @
> =

> inn:/result/fio-basic/1SSD-btrfs-300s-8-randwrite-4k-sync-512g-performanc=
e/lkp
> -bdw-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/bb400b924e0
> 6e94eb12047621bd70d61564fca4c

This is really a confused report. =

What I want is the report of HEAD of the tree, not a commit id in the middl=
e of my
patchset.

> >
> >(3) I need to dig into the test machine bios to confirm if it's
> >compliant to my expected criteria, how to do that?
> >
> =

> The test machine is lkp-bdw-ep2, you may ssh into it to check?
> =


ssh is not good enough to me. I need to change the BIOS setting.
So I need KVM access (screen + keyboard) and root Privilege of that
machine.

Thanks,
-Aubrey

--===============5084707418273768171==--

