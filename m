Content-Type: multipart/mixed; boundary="===============0926004962609564769=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/highmem] 61b205f579: WARNING:at_mm/highmem.c:#__kmap_local_sched_out
Date: Fri, 12 Mar 2021 14:27:55 +0800
Message-ID: <20210312062755.GA5022@xsang-OptiPlex-9020>
In-Reply-To: <20210311160220.GS3014244@iweiny-DESK2.sc.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0926004962609564769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ira,

On Thu, Mar 11, 2021 at 08:02:20AM -0800, Ira Weiny wrote:
> On Tue, Mar 09, 2021 at 08:53:04PM +0000, Chaitanya Kulkarni wrote:
> > Ira,
> > =

> > On 3/4/21 00:23, kernel test robot wrote:
> > > Greeting,
> > >
> > > FYI, we noticed the following commit (built with gcc-9):
> > >
> > > commit: 61b205f579911a11f0b576f73275eca2aed0d108 ("mm/highmem: Conver=
t memcpy_[to|from]_page() to kmap_local_page()")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > >
> > >
> > > in testcase: trinity
> > > version: trinity-static-i386-x86_64-f93256fb_2019-08-28
> > > with following parameters:
> > >
> > > 	runtime: 300s
> > >
> > > test-description: Trinity is a linux system call fuzz tester.
> > > test-url: http://codemonkey.org.uk/projects/trinity/
> > >
> > >
> > > on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2=
 -m 8G
> > >
> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > =

> > Is the fix for this been posted yet ?
> =

> No.  I've been unable to reproduce it yet.

just FYI
the issue does not always happen but the rate on 61b205f579 is not low,
while we didn't observe it happen on parent commit.

bb90d4bc7b6a536b 61b205f579911a11f0b576f7327
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :38          16%           6:38    dmesg.EIP:__kmap_local_sched_=
in
           :38          16%           6:38    dmesg.EIP:__kmap_local_sched_=
out
           :38          16%           6:38    dmesg.WARNING:at_mm/highmem.c=
:#__kmap_local_sched_in
           :38          16%           6:38    dmesg.WARNING:at_mm/highmem.c=
:#__kmap_local_sched_out

also please permit me to quote our internal analysis by Zhengjun (cced)
(Thanks a lot, Zhengjun)

"the commit has the potential to cause the issue.
It replaces " kmap_atomic" to " kmap_local_page".

Most of the two API is the same, except for " kmap_atomic" disable preempti=
on and cannot sleep.
I check the issue happened when there is a preemption,  in FBC " kmap_local=
_page",
the  preemption is enabled,  the issue may happen."
"

> =

> Ira
> =

> > =

> > (asking since I didn't see the fix and my mailer is dropping emails from
> >  lkml).
--===============0926004962609564769==--

