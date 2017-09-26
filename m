Content-Type: multipart/mixed; boundary="===============7855857206540310549=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/topology] 05aa90edc7: kernel_BUG_at_arch/x86/kernel/cpu/common.c
Date: Tue, 26 Sep 2017 15:53:27 +0800
Message-ID: <20170926075327.GH5791@yexl-desktop>
In-Reply-To: <20f9eceb-db6f-3386-0f71-3a0f6a1cf0a1@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7855857206540310549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/13, Prarit Bhargava wrote:
>I'm willing to debug but I can't get lkp to work on any system.
>
># bin/lkp qemu -k /home/linux/vmlinux job-script
>make: Entering directory `/root/lkp-tests/bin/event'
>gcc    -c -o wakeup.o wakeup.c
>gcc   -o wakeup wakeup.o
>rm -f wakeup.o
>strip wakeup
>make: Leaving directory `/root/lkp-tests/bin/event'
>cpio: root:lkp: invalid group
>cpio: root:lkp: invalid group
>cpio: root:lkp: invalid group
>gzip: /root/.lkp/cache/lkp-x86_64.cpio: No such file or directory
>mv: cannot stat =E2=80=98/root/.lkp/cache/lkp-x86_64.cpio.gz=E2=80=99: No =
such file or directory
>mv: cannot stat =E2=80=98/root/.lkp/cache/lkp-x86_64.cgz=E2=80=99: No such=
 file or directory
>result_root:
>/root/.lkp//result/pm-qa/cpuidle/vm-lkp-nex04-8G/debian-x86_64-2016-08-31.=
cgz/x86_64-allyesdebian/gcc-6/05aa90edc7910ec3d1ed791fa77371b3acb9bf08/2
>downloading initrds ...
>/usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretry =
1000
>--tries 1000
>https://github.com/0day-ci/lkp-qemu/raw/master/osimage/debian/debian-x86_6=
4-2016-08-31.cgz
>-N -P /root/.lkp/cache/osimage/debian
>/usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretry =
1000
>--tries 1000
>https://github.com/0day-ci/lkp-qemu/raw/master/osimage/deps/debian-x86_64-=
2016-08-31.cgz/lkp_2017-08-01.cgz
>-N -P /root/.lkp/cache/osimage/deps/debian-x86_64-2016-08-31.cgz
>Failed to download osimage/deps/debian-x86_64-2016-08-31.cgz/lkp_2017-08-0=
1.cgz
>

Sorry for the late, now we've uploaded the missing files to github.

Thanks,
Xiaolong

>Based on the qemu options above I manually created a guest that does
>
>-smp 2,sockets=3D2,cores=3D1,threads=3D1
>
>and don't see a problem.  I also tried some other configs and also don't s=
ee a
>problem.
>
>Suggestions from the lkp folks on reproducing welcomed,
>
>P.
>
>> =

>> =

>> Thanks,
>> lkp
>> =

>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============7855857206540310549==--

