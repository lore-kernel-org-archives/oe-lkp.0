Content-Type: multipart/mixed; boundary="===============4523093805948389612=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] fe1897eaa6: aim7.jobs-per-min -60.9% regression
Date: Tue, 14 Apr 2020 09:38:49 +0800
Message-ID: <20200414013849.GB49945@shbuild999.sh.intel.com>
In-Reply-To: <1c5007a1-26fe-650b-0a34-5b12f749b384@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4523093805948389612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 07:03:57PM +0800, Chao Yu wrote:
> On 2020/4/13 18:51, Feng Tang wrote:
> > On Sun, Dec 08, 2019 at 11:41:46PM +0800, kernel test robot wrote:
> >> Greeting,
> >>
> >> FYI, we noticed a -60.9% regression of aim7.jobs-per-min due to commit:
> >>
> >>
> >> commit: fe1897eaa6646f5a64a4cee0e6473ed9887d324b ("f2fs: fix to update=
 time in lazytime mode")
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >>
> >> in testcase: aim7
> >> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz =
with 64G memory
> >> with following parameters:
> >>
> >> 	disk: 4BRD_12G
> >> 	md: RAID1
> >> 	fs: f2fs
> >> 	test: sync_disk_rw
> >> 	load: 200
> >> 	cpufreq_governor: performance
> >> 	ucode: 0x42e
> >>
> >> test-description: AIM7 is a traditional UNIX system level benchmark su=
ite which is used to test and measure the performance of multiuser system.
> >> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
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
> >>         git clone https://github.com/intel/lkp-tests.git
> >>         cd lkp-tests
> >>         bin/lkp install job.yaml  # job file is attached in this email
> >>         bin/lkp run     job.yaml
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/te=
st/testcase/ucode:
> >>   gcc-7/performance/4BRD_12G/f2fs/x86_64-rhel-7.6/200/RAID1/debian-x86=
_64-2019-11-14.cgz/lkp-ivb-2ep1/sync_disk_rw/aim7/0x42e
> >>
> >> commit: =

> >>   b145b0eb20 (" ARM and x86 bugfixes of all kinds.  The most visible o=
ne is that migrating")
> >>   fe1897eaa6 ("f2fs: fix to update time in lazytime mode")
> >>
> >> b145b0eb2031a620 fe1897eaa6646f5a64a4cee0e64 =

> >> ---------------- --------------------------- =

> >>        fail:runs  %reproduction    fail:runs
> >>            |             |             |    =

> >>           1:4          -25%            :4     dmesg.WARNING:at#for_ip_=
interrupt_entry/0x
> >>          %stddev     %change         %stddev
> >>              \          |                \  =

> >>       1208           -60.9%     473.12        aim7.jobs-per-min
> > =

> > Hi Chao Yu,
> > =

> > Any thoughts on this? =

> > =

> > IIUC, this commit is a fix, and if you think it is necessary, we will
> > stop tracking this regresion.
> =

> Hi Feng Tang,
> =

> Sorry, I missed to reply this thread.
> =

> Anyway, we need this fix patch to avoid losing atime issue in some cases,
> let's stop tracking this regression please.
 =

Got it, thanks for confirming!

- Feng

> Thanks for noticing/reporting this regression. :)
> =

> Thanks,
--===============4523093805948389612==--

