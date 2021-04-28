Content-Type: multipart/mixed; boundary="===============7664913916267320237=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] 21175ca434: mdadm-selftests.enchmarks/mdadm-selftests/tests/01r1fail.fail
Date: Wed, 28 Apr 2021 10:03:16 -0400
Message-ID: <YIlrJCdhVaFPdPgb@mit.edu>
In-Reply-To: <20210427081539.GF32408@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7664913916267320237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(Hmm, why did you cc linux-km on this report?  I would have thought
dm-devel would have made more sense?)

On Tue, Apr 27, 2021 at 04:15:39PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 21175ca434c5d49509b73cf473618b01b0b85437 ("ext4: make prefetch_bl=
ock_bitmaps default")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =


> in testcase: mdadm-selftests
> version: mdadm-selftests-x86_64-5d518de-1_20201008
> with following parameters:
> =

> 	disk: 1HDD
> 	test_prefix: 01r1
> 	ucode: 0x21

So this failure makes no sense to me.  Looking at the kmesg failure
logs, it's failing in the md layer:

kern  :info  : [   99.775514] md/raid1:md0: not clean -- starting backgroun=
d reconstruction
kern  :info  : [   99.783372] md/raid1:md0: active with 3 out of 4 mirrors
kern  :info  : [   99.789735] md0: detected capacity change from 0 to 37888
kern  :info  : [   99.796216] md: resync of RAID array md0
kern  :crit  : [   99.900450] md/raid1:md0: Disk failure on loop2, disablin=
g device.
                              md/raid1:md0: Operation continuing on 2 devic=
es.
kern  :crit  : [   99.918281] md/raid1:md0: Disk failure on loop1, disablin=
g device.
                              md/raid1:md0: Operation continuing on 1 devic=
es.
kern  :info  : [  100.835833] md: md0: resync interrupted.
kern  :info  : [  101.852898] md: resync of RAID array md0
kern  :info  : [  101.858347] md: md0: resync done.
user  :notice: [  102.109684] /lkp/benchmarks/mdadm-selftests/tests/01r1fai=
l... FAILED - see /var/tmp/01r1fail.log and /var/tmp/fail01r1fail.log for d=
etails

The referenced commit just turns block bitmap prefetching in ext4.
This should not cause md to failure; if so, that's an md bug, not an
ext4 bug.  There should not be anything that the file system is doing
that would cause the kernel to think there is a disk failure.

By the way, the reproduction instructions aren't working currently:

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install                job.yaml  # job file is attached i=
n this email

This fails because lkp is trying to apply a patch which does not apply
with the current version of the md tools.

>         bin/lkp split-job --compatible job.yaml
>         bin/lkp run                    compatible-job.yaml

And the current versions lkp don't generate a compatible-job.yaml file
when you run "lkp split-job --compatable"; instead it generates a new
yaml file with a set of random characters to generate a unique name.
(What Multics parlance would be called a "shriek name"[1] :-)

Since I was having trouble running the reproduction; could you send
the /var/tmp/*fail.logs so we could have a bit more insight what is
going on?

Thanks!

					- Ted

--===============7664913916267320237==--

