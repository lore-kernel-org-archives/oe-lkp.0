Content-Type: multipart/mixed; boundary="===============4288964873903683477=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 87eaceb3fa: stress-ng.madvise.ops_per_sec -19.6% regression
Date: Sun, 03 Nov 2019 02:31:32 +0000
Message-ID: <20191103022826.GA54034@shbuild999.sh.intel.com>
In-Reply-To: <23762632-2b5a-80fa-815f-1a8c58c5bb74@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4288964873903683477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2019 at 01:04:36AM +0800, Yang Shi wrote:
> =

> =

> On 11/1/19 2:41 AM, Feng Tang wrote:
> > Hi Yang,
> >
> > On Mon, Sep 30, 2019 at 04:46:05PM +0800, kernel test robot wrote:
> >> Greeting,
> >>
> >> FYI, we noticed a -19.6% regression of stress-ng.madvise.ops_per_sec d=
ue to commit:
> >>
> >>
> >> commit: 87eaceb3faa59b9b4d940ec9554ce251325d83fe ("mm: thp: make defer=
red split shrinker memcg aware")
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >>
> >> in testcase: stress-ng
> >> on test machine: 72 threads Intel(R) Xeon(R) Gold 6140 CPU @ 2.30GHz w=
ith 192G memory
> >> with following parameters:
> >>
> >> 	nr_threads: 100%
> >> 	disk: 1HDD
> >> 	testtime: 1s
> >> 	class: vm
> >> 	ucode: 0x200005e
> >> 	cpufreq_governor: performance
> >>
> >>
> >>
> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kernel test robot <rong.a.chen@intel.com>
> >>
> >>
> >> Details are as below:
> >> ----------------------------------------------------------------------=
---------------------------->
> >>
> >>
> >> To reproduce:
> >>
> >>          git clone https://github.com/intel/lkp-tests.git
> >>          cd lkp-tests
> >>          bin/lkp install job.yaml  # job file is attached in this email
> >>          bin/lkp run     job.yaml
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox_gr=
oup/testcase/testtime/ucode:
> >>    vm/gcc-7/performance/1HDD/x86_64-rhel-7.6/100%/debian-x86_64-2019-0=
5-14.cgz/lkp-skl-2sp8/stress-ng/1s/0x200005e
> >>
> >> commit:
> >>    0a432dcbeb ("mm: shrinker: make shrinker not depend on memcg kmem")
> >>    87eaceb3fa ("mm: thp: make deferred split shrinker memcg aware")
> >>
> >> 0a432dcbeb32edcd 87eaceb3faa59b9b4d940ec9554
> >> ---------------- ---------------------------
> >>           %stddev     %change         %stddev
> >>               \          |                \
> >>        6457           -19.5%       5198        stress-ng.madvise.ops
> >>        6409           -19.6%       5154        stress-ng.madvise.ops_p=
er_sec
> > Do you have any clue on this?
> =

> I replied the email once I got this report, please see =

> https://lore.kernel.org/lkml/d30b1358-fb6b-2658-e675-ceff3bc465ab(a)linux=
.alibaba.com/
> =

> And, the potential fix had been posted to the mailing list, please see =

> https://lore.kernel.org/linux-mm/1569968203-64647-1-git-send-email-yang.s=
hi(a)linux.alibaba.com/
> =

> But, the review looks stalled, I will try to move it forward.

Great! Thanks for the update.

- Feng

> =

> >
> > Thanks,
> > Feng
> >
--===============4288964873903683477==--

