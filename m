Content-Type: multipart/mixed; boundary="===============0114049773390748912=="
MIME-Version: 1.0
From: Ira Weiny <ira.weiny@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/highmem] 61b205f579: WARNING:at_mm/highmem.c:#__kmap_local_sched_out
Date: Thu, 11 Mar 2021 08:02:20 -0800
Message-ID: <20210311160220.GS3014244@iweiny-DESK2.sc.intel.com>
In-Reply-To: <BYAPR04MB496507720FEEF2B77FB639E186929@BYAPR04MB4965.namprd04.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0114049773390748912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 08:53:04PM +0000, Chaitanya Kulkarni wrote:
> Ira,
> =

> On 3/4/21 00:23, kernel test robot wrote:
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 61b205f579911a11f0b576f73275eca2aed0d108 ("mm/highmem: Convert =
memcpy_[to|from]_page() to kmap_local_page()")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> >
> > in testcase: trinity
> > version: trinity-static-i386-x86_64-f93256fb_2019-08-28
> > with following parameters:
> >
> > 	runtime: 300s
> >
> > test-description: Trinity is a linux system call fuzz tester.
> > test-url: http://codemonkey.org.uk/projects/trinity/
> >
> >
> > on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> Is the fix for this been posted yet ?

No.  I've been unable to reproduce it yet.

Ira

> =

> (asking since I didn't see the fix and my mailer is dropping emails from
>  lkml).
--===============0114049773390748912==--

