Content-Type: multipart/mixed; boundary="===============1778477631347888936=="
MIME-Version: 1.0
From: Jonathan Derrick <jonathan.derrick@linux.dev>
To: lkp@lists.01.org
Subject: Re: [md/bitmap] 935dbb156b: mdadm-selftests.05r1-bitmapfile.fail
Date: Mon, 17 Oct 2022 16:58:39 -0600
Message-ID: <8fc1f232-9330-859f-4480-dd9a27b8bd15@linux.dev>
In-Reply-To: <202210101104.c8df42d2-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1778477631347888936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think some of these are invalid, see below

On 10/9/2022 10:32 PM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 935dbb156b7a46615c0c4819ded5f5ef14bf9b99 ("[PATCH 1/2] md/bitmap:=
 Move unplug to daemon thread")
> url: https://github.com/intel-lab-lkp/linux/commits/Jonathan-Derrick/Bitm=
ap-percentage-flushing/20221007-061054
> base: git://git.kernel.org/cgit/linux/kernel/git/song/md.git md-next
> patch link: https://lore.kernel.org/linux-raid/20221006220840.275-3-jonat=
han.derrick(a)linux.dev
> =

> in testcase: mdadm-selftests
> version: mdadm-selftests-x86_64-5f41845-1_20220826
> with following parameters:
> =

> 	disk: 1HDD
> 	test_prefix: 05
> =

> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.7=
0GHz (Haswell) with 16G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> 2022-10-10 02:47:33 mkdir -p /var/tmp
> 2022-10-10 02:47:33 mke2fs -t ext3 -b 4096 -J size=3D4 -q /dev/sda1
> 2022-10-10 02:48:06 mount -t ext3 /dev/sda1 /var/tmp
> sed -e 's/{DEFAULT_METADATA}/1.2/g' \
> -e 's,{MAP_PATH},/run/mdadm/map,g'  mdadm.8.in > mdadm.8
> /usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
> /usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
> /usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
> /usr/bin/install -D -m 644 mdadm.conf.5 /usr/share/man/man5/mdadm.conf.5
> /usr/bin/install -D -m 644 udev-md-raid-creating.rules /lib/udev/rules.d/=
01-md-raid-creating.rules
> /usr/bin/install -D -m 644 udev-md-raid-arrays.rules /lib/udev/rules.d/63=
-md-raid-arrays.rules
> /usr/bin/install -D -m 644 udev-md-raid-assembly.rules /lib/udev/rules.d/=
64-md-raid-assembly.rules
> /usr/bin/install -D -m 644 udev-md-clustered-confirm-device.rules /lib/ud=
ev/rules.d/69-md-clustered-confirm-device.rules
> /usr/bin/install -D  -m 755 mdadm /sbin/mdadm
> /usr/bin/install -D  -m 755 mdmon /sbin/mdmon
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-add-internalbitmap... succeeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-add-internalbitmap-v1a... succ=
eeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-add-internalbitmap-v1b... succ=
eeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-add-internalbitmap-v1c... succ=
eeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-bitmapfile... FAILED - see /va=
r/tmp/05r1-bitmapfile.log and /var/tmp/fail05r1-bitmapfile.log for details

This one in particular is designed to set failure if 0 bits are dirty after=
 a resync, followed by testdev.
Running this on a vanilla kernel results in below failure:
+++ mdadm -X /var/tmp/bitmap
+++ rm -f /var/tmp/stderr
+++ sed -n -e 's/.*Bitmap.* \([0-9]*\) dirty.*/\1/p'
+++ case $* in
+++ case $* in
+++ /home/nodlab/mdadm/mdadm --quiet -X /var/tmp/bitmap
+++ rv=3D0
+++ case $* in
+++ cat /var/tmp/stderr
+++ return 0
++ dirty2=3D0
++ '[' 0 -lt 400 -o 0 -ne 0 ']'
++ echo 'ERROR bad '\''dirty'\'' counts: 0 and 0'
ERROR bad 'dirty' counts: 0 and 0


Where the exit check is:
mdadm --assemble $md0 --bitmap=3D$bmf $dev1 $dev2
testdev $md0 1 $mdsize1a 64
dirty1=3D`mdadm -X $bmf | sed -n -e 's/.*Bitmap.* \([0-9]*\) dirty.*/\1/p'`
sleep 4
dirty2=3D`mdadm -X $bmf | sed -n -e 's/.*Bitmap.* \([0-9]*\) dirty.*/\1/p'`

if [ $dirty1 -lt 400 -o $dirty2 -ne 0 ]
then  echo >&2 "ERROR bad 'dirty' counts: $dirty1 and $dirty2"
  exit 1


Seems like if 'testdev()' is quick enough, $dirty1 could be < 400


> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-failfast... succeeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-grow-external... FAILED - see =
/var/tmp/05r1-grow-external.log and /var/tmp/fail05r1-grow-external.log for=
 details
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-grow-internal... FAILED - see =
/var/tmp/05r1-grow-internal.log and /var/tmp/fail05r1-grow-internal.log for=
 details
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-grow-internal-1... FAILED - se=
e /var/tmp/05r1-grow-internal-1.log and /var/tmp/fail05r1-grow-internal-1.l=
og for details
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-internalbitmap... FAILED - see=
 /var/tmp/05r1-internalbitmap.log and /var/tmp/fail05r1-internalbitmap.log =
for details
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-internalbitmap-v1a... FAILED -=
 see /var/tmp/05r1-internalbitmap-v1a.log and /var/tmp/fail05r1-internalbit=
map-v1a.log for details
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-internalbitmap-v1b... FAILED -=
 see /var/tmp/05r1-internalbitmap-v1b.log and /var/tmp/fail05r1-internalbit=
map-v1b.log for details
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-internalbitmap-v1c... FAILED -=
 see /var/tmp/05r1-internalbitmap-v1c.log and /var/tmp/fail05r1-internalbit=
map-v1c.log for details
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-n3-bitmapfile... FAILED - see =
/var/tmp/05r1-n3-bitmapfile.log and /var/tmp/fail05r1-n3-bitmapfile.log for=
 details
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-re-add... succeeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-re-add-nosuper... succeeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-remove-internalbitmap... succe=
eded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-remove-internalbitmap-v1a... s=
ucceeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-remove-internalbitmap-v1b... s=
ucceeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r1-remove-internalbitmap-v1c... s=
ucceeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r5-bitmapfile... succeeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r5-internalbitmap... succeeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r6-bitmapfile... succeeded
> Testing on linux-6.0.0-rc2-00101-g935dbb156b7a kernel
> /lkp/benchmarks/mdadm-selftests/tests/05r6tor0... =

> 	ERROR: dmesg prints errors when testing 05r6tor0! =

> =

> FAILED - see /var/tmp/05r6tor0.log and /var/tmp/fail05r6tor0.log for deta=
ils
> =

> =

> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/r/202210101104.c8df42d2-yujie.liu(a)intel=
.com
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

>=20
--===============1778477631347888936==--

