Content-Type: multipart/mixed; boundary="===============6983204939555064450=="
MIME-Version: 1.0
From: Alex Kogan <alex.kogan@oracle.com>
To: lkp@lists.01.org
Subject: Re: [locking/qspinlock] 0e8d8f4f12: stress-ng.zero.ops_per_sec -9.7% regression
Date: Wed, 10 Mar 2021 17:17:04 +0000
Message-ID: <
 <SA2PR10MB46525798D53C47B39F88ED5DF1919@SA2PR10MB4652.namprd10.prod.outlook.com>>
In-Reply-To: <20201228081601.GA31221@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6983204939555064450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Looks like my previous reply failed to reach the mailing list. Reposting =
again, after (hopefully)=C2=A0
fixing the problem with the included URL. Apologies if you have received th=
is message in
the past. ]

A quick update: there is a problem in running this test to reproduce the re=
gression, =

and Oliver Sang is aware of that.

Along with that, I wonder if this is a real issue or some noise in the meas=
urements.=C2=A0
This regression is reported with the =E2=80=9C--device" switch, which accor=
ding to
https://wiki.ubuntu.com/Kernel/Reference/stress-ng, enables "raw device dri=
ver stressors=E2=80=9D.
I wonder if it is relevant=C2=A0to the spin lock=C2=A0performance.

Any thoughts?

Also, using this opportunity, any further feedback on the patch would be gr=
eatly appreciated.

Thanks,
=E2=80=94 Alex



From: kernel test robot <oliver.sang@intel.com>
Sent: Monday, December 28, 2020 3:16 AM
To: Alex Kogan <alex.kogan@oracle.com>
Cc: 0day robot <lkp@intel.com>; Steven Sistare <steven.sistare@oracle.c=
om>; Waiman Long <longman@redhat.com>; LKML <linux-kernel@vger.kernel.o=
rg>; lkp(a)lists.01.org <lkp@lists.01.org>; ying.huang(a)intel.com <ying.=
huang@intel.com>; feng.tang(a)intel.com <feng.tang@intel.com>; zhengjun=
.xing(a)intel.com <zhengjun.xing@intel.com>; linux(a)armlinux.org.uk <lin=
ux@armlinux.org.uk>; peterz(a)infradead.org <peterz@infradead.org>; min=
go(a)redhat.com <mingo@redhat.com>; will.deacon(a)arm.com <will.deacon@=
arm.com>; arnd(a)arndb.de <arnd@arndb.de>; linux-arch(a)vger.kernel.org <=
linux-arch@vger.kernel.org>; linux-arm-kernel(a)lists.infradead.org <linu=
x-arm-kernel@lists.infradead.org>; tglx(a)linutronix.de <tglx@linutroni=
x.de>; bp(a)alien8.de <bp@alien8.de>; hpa(a)zytor.com <hpa@zytor.com>; =
x86(a)kernel.org <x86@kernel.org>; guohanjun(a)huawei.com <guohanjun@hu=
awei.com>; jglauber(a)marvell.com <jglauber@marvell.com>; Daniel Jordan <=
daniel.m.jordan@oracle.com>; Alex Kogan <alex.kogan@oracle.com>; Dave D=
ice <dave.dice@oracle.com>
Subject: [locking/qspinlock] 0e8d8f4f12: stress-ng.zero.ops_per_sec -9.7% r=
egression =

=C2=A0

Greeting,

FYI, we noticed a -9.7% regression of stress-ng.zero.ops_per_sec due to com=
mit:


commit: 0e8d8f4f1214cfbac219d6917b5f6460f818bb7c ("[PATCH v13 3/6] locking/=
qspinlock: Introduce CNA into the slow path of qspinlock")
url: https://urldefense.com/v3/__https://github.com/0day-ci/linux/commits/A=
lex-Kogan/Add-NUMA-awareness-to-qspinlock/20201223-135025__;!!GqivPVa7Brio!=
LF1Vhc6eU7n1kxGSlPpI_wS0LmREqgH6k1226e4w8C7ug0i7368nCfIT44_wbu1g$ =

base: https://urldefense.com/v3/__https://git.kernel.org/cgit/linux/kernel/=
git/tip/tip.git__;!!GqivPVa7Brio!LF1Vhc6eU7n1kxGSlPpI_wS0LmREqgH6k1226e4w8C=
7ug0i7368nCfIT42aMeOW1$=C2=A0 cb262935a166bdef0ccfe6e2adffa00c0f2d038a

in testcase: stress-ng
on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz with =
112G memory
with following parameters:

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr_threads: 100%
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disk: 1HDD
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 testtime: 30s
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 class: device
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpufreq_governor: performance
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ucode: 0x42e


In addition to that, the commit also has significant impact on the followin=
g tests:

+------------------+-------------------------------------------------------=
--------------------+
| testcase: change | fsmark: fsmark.files_per_sec 213.9% improvement=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
| test machine=C2=A0=C2=A0=C2=A0=C2=A0 | 192 threads Intel(R) Xeon(R) Plati=
num 9242 CPU @ 2.30GHz with 192G memory |
| test parameters=C2=A0 | cpufreq_governor=3Dperformance=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | disk=3D1BRD_48G=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | filesize=3D4M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | fs=3Dbtrfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | iterations=3D1x=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | nr_threads=3D64t=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | sync_method=3DNoSync=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | test_size=3D24G=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ucode=3D0x5003003=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
+------------------+-------------------------------------------------------=
--------------------+
| testcase: change | reaim: reaim.jobs_per_min 96.1% improvement=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
| test machine=C2=A0=C2=A0=C2=A0=C2=A0 | 192 threads Intel(R) Xeon(R) Plati=
num 9242 CPU @ 2.30GHz with 192G memory |
| test parameters=C2=A0 | cpufreq_governor=3Dperformance=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | nr_task=3D100%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | runtime=3D300s=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | test=3Dnew_fserver=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ucode=3D0x5003003=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
+------------------+-------------------------------------------------------=
--------------------+


If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


Details are as below:
---------------------------------------------------------------------------=
----------------------->


To reproduce:

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://urldefense.com=
/v3/__https://github.com/intel/lkp-tests.git__;!!GqivPVa7Brio!LF1Vhc6eU7n1k=
xGSlPpI_wS0LmREqgH6k1226e4w8C7ug0i7368nCfIT4ySp2S6I$ =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install job.yaml=C2=A0 #=
 job file is attached in this email
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=A0=C2=A0=C2=A0=C2=
=A0 job.yaml

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox_group/t=
estcase/testtime/ucode:
=C2=A0 device/gcc-9/performance/1HDD/x86_64-rhel-8.3/100%/debian-10.4-x86_6=
4-20200603.cgz/lkp-ivb-2ep1/stress-ng/30s/0x42e

commit: =

=C2=A0 cb45bab007 ("locking/qspinlock: Refactor the qspinlock slow path")
=C2=A0 0e8d8f4f12 ("locking/qspinlock: Introduce CNA into the slow path of =
qspinlock")

cb45bab007ff0cfc 0e8d8f4f1214cfbac219d6917b5 =

---------------- --------------------------- =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=C2=A0=C2=
=A0=C2=A0 fail:runs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :4=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:4=C2=A0=C2=A0=C2=A0=C2=A0 last_st=
ate.is_incomplete_run
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :4=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:4=C2=A0=C2=A0=C2=A0=C2=A0 dmesg.K=
ernel_panic-not_syncing:softlockup:hung_tasks
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :4=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:4=C2=A0=C2=A0=C2=A0=C2=A0 dmesg.R=
IP:smp_call_function_many_cond
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :4=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:4=C2=A0=C2=A0=C2=A0=C2=A0 dmesg.R=
IP:smp_call_function_single
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0 =

=C2=A0=C2=A0=C2=A0 481980 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -12.0%=C2=
=A0=C2=A0=C2=A0=C2=A0 424197 =C2=B1=C2=A0 5%=C2=A0 stress-ng.time.involunta=
ry_context_switches
=C2=A01.198e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -4.0%=C2=A0=C2=A0 1.15e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 stress-ng.time.minor_page_faults
=C2=A0=C2=A0=C2=A0 689.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -4.9%=C2=A0=C2=A0=C2=A0=C2=A0 655.29=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.time.user_time
=C2=A0 10626516=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -9.7%=C2=A0=C2=A0=C2=A0 9598124=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 stress-ng.zero.ops
=C2=A0=C2=A0=C2=A0 354216=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -9.7%=C2=A0=C2=A0=C2=A0=C2=A0 319937=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.zero.ops_per_sec
=C2=A0=C2=A0=C2=A0=C2=A0 12871=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +19.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15424 =C2=B1 12%=C2=A0=
 meminfo.max_used_kB
=C2=A0=C2=A0=C2=A0=C2=A0 29.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +4.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.33=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstat.cpu.id
=C2=A0=C2=A0=C2=A0=C2=A0 29.66=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +3.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.75 =C2=B1=C2=
=A0 2%=C2=A0 iostat.cpu.idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.59 =
=C2=B1=C2=A0 2%=C2=A0 iostat.cpu.user
=C2=A0=C2=A0=C2=A0=C2=A0 67636 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -21.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 53263 =C2=B1 14%=C2=A0 sched_debug.cpu.nr_switc=
hes.max
=C2=A0=C2=A0=C2=A0=C2=A0 70.29 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -22.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 54.73 =C2=B1 14%=C2=A0 sched_debug.cpu.nr_unint=
erruptible.stddev
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7841 =C2=B1 58%=C2=A0=C2=A0=C2=A0 +418.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 40676 =C2=B1=C2=A0 2%=C2=A0 numa-meminfo.node0.=
Active
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6226 =C2=B1 71%=C2=A0=C2=A0=C2=A0 +542.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 40001=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 numa-meminfo.node0.Active(anon)
=C2=A0=C2=A0=C2=A0=C2=A0 15043 =C2=B1 32%=C2=A0=C2=A0=C2=A0 +271.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 55899=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nu=
ma-meminfo.node0.Shmem
=C2=A0=C2=A0=C2=A0=C2=A0 77673 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -50.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38874 =C2=B1=C2=A0 9%=C2=A0 numa-meminfo.n=
ode1.Active
=C2=A0=C2=A0=C2=A0=C2=A0 77439 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -51.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37925 =C2=B1=C2=A0 8%=C2=A0 numa-meminfo.n=
ode1.Active(anon)
=C2=A0=C2=A0=C2=A0 233.75 =C2=B1157%=C2=A0=C2=A0=C2=A0 +306.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 949.00 =C2=B1 66%=C2=A0 numa-meminfo.node1.Active(file)
=C2=A0=C2=A0=C2=A0 575517 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
8%=C2=A0=C2=A0=C2=A0=C2=A0 525050 =C2=B1=C2=A0 3%=C2=A0 numa-meminfo.node1.=
FilePages
=C2=A0=C2=A0=C2=A0=C2=A0 87936 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -53.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41275 =C2=B1=C2=A0 9%=C2=A0 numa-meminfo.n=
ode1.Shmem
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2097 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2660 =C2=B1 21%=C2=A0 slabinfo.=
dmaengine-unmap-16.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2097 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2660 =C2=B1 21%=C2=A0 slabinfo.=
dmaengine-unmap-16.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0 40336 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0 +102.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 81465 =C2=B1 50%=C2=A0 slabinfo.filp.active_objs
=C2=A0=C2=A0=C2=A0 657.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +98.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1301 =C2=B1 49%=C2=A0 slabinfo.filp.activ=
e_slabs
=C2=A0=C2=A0=C2=A0=C2=A0 42081 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +97.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83296 =C2=B1 49%=C2=A0 slabinfo.filp.num_o=
bjs
=C2=A0=C2=A0=C2=A0 657.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +98.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1301 =C2=B1 49%=C2=A0 slabinfo.filp.num_s=
labs
=C2=A0=C2=A0=C2=A0=C2=A0 13106 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +12.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14752 =C2=B1=C2=A0 3%=C2=A0 slabinfo.shmem=
_inode_cache.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0 13224 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +12.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14873 =C2=B1=C2=A0 3%=C2=A0 slabinfo.shmem=
_inode_cache.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1557 =C2=B1 71%=C2=A0=C2=A0=C2=A0 +545.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 10045 =C2=B1=C2=A0 2%=C2=A0 numa-vmstat.node0.n=
r_active_anon
=C2=A0=C2=A0=C2=A0 117.50 =C2=B1 57%=C2=A0=C2=A0=C2=A0=C2=A0 -97.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.00 =C2=B1 47%=C2=A0 numa-vmstat.node0.nr_m=
lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3761 =C2=B1 32%=C2=A0=C2=A0=C2=A0 +273.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 14037=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 numa-vmstat.node0.nr_shmem
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1557 =C2=B1 71%=C2=A0=C2=A0=C2=A0 +545.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 10045 =C2=B1=C2=A0 2%=C2=A0 numa-vmstat.node0.n=
r_zone_active_anon
=C2=A0=C2=A0=C2=A0=C2=A0 19391 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -50.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9533 =C2=B1=C2=A0 7%=C2=A0 numa-vmst=
at.node1.nr_active_anon
=C2=A0=C2=A0=C2=A0=C2=A0 58.25 =C2=B1157%=C2=A0=C2=A0=C2=A0 +301.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 233.67 =C2=B1 67%=C2=A0 numa-vmstat.node1.nr_active_file
=C2=A0=C2=A0=C2=A0 143875 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
7%=C2=A0=C2=A0=C2=A0=C2=A0 131291 =C2=B1=C2=A0 3%=C2=A0 numa-vmstat.node1.n=
r_file_pages
=C2=A0=C2=A0=C2=A0=C2=A0 21981 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -52.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10346 =C2=B1=C2=A0 8%=C2=A0 numa-vmstat.no=
de1.nr_shmem
=C2=A0=C2=A0=C2=A0=C2=A0 19391 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -50.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9533 =C2=B1=C2=A0 7%=C2=A0 numa-vmst=
at.node1.nr_zone_active_anon
=C2=A0=C2=A0=C2=A0=C2=A0 58.25 =C2=B1157%=C2=A0=C2=A0=C2=A0 +301.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 233.67 =C2=B1 67%=C2=A0 numa-vmstat.node1.nr_zone_active=
_file
=C2=A0=C2=A0=C2=A0 110768 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -10.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 99008 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU0.RCU
=C2=A0=C2=A0=C2=A0 108763 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -10.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 97774 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU1.RCU
=C2=A0=C2=A0=C2=A0 104199 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 94314 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU12=
.RCU
=C2=A0=C2=A0=C2=A0 106156 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -11.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 93873 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU13.RCU
=C2=A0=C2=A0=C2=A0 107231 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -11.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 95088 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU14.RCU
=C2=A0=C2=A0=C2=A0 105547 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -10.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 94461 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU15.RCU
=C2=A0=C2=A0=C2=A0 104326 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 96653 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU22=
.RCU
=C2=A0=C2=A0=C2=A0 108301 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 97571 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU25=
.RCU
=C2=A0=C2=A0=C2=A0 109423 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -10.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 97448 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU26.RCU
=C2=A0=C2=A0=C2=A0 109554 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
2%=C2=A0=C2=A0=C2=A0=C2=A0 101691 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU31.RCU
=C2=A0=C2=A0=C2=A0 108410 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -11.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 96233 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU37.RCU
=C2=A0=C2=A0=C2=A0 107189 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 96642 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU38=
.RCU
=C2=A0=C2=A0=C2=A0 108943 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -10.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 97052 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU39.RCU
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3348 =C2=B1 37%=C2=A0=C2=A0=C2=A0 +214.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 10541 =C2=B1 51%=C2=A0 softirqs.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 20942 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19637 =C2=B1=C2=A0 4%=C2=A0 proc-vm=
stat.nr_active_anon
=C2=A0=C2=A0=C2=A0=C2=A0 67173 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64699=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 proc-vmstat.nr_anon_pages
=C2=A0=C2=A0=C2=A0=C2=A0 10595=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -1.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10418=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_mapped
=C2=A0=C2=A0=C2=A0=C2=A0 25771 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -5.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24461 =C2=B1=C2=A0 3%=C2=A0 proc-vm=
stat.nr_shmem
=C2=A0=C2=A0=C2=A0=C2=A0 38683=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +5.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40878 =C2=B1=C2=
=A0 3%=C2=A0 proc-vmstat.nr_slab_unreclaimable
=C2=A0=C2=A0=C2=A0=C2=A0 20942 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19637 =C2=B1=C2=A0 4%=C2=A0 proc-vm=
stat.nr_zone_active_anon
=C2=A0=C2=A0=C2=A0=C2=A0 21010 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 -23.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 16020 =C2=B1 11%=C2=A0 proc-vmstat.numa_hint_fa=
ults
=C2=A0=C2=A0=C2=A0=C2=A0 16666 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 -28.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 11904 =C2=B1=C2=A0 7%=C2=A0 proc-vmstat.numa_hi=
nt_faults_local
=C2=A0=C2=A0=C2=A0=C2=A0 69020 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 66499=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 proc-vmstat.numa_other
=C2=A0 21276729=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -9.4%=C2=A0=C2=A0 19266740=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 proc-vmstat.pgactivate
=C2=A0=C2=A0=C2=A0=C2=A0 45217=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +4.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47044=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgalloc_dma32
=C2=A01.065e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -2.8%=C2=A0 1.035e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc=
-vmstat.pgalloc_normal
=C2=A0=C2=A0=C2=A0 610.50 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +83.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1123 =C2=B1 28%=C2=A0 proc-vmstat.pgdeactiva=
te
=C2=A01.209e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -4.1%=C2=A0 1.159e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc=
-vmstat.pgfault
=C2=A01.064e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -2.7%=C2=A0 1.035e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc=
-vmstat.pgfree
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.50 =C2=B1 20%=C2=A0 +71439.4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 3934 =C2=B1141%=C2=A0 proc-vmstat.pgmigrate_fail
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3540 =C2=B1 29%=C2=A0=C2=A0=C2=A0 +139.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8494 =C2=B1=C2=A0 7%=C2=A0 proc-vmstat.pg=
rotated
=C2=A0 10600738=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -9.5%=C2=A0=C2=A0=C2=A0 9598142=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 proc-vmstat.unevictable_pgs_mlocked
=C2=A0 10600295=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -9.5%=C2=A0=C2=A0=C2=A0 9598142=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 proc-vmstat.unevictable_pgs_munlocked
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 97%=C2=A0=C2=A0=C2=A0=C2=A0 -59.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1=C2=A0 2%=C2=A0 perf-sche=
d.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1=C2=A0 6%=C2=A0 +29749.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.03 =C2=B1 71%=C2=A0 perf-sched.sch_delay.m=
ax.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0 20.46 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -8.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18.64 =C2=B1=C2=A0 4%=C2=A0 perf-sc=
hed.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7526 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -25.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5592 =C2=B1=C2=A0 5%=C2=A0 perf-sche=
d.total_wait_and_delay.max.ms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7526 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -25.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5592 =C2=B1=C2=A0 5%=C2=A0 perf-sche=
d.total_wait_time.max.ms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.67 =C2=B1168%=C2=A0=C2=A0=C2=A0=C2=A0 -97.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 30%=C2=A0 perf-sched.wai=
t_and_delay.avg.ms.preempt_schedule_common._cond_resched.do_user_addr_fault=
.exc_page_fault.asm_exc_page_fault
=C2=A0=C2=A0=C2=A0 343.12 =C2=B1139%=C2=A0=C2=A0=C2=A0 +236.4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1154 =C2=B1 14%=C2=A0 perf-sched.wait_and_delay.av=
g.ms.preempt_schedule_common._cond_resched.generic_perform_write.__generic_=
file_write_iter.generic_file_write_iter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.39 =C2=B1173%=C2=A0 +26107.3%=C2=A0=C2=A0=
=C2=A0=C2=A0 364.94=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wa=
it_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__=
x64_sys_epoll_wait
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.59 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 -20.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.46 =C2=B1=C2=A0 6%=C2=A0 perf=
-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_fr=
om_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1770 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2236 =C2=B1=C2=A0 7%=C2=A0 perf=
-sched.wait_and_delay.count.schedule_timeout.rcu_gp_kthread.kthread.ret_fro=
m_fork
=C2=A0=C2=A0=C2=A0=C2=A0 18.50 =C2=B1 51%=C2=A0=C2=A0=C2=A0 +272.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 68.88 =C2=B1 22%=C2=A0 perf-sched.wait_and_delay.m=
ax.ms.preempt_schedule_common._cond_resched.remove_vma.__do_munmap.__vm_mun=
map
=C2=A0=C2=A0=C2=A0=C2=A0 20.79 =C2=B1 26%=C2=A0=C2=A0=C2=A0 +217.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 65.97 =C2=B1=C2=A0 9%=C2=A0 perf-sched.wait_and_de=
lay.max.ms.preempt_schedule_common._cond_resched.unmap_vmas.unmap_region.__=
do_munmap
=C2=A0=C2=A0=C2=A0 242.02 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -60.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 95.68 =C2=B1 51%=C2=A0 perf-sched.wait_and_delay.m=
ax.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 32%=C2=A0=C2=A0=C2=A0 +266.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 78%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc=
_pages_vma.do_anonymous_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1971 =C2=B1123%=C2=A0=C2=A0=C2=A0=C2=A0 -99.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.34 =C2=B1 10%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc=
_pages_vma.shmem_alloc_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.67 =C2=B1168%=C2=A0=C2=A0=C2=A0=C2=A0 -97.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 30%=C2=A0 perf-sched.wai=
t_time.avg.ms.preempt_schedule_common._cond_resched.do_user_addr_fault.exc_=
page_fault.asm_exc_page_fault
=C2=A0=C2=A0=C2=A0 348.74 =C2=B1136%=C2=A0=C2=A0=C2=A0 +231.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1154 =C2=B1 14%=C2=A0 perf-sched.wait_time.avg.ms.=
preempt_schedule_common._cond_resched.generic_perform_write.__generic_file_=
write_iter.generic_file_write_iter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.86 =C2=B1=C2=A0 4%=C2=A0=C2=A0 +1071.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 68.64 =C2=B1 19%=C2=A0 perf-sched.wait_time.avg=
.ms.preempt_schedule_common._cond_resched.khugepaged.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0 38.63 =C2=B1 52%=C2=A0=C2=A0=C2=A0 +843.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 364.62=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sc=
hed.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait._=
_x64_sys_epoll_wait
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.57 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 -20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.44 =C2=B1=C2=A0 6%=C2=A0 perf=
-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fo=
rk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.57 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +683.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.28 =C2=B1100%=C2=A0 perf-sched.wait_time.max=
.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc_page=
s_vma.do_anonymous_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2468 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0 -99.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.34 =C2=B1 10%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc=
_pages_vma.shmem_alloc_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.91 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -41.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.29 =C2=B1=C2=A0 6%=C2=A0 perf-sche=
d.wait_time.max.ms.preempt_schedule_common._cond_resched.down_read.__x64_sy=
s_msync.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.68 =C2=B1 17%=C2=A0=C2=A0 +1121.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 93.81 =C2=B1 13%=C2=A0 perf-sched.wait_time.max.ms=
.preempt_schedule_common._cond_resched.khugepaged.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0 18.50 =C2=B1 51%=C2=A0=C2=A0=C2=A0 +272.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 68.88 =C2=B1 22%=C2=A0 perf-sched.wait_time.max.ms=
.preempt_schedule_common._cond_resched.remove_vma.__do_munmap.__vm_munmap
=C2=A0=C2=A0=C2=A0=C2=A0 20.79 =C2=B1 26%=C2=A0=C2=A0=C2=A0 +217.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 65.97 =C2=B1=C2=A0 9%=C2=A0 perf-sched.wait_time.m=
ax.ms.preempt_schedule_common._cond_resched.unmap_vmas.unmap_region.__do_mu=
nmap
=C2=A0=C2=A0=C2=A0 242.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -62.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 90.66 =C2=B1 61%=C2=A0 perf-sched.wait_time.max.ms=
.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
=C2=A0 47358339 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -10.5%=C2=A0=C2=A0 =
42382902 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.branch-misses
=C2=A0 19845519 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.5%=C2=A0=
=C2=A0 18156709 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.cache-misses
=C2=A0 1.72e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -5.7%=C2=A0 1.621e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf=
-stat.i.cache-references
=C2=A0=C2=A0=C2=A0 725.90 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -13.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 630.12 =C2=B1=C2=A0 5%=C2=A0 perf-stat.i.cpu-migratio=
ns
=C2=A0 3.09e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -4.3%=C2=A0 2.957e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf=
-stat.i.dTLB-stores
=C2=A0 19570792=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -6.2%=C2=A0=C2=A0 18352176=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 perf-stat.i.iTLB-load-misses
=C2=A0=C2=A0=C2=A0=C2=A0 19871 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +9.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21819 =C2=B1=C2=A0 3%=C2=A0 perf-st=
at.i.instructions-per-iTLB-miss
=C2=A0=C2=A0=C2=A0 382.70=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -3.0%=C2=A0=C2=A0=C2=A0=C2=A0 371.36 =C2=B1=C2=A0 2%=C2=
=A0 perf-stat.i.metric.M/sec
=C2=A0=C2=A0 7111839 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -11.4%=C2=A0=
=C2=A0=C2=A0 6302363 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.node-load-misses
=C2=A0=C2=A0 8853002 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.6%=C2=
=A0=C2=A0=C2=A0 8004893=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.i.node-loads
=C2=A0=C2=A0 6500622=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -7.9%=C2=A0=C2=A0=C2=A0 5986359 =C2=B1=C2=A0 4%=C2=A0 perf-sta=
t.i.node-store-misses
=C2=A0=C2=A0 8596412=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -6.5%=C2=A0=C2=A0=C2=A0 8036645 =C2=B1=C2=A0 3%=C2=A0 perf-sta=
t.i.node-stores
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.60 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -3.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.38=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.MPKI
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.57=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.branch-miss-rate%
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5180 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +9.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5659 =C2=B1=C2=A0 3%=C2=A0=
 perf-stat.overall.cycles-between-cache-misses
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1575=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1651 =
=C2=B1=C2=A0 3%=C2=A0 perf-stat.overall.instructions-per-iTLB-miss
=C2=A0=C2=A0=C2=A0=C2=A0 44.52=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43.98=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.node-load-miss-rate%
=C2=A0=C2=A0=C2=A0=C2=A0 43.02=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42.61=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.node-store-miss-rate%
=C2=A0 47096030 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -11.4%=C2=A0=C2=A0 =
41713545 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.branch-misses
=C2=A0 19690067 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.4%=C2=A0=
=C2=A0 17836765 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.cache-misses
=C2=A0=C2=A0 1.7e+08 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -6.9%=C2=
=A0 1.582e+08 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.cache-references
=C2=A01.019e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -1.1%=C2=A0 1.008e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf=
-stat.ps.cpu-cycles
=C2=A0=C2=A0=C2=A0 748.16 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -11.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 663.37 =C2=B1=C2=A0 5%=C2=A0 perf-stat.ps.cpu-migrati=
ons
=C2=A03.052e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -5.5%=C2=A0 2.885e+09 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.dTLB-stores
=C2=A0 19264658=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -7.6%=C2=A0=C2=A0 17802646 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.iTLB-l=
oad-misses
=C2=A0=C2=A0 7041022 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -12.4%=C2=A0=
=C2=A0=C2=A0 6164936=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps=
.node-load-misses
=C2=A0=C2=A0 8774703 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -10.5%=C2=A0=
=C2=A0=C2=A0 7851024=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps=
.node-loads
=C2=A0=C2=A0 6428583=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -9.0%=C2=A0=C2=A0=C2=A0 5851692 =C2=B1=C2=A0 4%=C2=A0 perf-sta=
t.ps.node-store-misses
=C2=A0=C2=A0 8513354=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -7.5%=C2=A0=C2=A0=C2=A0 7878662 =C2=B1=C2=A0 4%=C2=A0 perf-sta=
t.ps.node-stores
=C2=A0=C2=A0=C2=A0 793.75 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -16.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 664.33 =C2=B1 12%=C2=A0 interrupts.22:IO-APIC.22-fast=
eoi.ehci_hcd:usb1
=C2=A0=C2=A0=C2=A0=C2=A0 10846 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -22.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8387 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU=
0.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4222 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -49.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2128 =C2=B1 43%=C2=A0 interrupts.CPU=
1.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4222 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -49.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2128 =C2=B1 43%=C2=A0 interrupts.CPU=
1.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3219 =C2=B1 28%=C2=A0=C2=A0=C2=A0=C2=A0 -21.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2544 =C2=B1 29%=C2=A0 interrupts.CPU=
10.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3219 =C2=B1 28%=C2=A0=C2=A0=C2=A0=C2=A0 -21.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2544 =C2=B1 29%=C2=A0 interrupts.CPU=
10.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 12387 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -10.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11065 =C2=B1 10%=C2=A0 interrupts.CPU10.TL=
B:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3883 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 -35.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2511 =C2=B1 43%=C2=A0 interrupts.CPU=
11.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3883 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 -35.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2511 =C2=B1 43%=C2=A0 interrupts.CPU=
11.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 11453 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0 -34.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7553 =C2=B1 14%=C2=A0 interrupts.CPU12.CA=
L:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2074 =C2=B1126%=C2=A0=C2=A0=C2=A0=C2=A0 -77.=
6%=C2=A0=C2=A0=C2=A0=C2=A0 464.00 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU12.RE=
S:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 13347 =C2=B1 59%=C2=A0=C2=A0=C2=A0=C2=A0 -45.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7274 =C2=B1 10%=C2=A0 interrupts.CPU12.TL=
B:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0 11138 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 -31.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7657 =C2=B1 13%=C2=A0 interrupts.CPU13.CA=
L:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3399 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0 -29.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2410 =C2=B1 50%=C2=A0 interrupts.CPU=
15.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3399 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0 -29.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2410 =C2=B1 50%=C2=A0 interrupts.CPU=
15.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3318 =C2=B1 29%=C2=A0=C2=A0=C2=A0=C2=A0 -25.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2479 =C2=B1 34%=C2=A0 interrupts.CPU=
16.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3318 =C2=B1 29%=C2=A0=C2=A0=C2=A0=C2=A0 -25.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2479 =C2=B1 34%=C2=A0 interrupts.CPU=
16.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4574 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 -58.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1890 =C2=B1 29%=C2=A0 interrupts.CPU=
20.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4574 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 -58.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1890 =C2=B1 29%=C2=A0 interrupts.CPU=
20.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2768 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0 -44.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1531 =C2=B1 30%=C2=A0 interrupts.CPU=
22.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2768 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0 -44.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1531 =C2=B1 30%=C2=A0 interrupts.CPU=
22.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 516.00 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 -18.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 418.33 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU22.RES:Resche=
duling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3326 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -28.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2387 =C2=B1 34%=C2=A0 interrupts.CPU=
23.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3326 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -28.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2387 =C2=B1 34%=C2=A0 interrupts.CPU=
23.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3850 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -39.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2340 =C2=B1 50%=C2=A0 interrupts.CPU=
25.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3850 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -39.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2340 =C2=B1 50%=C2=A0 interrupts.CPU=
25.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 859.25 =C2=B1 48%=C2=A0=C2=A0=C2=A0=C2=A0 -46.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 464.33 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU25.RES:Resche=
duling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 13154 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0 -25.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9841 =C2=B1 14%=C2=A0 interrupts.CPU25.TL=
B:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3711 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 -45.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018 =C2=B1 45%=C2=A0 interrupts.CPU=
26.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3711 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 -45.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2018 =C2=B1 45%=C2=A0 interrupts.CPU=
26.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4507 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2556 =C2=B1 40%=C2=A0 interrupt=
s.CPU27.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4507 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2556 =C2=B1 40%=C2=A0 interrupt=
s.CPU27.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 11363 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -14.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9671 =C2=B1=C2=A0 8%=C2=A0 interrupt=
s.CPU27.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4430 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -51.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2172 =C2=B1 43%=C2=A0 interrupt=
s.CPU28.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4430 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -51.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2172 =C2=B1 43%=C2=A0 interrupt=
s.CPU28.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9512 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -16.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7921 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU29.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3914 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -59.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1606 =C2=B1 27%=C2=A0 interrupts.CPU=
29.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3914 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -59.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1606 =C2=B1 27%=C2=A0 interrupts.CPU=
29.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 998.00 =C2=B1 77%=C2=A0=C2=A0=C2=A0=C2=A0 -55.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 444.00 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU29.RES:Resche=
duling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 11508 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -22.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8881 =C2=B1 10%=C2=A0 interrupts.CPU29.TL=
B:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3287 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -36.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2082 =C2=B1 43%=C2=A0 interrupts.CPU=
30.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3287 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -36.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2082 =C2=B1 43%=C2=A0 interrupts.CPU=
30.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 571.75 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -21.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 451.67 =C2=B1 10%=C2=A0 interrupts.CPU30.RES:Reschedulin=
g_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 10554 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -26.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7757 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
31.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3521 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 -47.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1838 =C2=B1=C2=A0 9%=C2=A0 interrupt=
s.CPU31.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3521 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 -47.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1838 =C2=B1=C2=A0 9%=C2=A0 interrupt=
s.CPU31.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 604.00 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -26.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 447.00 =C2=B1 14%=C2=A0 interrupts.CPU31.RES:Reschedulin=
g_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3946 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 -51.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1898 =C2=B1=C2=A0 6%=C2=A0 interrupt=
s.CPU32.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3946 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 -51.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1898 =C2=B1=C2=A0 6%=C2=A0 interrupt=
s.CPU32.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2221 =C2=B1 74%=C2=A0=C2=A0=C2=A0=C2=A0 -74.=
2%=C2=A0=C2=A0=C2=A0=C2=A0 573.00 =C2=B1 13%=C2=A0 interrupts.CPU32.RES:Res=
cheduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2969 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -40.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1774 =C2=B1 11%=C2=A0 interrupts.CPU=
33.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2969 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -40.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1774 =C2=B1 11%=C2=A0 interrupts.CPU=
33.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 13653 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -40.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8079 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
34.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3074 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -41.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1791 =C2=B1 18%=C2=A0 interrupts.CPU=
34.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3074 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -41.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1791 =C2=B1 18%=C2=A0 interrupts.CPU=
34.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 18328 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0 -48.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9519 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
34.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0 11937 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 -36.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7623 =C2=B1 15%=C2=A0 interrupts.CPU35.CA=
L:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3503 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 -36.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2229 =C2=B1 12%=C2=A0 interrupts.CPU=
35.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3503 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 -36.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2229 =C2=B1 12%=C2=A0 interrupts.CPU=
35.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 16203 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0 -47.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8444 =C2=B1 15%=C2=A0 interrupts.CPU35.TL=
B:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4311 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2440 =C2=B1 50%=C2=A0 interrupts.CPU=
37.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4311 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2440 =C2=B1 50%=C2=A0 interrupts.CPU=
37.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1028 =C2=B1 98%=C2=A0=C2=A0=C2=A0=C2=A0 -60.=
6%=C2=A0=C2=A0=C2=A0=C2=A0 404.67 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU37.RE=
S:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 11376 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -35.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7324 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
37.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3390 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0 -35.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2177 =C2=B1 50%=C2=A0 interrupts.CPU=
38.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3390 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0 -35.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2177 =C2=B1 50%=C2=A0 interrupts.CPU=
38.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2077 =C2=B1133%=C2=A0=C2=A0=C2=A0=C2=A0 -80.=
7%=C2=A0=C2=A0=C2=A0=C2=A0 401.33 =C2=B1 12%=C2=A0 interrupts.CPU38.RES:Res=
cheduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3760 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -54.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1716 =C2=B1 66%=C2=A0 interrupts.CPU=
39.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3760 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -54.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1716 =C2=B1 66%=C2=A0 interrupts.CPU=
39.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3338 =C2=B1 68%=C2=A0=C2=A0=C2=A0=C2=A0 -85.=
1%=C2=A0=C2=A0=C2=A0=C2=A0 496.67 =C2=B1 17%=C2=A0 interrupts.CPU4.RES:Resc=
heduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3731 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -45.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2030 =C2=B1 38%=C2=A0 interrupts.CPU=
40.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3731 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -45.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2030 =C2=B1 38%=C2=A0 interrupts.CPU=
40.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4265 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2409 =C2=B1 45%=C2=A0 interrupt=
s.CPU42.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4265 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2409 =C2=B1 45%=C2=A0 interrupt=
s.CPU42.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3425 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -41.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007 =C2=B1 51%=C2=A0 interrupts.CPU=
43.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3425 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -41.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007 =C2=B1 51%=C2=A0 interrupts.CPU=
43.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 627.00 =C2=B1 46%=C2=A0=C2=A0=C2=A0=C2=A0 -43.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 354.67 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU43.RES:Resche=
duling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4679 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -71.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1331 =C2=B1 21%=C2=A0 interrupts.CPU=
44.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4679 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -71.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1331 =C2=B1 21%=C2=A0 interrupts.CPU=
44.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 494.50 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -25.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 367.00 =C2=B1 15%=C2=A0 interrupts.CPU44.RES:Reschedulin=
g_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3975 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2249 =C2=B1 46%=C2=A0 interrupts.CPU=
45.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3975 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2249 =C2=B1 46%=C2=A0 interrupts.CPU=
45.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8711 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 -11.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7705=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU46.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3650 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -44.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2010 =C2=B1 55%=C2=A0 interrupts.CPU=
46.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3650 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -44.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2010 =C2=B1 55%=C2=A0 interrupts.CPU=
46.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 440.75 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -16.7%=C2=
=A0=C2=A0=C2=A0=C2=A0 367.00 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU46.RES:Res=
cheduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7891 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -25.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5860 =C2=B1 11%=C2=A0 interrupts.CPU=
47.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 793.00 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0 -50.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 392.00 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU47.RES:Resche=
duling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2663 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 -21.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2087 =C2=B1=C2=A0 7%=C2=A0 interrupt=
s.CPU5.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2663 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 -21.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2087 =C2=B1=C2=A0 7%=C2=A0 interrupt=
s.CPU5.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 12129 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 -32.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8164 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
7.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 14622 =C2=B1 38%=C2=A0=C2=A0=C2=A0=C2=A0 -33.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9701 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
7.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0 793.75 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -16.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 664.33 =C2=B1 12%=C2=A0 interrupts.CPU8.22:IO-APIC.22=
-fasteoi.ehci_hcd:usb1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2516 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3188 =C2=B1 15%=C2=A0 interrupt=
s.CPU8.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2516 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3188 =C2=B1 15%=C2=A0 interrupt=
s.CPU8.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1784 =C2=B1 54%=C2=A0=C2=A0=C2=A0=C2=A0 -58.=
8%=C2=A0=C2=A0=C2=A0=C2=A0 735.00 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU8.RES=
:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 656.75 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +51.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 992.00 =C2=B1 20%=C2=A0 interrupts.CPU9.RES:Rescheduling=
_interrupts
=C2=A0=C2=A0=C2=A0 168231 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -33.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 112034 =C2=B1 19%=C2=A0 interrupts.NMI:Non-maskable_i=
nterrupts
=C2=A0=C2=A0=C2=A0 168231 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -33.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 112034 =C2=B1 19%=C2=A0 interrupts.PMI:Performance_mo=
nitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.01 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.60 =C2=B1 50%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_a=
fter_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.21 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.29 =C2=B1 63%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_us=
er_mode.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.84 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.96 =C2=B1 39%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.06 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.23 =C2=B1 65%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_prepare.sysc=
all_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.64 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.87 =C2=B1 40%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.84 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.13 =C2=B1 67%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_prepa=
re.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.49 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 70%=C2=A0=
 perf-profile.calltrace.cycles-pp.alloc_empty_file.path_openat.do_filp_open=
.do_sys_openat2.do_sys_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.46 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1 70%=C2=A0=
 perf-profile.calltrace.cycles-pp.__alloc_file.alloc_empty_file.path_openat=
.do_filp_open.do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.28 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1 71%=C2=A0=
 perf-profile.calltrace.cycles-pp.syscall_return_via_sysret
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.06 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1 71%=C2=A0=
 perf-profile.calltrace.cycles-pp.__entry_text_start
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.05 =C2=B1 11%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_=
timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.82 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1 11%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_ente=
r_state.cpuidle_enter.do_idle.cpu_startup_entry
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.23 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.68 =C2=B1 18%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.wait_for_xmitr.serial8250_console_putchar.ua=
rt_console_write.serial8250_console_write.console_unlock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.23 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.68 =C2=B1 18%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.serial8250_console_putchar.uart_console_writ=
e.serial8250_console_write.console_unlock.vprintk_emit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.82 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.39 =C2=B1 17%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.create_basic_memory_bitmaps.snapshot_open.mi=
sc_open.chrdev_open.do_dentry_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.61 =C2=B1 12%=C2=A0 perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_=
interrupt.asm_call_sysvec_on_stack.sysvec_apic_timer_interrupt.asm_sysvec_a=
pic_timer_interrupt.cpuidle_enter_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.62 =C2=B1 12%=C2=A0 perf-profile.calltrace.cycles-pp.asm_call_sysvec_on_s=
tack.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_en=
ter_state.cpuidle_enter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.96 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.69 =C2=B1 19%=C2=A0=
 perf-profile.calltrace.cycles-pp.mutex_spin_on_owner.__mutex_lock.misc_ope=
n.chrdev_open.do_dentry_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.19 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.78 =C2=B1 45%=C2=A0 pe=
rf-profile.children.cycles-pp.syscall_exit_to_user_mode
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.03 =C2=B1 53%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 21%=C2=A0 pe=
rf-profile.children.cycles-pp.link_path_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.28 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.35 =C2=B1 61%=C2=A0 pe=
rf-profile.children.cycles-pp.exit_to_user_mode_prepare
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.85 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.96 =C2=B1 40%=C2=A0 pe=
rf-profile.children.cycles-pp.ksys_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.26 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.38 =C2=B1 62%=C2=A0 pe=
rf-profile.children.cycles-pp.task_work_run
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.65 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.88 =C2=B1 40%=C2=A0 pe=
rf-profile.children.cycles-pp.vm_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.04 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.27 =C2=B1 64%=C2=A0 pe=
rf-profile.children.cycles-pp.__fput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.69 =C2=B1 54%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 22%=C2=A0 pe=
rf-profile.children.cycles-pp.inode_permission
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.47 =C2=B1 51%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.walk_component
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1 54%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.lookup_fast
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.49 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 28%=C2=A0 pe=
rf-profile.children.cycles-pp._raw_spin_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.49 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 48%=C2=A0 pe=
rf-profile.children.cycles-pp.rwsem_down_write_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.51 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1 53%=C2=A0 pe=
rf-profile.children.cycles-pp.down_write_killable
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.91 =C2=B1 62%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0 pe=
rf-profile.children.cycles-pp.hidraw_release
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.58 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.73 =C2=B1 24%=C2=A0=
 perf-profile.children.cycles-pp.alloc_empty_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.55 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.72 =C2=B1 24%=C2=A0=
 perf-profile.children.cycles-pp.__alloc_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.49 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.74 =C2=B1 28%=C2=A0=
 perf-profile.children.cycles-pp.syscall_return_via_sysret
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.26 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1 27%=C2=A0=
 perf-profile.children.cycles-pp.__entry_text_start
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.55 =C2=B1 24%=C2=A0=
 perf-profile.children.cycles-pp.kmem_cache_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.87 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1 34%=C2=A0 pe=
rf-profile.children.cycles-pp.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 25%=C2=A0=
 perf-profile.children.cycles-pp.dput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.55 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 34%=C2=A0 pe=
rf-profile.children.cycles-pp.security_file_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 36%=C2=A0 pe=
rf-profile.children.cycles-pp.apparmor_file_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 55%=C2=A0 pe=
rf-profile.children.cycles-pp.rwsem_spin_on_owner
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.ima_file_check
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.65 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 35%=C2=A0=
 perf-profile.children.cycles-pp.__x64_sys_select
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.47 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.security_task_getsecid
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.64 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 35%=C2=A0=
 perf-profile.children.cycles-pp.kern_select
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1 36%=C2=A0 pe=
rf-profile.children.cycles-pp.__x64_sys_exit_group
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 33%=C2=A0 pe=
rf-profile.children.cycles-pp.do_group_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 33%=C2=A0 pe=
rf-profile.children.cycles-pp.do_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 19%=C2=A0 pe=
rf-profile.children.cycles-pp.apparmor_task_getsecid
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 65%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 83%=C2=A0 pe=
rf-profile.children.cycles-pp.__x64_sys_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 64%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 83%=C2=A0 pe=
rf-profile.children.cycles-pp.__vm_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 34%=C2=A0=
 perf-profile.children.cycles-pp.lockref_put_or_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 15%=C2=A0=
 perf-profile.children.cycles-pp.security_file_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 38%=C2=A0=
 perf-profile.children.cycles-pp.__x64_sys_close
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.__do_sys_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.kernel_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.apparmor_file_alloc_security
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.57 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1 38%=C2=A0=
 perf-profile.children.cycles-pp.core_sys_select
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.mmput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.exit_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 35%=C2=A0=
 perf-profile.children.cycles-pp.get_unmapped_area
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 20%=C2=A0 pe=
rf-profile.children.cycles-pp.__do_sys_newfstat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.dup_mm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.71 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1 11%=C2=A0=
 perf-profile.children.cycles-pp.do_softirq_own_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 11%=C2=A0 pe=
rf-profile.children.cycles-pp.irq_exit_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.dup_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 36%=C2=A0=
 perf-profile.children.cycles-pp.__fget_files
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 52%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 75%=C2=A0 pe=
rf-profile.children.cycles-pp.mmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 34%=C2=A0=
 perf-profile.children.cycles-pp.security_mmap_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 15%=C2=A0=
 perf-profile.children.cycles-pp.getname_flags
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 35%=C2=A0=
 perf-profile.children.cycles-pp.complete_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 31%=C2=A0=
 perf-profile.children.cycles-pp.unlazy_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 27%=C2=A0 pe=
rf-profile.children.cycles-pp.vfs_fstat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.security_file_free
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.aa_get_task_label
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.apparmor_file_free_security
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.step_into
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 39%=C2=A0 pe=
rf-profile.children.cycles-pp.do_select
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 34%=C2=A0=
 perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 31%=C2=A0=
 perf-profile.children.cycles-pp.__legitimize_path
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1=C2=A0 7%=C2=
=A0 perf-profile.children.cycles-pp.__schedule
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 40%=C2=A0=
 perf-profile.children.cycles-pp.terminate_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 34%=C2=A0=
 perf-profile.children.cycles-pp.__fget_light
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 24%=C2=A0 pe=
rf-profile.children.cycles-pp.may_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 35%=C2=A0 pe=
rf-profile.children.cycles-pp.mutex_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 50%=C2=A0=
 perf-profile.children.cycles-pp.__alloc_pages_nodemask
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 24%=C2=A0 pe=
rf-profile.children.cycles-pp.ksys_lseek
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 58%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 84%=C2=A0 pe=
rf-profile.children.cycles-pp.__do_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 71%=C2=A0=
 perf-profile.children.cycles-pp.lockref_get_not_dead
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 75%=C2=A0 pe=
rf-profile.children.cycles-pp.cdev_put
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 38%=C2=A0 pe=
rf-profile.children.cycles-pp.__close_fd
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 38%=C2=A0 pe=
rf-profile.children.cycles-pp.pick_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp._raw_spin_lock_irqsave
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 33%=C2=A0=
 perf-profile.children.cycles-pp.__alloc_fd
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 20%=C2=A0 pe=
rf-profile.children.cycles-pp.free_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1=C2=A0 9%=C2=
=A0 perf-profile.children.cycles-pp.schedule
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 18%=C2=A0=
 perf-profile.children.cycles-pp.strncpy_from_user
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 39%=C2=A0 pe=
rf-profile.children.cycles-pp.filp_close
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 71%=C2=A0 pe=
rf-profile.children.cycles-pp.vm_unmapped_area
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 29%=C2=A0=
 perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 76%=C2=A0 pe=
rf-profile.children.cycles-pp.kobject_put
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 29%=C2=A0 pe=
rf-profile.children.cycles-pp.copy_page_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.try_to_wake_up
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 34%=C2=A0=
 perf-profile.children.cycles-pp.common_file_perm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 32%=C2=A0 pe=
rf-profile.children.cycles-pp.fput_many
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 47%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_release
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 47%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_client_dev_restore
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 47%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_fbdev_client_restore
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 47%=C2=A0 pe=
rf-profile.children.cycles-pp.__drm_fb_helper_restore_fbdev_mode_unlocked
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 47%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_client_modeset_commit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 47%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_client_modeset_commit_locked
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 47%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_client_modeset_commit_atomic
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 48%=C2=A0=
 perf-profile.children.cycles-pp.get_page_from_freelist
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 30%=C2=A0 pe=
rf-profile.children.cycles-pp.unmap_vmas
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 76%=C2=A0 pe=
rf-profile.children.cycles-pp.copy_pte_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 71%=C2=A0=
 perf-profile.children.cycles-pp.__x64_sys_fcntl
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 36%=C2=A0=
 perf-profile.children.cycles-pp.__x64_sys_poll
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1=C2=A0 9%=
=C2=A0 perf-profile.children.cycles-pp.__check_object_size
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 25%=C2=A0 pe=
rf-profile.children.cycles-pp.unmap_page_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 33%=C2=A0=
 perf-profile.children.cycles-pp.do_sys_poll
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 72%=C2=A0=
 perf-profile.children.cycles-pp.__might_sleep
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 78%=C2=A0=
 perf-profile.children.cycles-pp.obj_cgroup_charge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 16%=C2=A0=
 perf-profile.children.cycles-pp.zap_pte_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 72%=C2=A0 pe=
rf-profile.children.cycles-pp.__slab_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 72%=C2=A0 pe=
rf-profile.children.cycles-pp.___slab_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0 pe=
rf-profile.children.cycles-pp.unlink_anon_vmas
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 38%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 74%=C2=A0 pe=
rf-profile.children.cycles-pp.block_ioctl
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 20%=C2=A0=
 perf-profile.children.cycles-pp.anon_vma_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 18%=C2=A0=
 perf-profile.children.cycles-pp.___might_sleep
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 81%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_stub_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 81%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 81%=C2=A0 pe=
rf-profile.children.cycles-pp.drm_master_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 23%=C2=A0=
 perf-profile.children.cycles-pp.get_obj_cgroup_from_current
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 38%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 74%=C2=A0 pe=
rf-profile.children.cycles-pp.blkdev_ioctl
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0 pe=
rf-profile.children.cycles-pp._cond_resched
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 73%=C2=A0=
 perf-profile.children.cycles-pp.memset_erms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 72%=C2=A0 pe=
rf-profile.children.cycles-pp.allocate_slab
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0 pe=
rf-profile.children.cycles-pp.call_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 50%=C2=A0 pe=
rf-profile.children.cycles-pp.path_lookupat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 61%=C2=A0 pe=
rf-profile.children.cycles-pp.__fxstat64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0 pe=
rf-profile.children.cycles-pp.anon_vma_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0 pe=
rf-profile.children.cycles-pp.__mod_memcg_lruvec_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.pick_next_task_fair
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 11%=C2=A0=
 perf-profile.children.cycles-pp.syscall_enter_from_user_mode
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0 pe=
rf-profile.children.cycles-pp.cp_new_stat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 19%=C2=A0 pe=
rf-profile.children.cycles-pp.__d_lookup_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 73%=C2=A0 pe=
rf-profile.children.cycles-pp.generic_permission
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 20%=C2=A0=
 perf-profile.children.cycles-pp.__x86_retpoline_rax
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0=
 perf-profile.children.cycles-pp.ktime_get_ts64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=
 perf-profile.children.cycles-pp.__might_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0 pe=
rf-profile.children.cycles-pp.schedule_timeout
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 12%=C2=A0=
 perf-profile.children.cycles-pp.update_load_avg
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 8%=
=C2=A0 perf-profile.children.cycles-pp.newidle_balance
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1=C2=A0 7%=C2=
=A0 perf-profile.children.cycles-pp.task_tick_fair
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 16%=C2=A0 pe=
rf-profile.children.cycles-pp.tick_irq_enter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 57%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.sched_clock_cpu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.irq_enter_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 24%=C2=A0=
 perf-profile.children.cycles-pp.clockevents_program_event
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.rebalance_domains
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 26%=C2=A0=
 perf-profile.children.cycles-pp.ktime_get
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1=C2=A0 7%=
=C2=A0 perf-profile.children.cycles-pp.menu_select
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 16%=C2=A0 pe=
rf-profile.children.cycles-pp.io_serial_out
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.children.cycles-pp.delay_tsc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.83 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.38 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.serial8250_console_putchar
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.85 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.40 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.wait_for_xmitr
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.99 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.56 =C2=B1 16%=C2=A0 pe=
rf-profile.children.cycles-pp.__dynamic_pr_debug
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.82 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.39 =C2=B1 17%=C2=A0 pe=
rf-profile.children.cycles-pp.create_basic_memory_bitmaps
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.13 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.74 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.console_unlock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.03 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.65 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.uart_console_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.17 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.79 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.printk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.17 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.79 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.vprintk_emit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.05 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.67 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.serial8250_console_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
3.73 =C2=B1 66%=C2=A0 perf-profile.children.cycles-pp.__cna_queued_spin_loc=
k_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.92 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -1.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.44 =C2=B1 22%=C2=A0=
 perf-profile.self.cycles-pp.syscall_exit_to_user_mode
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.48 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.74 =C2=B1 28%=C2=A0=
 perf-profile.self.cycles-pp.syscall_return_via_sysret
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.25 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 28%=C2=A0=
 perf-profile.self.cycles-pp.__entry_text_start
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 34%=C2=A0 pe=
rf-profile.self.cycles-pp.apparmor_file_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 54%=C2=A0 pe=
rf-profile.self.cycles-pp.rwsem_spin_on_owner
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 36%=C2=A0=
 perf-profile.self.cycles-pp.lockref_put_or_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 18%=C2=A0 pe=
rf-profile.self.cycles-pp.apparmor_file_alloc_security
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1 25%=C2=A0=
 perf-profile.self.cycles-pp._raw_spin_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 72%=C2=A0 pe=
rf-profile.self.cycles-pp.aa_get_task_label
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 20%=C2=A0=
 perf-profile.self.cycles-pp.kmem_cache_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 36%=C2=A0 pe=
rf-profile.self.cycles-pp.__fget_files
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 11%=C2=A0 pe=
rf-profile.self.cycles-pp.apparmor_file_free_security
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 36%=C2=A0=
 perf-profile.self.cycles-pp.do_dentry_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 76%=C2=A0 pe=
rf-profile.self.cycles-pp.mutex_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 71%=C2=A0=
 perf-profile.self.cycles-pp.lockref_get_not_dead
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 73%=C2=A0 pe=
rf-profile.self.cycles-pp.vm_unmapped_area
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 73%=C2=A0=
 perf-profile.self.cycles-pp.common_file_perm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 76%=C2=A0 pe=
rf-profile.self.cycles-pp.kobject_put
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 25%=C2=A0 pe=
rf-profile.self.cycles-pp.__alloc_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 39%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 78%=C2=A0 pe=
rf-profile.self.cycles-pp.rwsem_down_write_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 77%=C2=A0 pe=
rf-profile.self.cycles-pp.fput_many
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=
 perf-profile.self.cycles-pp.__might_sleep
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 30%=C2=A0=
 perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0 pe=
rf-profile.self.cycles-pp.do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 73%=C2=A0=
 perf-profile.self.cycles-pp.__fput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 31%=C2=A0=
 perf-profile.self.cycles-pp._raw_spin_lock_irqsave
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 70%=C2=A0 pe=
rf-profile.self.cycles-pp.link_path_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 18%=C2=A0=
 perf-profile.self.cycles-pp.___might_sleep
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0 pe=
rf-profile.self.cycles-pp.get_obj_cgroup_from_current
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 73%=C2=A0=
 perf-profile.self.cycles-pp.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 71%=C2=A0 pe=
rf-profile.self.cycles-pp.__x86_retpoline_rax
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 72%=C2=A0 pe=
rf-profile.self.cycles-pp.allocate_slab
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 19%=C2=A0=
 perf-profile.self.cycles-pp.__d_lookup_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0 pe=
rf-profile.self.cycles-pp.generic_permission
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=
 perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=
=C2=A0 perf-profile.self.cycles-pp.syscall_enter_from_user_mode
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1=C2=A0 8%=C2=
=A0 perf-profile.self.cycles-pp.cpuidle_enter_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 10%=C2=A0=
 perf-profile.self.cycles-pp.menu_select
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1100%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 36%=C2=A0 pe=
rf-profile.self.cycles-pp.ktime_get
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.self.cycles-pp.delay_tsc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 16%=C2=A0 pe=
rf-profile.self.cycles-pp.io_serial_out
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
3.73 =C2=B1 66%=C2=A0 perf-profile.self.cycles-pp.__cna_queued_spin_lock_sl=
owpath


=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 stress-ng.zero.ops_per_sec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =

=C2=A0 400000 +------------------------------------------------------------=
------+=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |.+.. .+..=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .+..+.=C2=A0 .+.+..=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 =

=C2=A0 350000 |-+=C2=A0 +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 +.+..+.+.. =
.+..+=C2=A0=C2=A0=C2=A0 O +. O O=C2=A0 +.+..O+O=C2=A0 +.+..+.+..+.|=C2=A0=
=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | O=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : O=C2=A0 : O=C2=A0=C2=A0=C2=A0 O=C2=A0 +=C2=A0=C2=A0=C2=A0=
 O O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0 O O=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =

=C2=A0 300000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0 :=
=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 =

=C2=A0 250000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =

=C2=A0 200000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0 :=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =

=C2=A0 150000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 =

=C2=A0 100000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =

=C2=A0=C2=A0 50000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ::=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 +-----------------------------------=
-------------------------------+=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =

[*] bisect-good sample
[O] bisect-bad=C2=A0 sample

***************************************************************************=
************************
lkp-csl-2ap2: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz with=
 192G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_threads/ro=
otfs/sync_method/tbox_group/test_size/testcase/ucode:
=C2=A0 gcc-9/performance/1BRD_48G/4M/btrfs/1x/x86_64-rhel-8.3/64t/debian-10=
.4-x86_64-20200603.cgz/NoSync/lkp-csl-2ap2/24G/fsmark/0x5003003

commit: =

=C2=A0 cb45bab007 ("locking/qspinlock: Refactor the qspinlock slow path")
=C2=A0 0e8d8f4f12 ("locking/qspinlock: Introduce CNA into the slow path of =
qspinlock")

cb45bab007ff0cfc 0e8d8f4f1214cfbac219d6917b5 =

---------------- --------------------------- =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1180 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0 +213.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3706 =C2=B1 11%=C2=A0 fsmark.files_p=
er_sec
=C2=A0=C2=A0=C2=A0 773.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -30.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 539.75 =C2=B1=C2=A0 7%=C2=A0 fsmark.time.percent_of_c=
pu_this_job_got
=C2=A0=C2=A0=C2=A0 137.19 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -28.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 98.13 =C2=B1=C2=A0 8%=C2=A0 fsmark.time.system_=
time
=C2=A0=C2=A0=C2=A0=C2=A0 48917 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -9.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 44537 =C2=B1=C2=A0 8%=C2=A0 meminfo=
.AnonHugePages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.83 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.83 =C2=B1=C2=A0 5%=
=C2=A0 mpstat.cpu.all.sys%
=C2=A0=C2=A0=C2=A0=C2=A0 93.48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +1.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 94.51=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iostat.cpu.idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.76 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -16.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.79 =C2=B1=C2=A0 6%=C2=A0 iost=
at.cpu.system
=C2=A0=C2=A0=C2=A0=C2=A0 93.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +1.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 94.00=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstat.cpu.id
=C2=A0=C2=A0=C2=A0=C2=A0 20606 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +97.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40682 =C2=B1 34%=C2=A0 vmstat.system.cs
=C2=A0=C2=A0 4237881 =C2=B1 29%=C2=A0=C2=A0=C2=A0 +321.3%=C2=A0=C2=A0 17854=
499 =C2=B1106%=C2=A0 cpuidle.C1.time
=C2=A0=C2=A0=C2=A0=C2=A0 44169 =C2=B1 32%=C2=A0=C2=A0=C2=A0 +396.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 219318 =C2=B1113%=C2=A0 cpuidle.C1.usage
=C2=A0=C2=A0=C2=A0=C2=A0 72208 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0 +191.8%=C2=
=A0=C2=A0=C2=A0=C2=A0 210719 =C2=B1 39%=C2=A0 cpuidle.POLL.time
=C2=A0=C2=A0=C2=A0=C2=A0 36708 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0 +306.0%=C2=
=A0=C2=A0=C2=A0=C2=A0 149034 =C2=B1 48%=C2=A0 cpuidle.POLL.usage
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2157 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +13.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2454 =C2=B1=C2=A0 6%=C2=A0 slab=
info.biovec-max.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2271 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +12.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2561 =C2=B1=C2=A0 5%=C2=A0 slab=
info.biovec-max.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6624=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +13.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7512 =C2=
=B1=C2=A0 5%=C2=A0 slabinfo.btrfs_delayed_node.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6768=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +12.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7589 =C2=
=B1=C2=A0 5%=C2=A0 slabinfo.btrfs_delayed_node.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0 47815 =C2=B1 86%=C2=A0=C2=A0=C2=A0=C2=A0 -89.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5149 =C2=B1=C2=A0 6%=C2=A0 sched_debug.cf=
s_rq:/.load.stddev
=C2=A0=C2=A0=C2=A0 142.69 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +66.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 237.99 =C2=B1 13%=C2=A0 sched_debug.cfs_rq:/.load_avg.avg
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1598 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0 +92.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3075 =C2=B1 20%=C2=A0 sched_debug.cf=
s_rq:/.load_avg.max
=C2=A0=C2=A0=C2=A0 383.38 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 +90.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 730.10 =C2=B1 13%=C2=A0 sched_debug.cfs_rq:/.load_avg.st=
ddev
=C2=A0=C2=A0=C2=A0=C2=A0 37712 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -27.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 27508 =C2=B1 16%=C2=A0 sched_debug.cfs_rq:/.min=
_vruntime.avg
=C2=A0=C2=A0=C2=A0=C2=A0 58.89 =C2=B1 49%=C2=A0=C2=A0=C2=A0=C2=A0 +57.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 92.96 =C2=B1=C2=A0 5%=C2=A0 sched_debug.cfs_rq:=
/.util_est_enqueued.stddev
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1901 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -8.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1743 =C2=B1=C2=A0 3%=C2=A0=
 proc-vmstat.nr_active_anon
=C2=A0=C2=A0 5055884=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +3.2%=C2=A0=C2=A0=C2=A0 5219972=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 proc-vmstat.nr_file_pages
=C2=A0=C2=A0 4788961 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.4%=C2=
=A0=C2=A0=C2=A0 4953360=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmst=
at.nr_inactive_file
=C2=A0=C2=A0=C2=A0=C2=A0 36576 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35069=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 proc-vmstat.nr_kernel_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9756=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -1.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9601=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_mapped
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5205 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -5.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4939=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_shmem
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1901 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -8.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1743 =C2=B1=C2=A0 3%=C2=A0=
 proc-vmstat.nr_zone_active_anon
=C2=A0=C2=A0 4788961 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.4%=C2=
=A0=C2=A0=C2=A0 4953360=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmst=
at.nr_zone_inactive_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4864 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -8.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4465=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgactivate
=C2=A02.507e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -8.7%=C2=A0=C2=A0 2.29e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 perf-stat.i.branch-instructions
=C2=A0 71942409=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -5.3%=C2=A0=C2=A0 68125925 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.cache-m=
isses
=C2=A04.372e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -18.5%=C2=A0 3.565e+10 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.cpu-cycles
=C2=A01.231e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -7.5%=C2=A0 1.138e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf=
-stat.i.instructions
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2515 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 -11.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2228 =C2=B1=C2=A0 5%=C2=A0 perf=
-stat.i.instructions-per-iTLB-miss
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -17.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=
=B1=C2=A0 3%=C2=A0 perf-stat.i.metric.GHz
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.71 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 +37.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.97 =C2=B1 17%=C2=A0 perf-stat.i.me=
tric.K/sec
=C2=A0=C2=A0=C2=A0=C2=A0 35.43=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -6.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.24 =C2=B1=C2=
=A0 2%=C2=A0 perf-stat.i.metric.M/sec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.58=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.28=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.cpi
=C2=A0=C2=A0=C2=A0 612.62=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -9.0%=C2=A0=C2=A0=C2=A0=C2=A0 557.36 =C2=B1=C2=A0 3%=C2=
=A0 perf-stat.overall.cycles-between-cache-misses
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2610 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 -11.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2299 =C2=B1=C2=A0 4%=C2=A0 perf=
-stat.overall.instructions-per-iTLB-miss
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +9.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.ipc
=C2=A0 2.39e+09 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -6.3%=C2=A0 2=
.239e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.branch-inst=
ructions
=C2=A0 68534728 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.6%=C2=A0=
=C2=A0 65359103 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.cache-misses
=C2=A04.199e+10 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -13.3%=C2=A0 3.641e=
+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.cpu-cycles
=C2=A01.173e+10 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -5.3%=C2=A0 1=
.112e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.instructions
=C2=A0=C2=A0=C2=A0 226946 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +44.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 328685 =C2=B1 19%=C2=A0 numa-meminfo.node0.AnonPages
=C2=A0=C2=A0=C2=A0 249710 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +41.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 354296 =C2=B1 20%=C2=A0 numa-meminfo.node0.AnonPages.max
=C2=A0=C2=A0=C2=A0 233745 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +42.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 331984 =C2=B1 20%=C2=A0 numa-meminfo.node0.Inactive(anon)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8680 =C2=B1 73%=C2=A0=C2=A0=C2=A0 +135.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 20474 =C2=B1 28%=C2=A0 numa-meminfo.node0.PageT=
ables
=C2=A0=C2=A0=C2=A0 250653 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.=
8%=C2=A0=C2=A0=C2=A0=C2=A0 267784 =C2=B1=C2=A0 5%=C2=A0 numa-meminfo.node0.=
Unevictable
=C2=A0=C2=A0 2890241 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -58.3%=C2=A0=
=C2=A0=C2=A0 1206212 =C2=B1 10%=C2=A0 numa-meminfo.node0.Writeback
=C2=A0=C2=A0=C2=A0 338312 =C2=B1 83%=C2=A0=C2=A0=C2=A0 +111.9%=C2=A0=C2=A0=
=C2=A0=C2=A0 716979 =C2=B1 64%=C2=A0 numa-meminfo.node1.Dirty
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8444 =C2=B1 82%=C2=A0=C2=A0=C2=A0 +169.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 22785 =C2=B1 37%=C2=A0 numa-meminfo.node2.AnonH=
ugePages
=C2=A0=C2=A0=C2=A0 236489 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +142.5%=C2=A0=C2=A0=
=C2=A0=C2=A0 573382 =C2=B1 36%=C2=A0 numa-meminfo.node2.Dirty
=C2=A0=C2=A0 2484617 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +117.6%=C2=A0=C2=A0=C2=A0=
 5406277 =C2=B1 50%=C2=A0 numa-meminfo.node2.FilePages
=C2=A0=C2=A0 2459002 =C2=B1 19%=C2=A0=C2=A0=C2=A0 +115.1%=C2=A0=C2=A0=C2=A0=
 5290461 =C2=B1 51%=C2=A0 numa-meminfo.node2.Inactive
=C2=A0=C2=A0 2216704 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +131.7%=C2=A0=C2=A0=C2=A0=
 5135596 =C2=B1 53%=C2=A0 numa-meminfo.node2.Inactive(file)
=C2=A0=C2=A0=C2=A0 871702 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +52.8%=C2=A0=
=C2=A0=C2=A0 1331684 =C2=B1=C2=A0 6%=C2=A0 numa-meminfo.node2.Writeback
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3888 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -24.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2937 =C2=B1=C2=A0 6%=C2=A0 numa-memi=
nfo.node3.Active(anon)
=C2=A0=C2=A0=C2=A0=C2=A0 57796 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -49.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 29078 =C2=B1 34%=C2=A0 numa-meminfo.node3.KRecl=
aimable
=C2=A0=C2=A0=C2=A0=C2=A0 57796 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -49.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 29078 =C2=B1 34%=C2=A0 numa-meminfo.node3.SRecl=
aimable
=C2=A0=C2=A0=C2=A0 130240 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -30.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 91037 =C2=B1 15%=C2=A0 numa-meminfo.node3.Slab
=C2=A0=C2=A0=C2=A0=C2=A0 56616 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +45.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 82199 =C2=B1 19%=C2=A0 numa-vmstat.node0.nr_ano=
n_pages
=C2=A0=C2=A0=C2=A0=C2=A0 58314 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +42.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 83024 =C2=B1 20%=C2=A0 numa-vmstat.node0.nr_ina=
ctive_anon
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2172 =C2=B1 73%=C2=A0=C2=A0=C2=A0 +135.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5122 =C2=B1 28%=C2=A0 numa-vmstat.node0.n=
r_page_table_pages
=C2=A0=C2=A0=C2=A0=C2=A0 62662 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +6.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 66945 =C2=B1=C2=A0 5%=C2=A0 numa-vm=
stat.node0.nr_unevictable
=C2=A0=C2=A0=C2=A0 738434 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -59.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 300391 =C2=B1 10%=C2=A0 numa-vmstat.node0.nr_writeback
=C2=A0=C2=A0=C2=A0=C2=A0 58312 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +42.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 83023 =C2=B1 20%=C2=A0 numa-vmstat.node0.nr_zon=
e_inactive_anon
=C2=A0=C2=A0=C2=A0=C2=A0 62662 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +6.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 66945 =C2=B1=C2=A0 5%=C2=A0 numa-vm=
stat.node0.nr_zone_unevictable
=C2=A0=C2=A0=C2=A0 926442 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -53.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 434282 =C2=B1 12%=C2=A0 numa-vmstat.node0.nr_zone_wri=
te_pending
=C2=A0=C2=A0=C2=A0=C2=A0 84324 =C2=B1 81%=C2=A0=C2=A0=C2=A0 +112.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 178764 =C2=B1 64%=C2=A0 numa-vmstat.node1.nr_dirty
=C2=A0=C2=A0=C2=A0 427046 =C2=B1 84%=C2=A0=C2=A0=C2=A0=C2=A0 +74.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 746464 =C2=B1 46%=C2=A0 numa-vmstat.node1.nr_zone_write_=
pending
=C2=A0=C2=A0=C2=A0 627042 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +129.0%=C2=A0=C2=A0=
=C2=A0 1435752 =C2=B1 55%=C2=A0 numa-vmstat.node2.nr_dirtied
=C2=A0=C2=A0=C2=A0=C2=A0 59963 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +137.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 142585 =C2=B1 36%=C2=A0 numa-vmstat.node2.nr_dirty
=C2=A0=C2=A0=C2=A0 634106 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +112.1%=C2=A0=C2=A0=
=C2=A0 1345185 =C2=B1 50%=C2=A0 numa-vmstat.node2.nr_file_pages
=C2=A0=C2=A0=C2=A0 567086 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +125.3%=C2=A0=C2=A0=
=C2=A0 1277507 =C2=B1 53%=C2=A0 numa-vmstat.node2.nr_inactive_file
=C2=A0=C2=A0=C2=A0 223407 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +48.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 331299 =C2=B1=C2=A0 7%=C2=A0 numa-vmstat.node2.nr_writeb=
ack
=C2=A0=C2=A0=C2=A0 567087 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +125.3%=C2=A0=C2=A0=
=C2=A0 1277515 =C2=B1 53%=C2=A0 numa-vmstat.node2.nr_zone_inactive_file
=C2=A0=C2=A0=C2=A0 283372 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +67.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 473906 =C2=B1=C2=A0 8%=C2=A0 numa-vmstat.node2.nr_zone_w=
rite_pending
=C2=A0=C2=A0=C2=A0 922.00 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -20.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 737.25 =C2=B1=C2=A0 6%=C2=A0 numa-vmstat.node3.nr_active=
_anon
=C2=A0=C2=A0=C2=A0=C2=A0 14591 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -50.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7276 =C2=B1 35%=C2=A0 numa-vmstat.node3.n=
r_slab_reclaimable
=C2=A0=C2=A0=C2=A0 922.00 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -20.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 737.25 =C2=B1=C2=A0 6%=C2=A0 numa-vmstat.node3.nr_zone_a=
ctive_anon
=C2=A0=C2=A0=C2=A0 141466 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +523.4%=C2=A0=C2=A0=
=C2=A0=C2=A0 881964 =C2=B1 85%=C2=A0 numa-vmstat.node3.numa_other
=C2=A0=C2=A0=C2=A0 282981 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +46.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 414731 =C2=B1 12%=C2=A0 interrupts.CAL:Function_call_int=
errupts
=C2=A0=C2=A0=C2=A0 770.00 =C2=B1 51%=C2=A0=C2=A0=C2=A0=C2=A0 -56.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 335.00 =C2=B1 59%=C2=A0 interrupts.CPU0.NMI:Non-maskable=
_interrupts
=C2=A0=C2=A0=C2=A0 770.00 =C2=B1 51%=C2=A0=C2=A0=C2=A0=C2=A0 -56.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 335.00 =C2=B1 59%=C2=A0 interrupts.CPU0.PMI:Performance_=
monitoring_interrupts
=C2=A0=C2=A0=C2=A0 346.25 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -46.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 184.50 =C2=B1 23%=C2=A0 interrupts.CPU110.NMI:Non-maskab=
le_interrupts
=C2=A0=C2=A0=C2=A0 346.25 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -46.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 184.50 =C2=B1 23%=C2=A0 interrupts.CPU110.PMI:Performanc=
e_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1359 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +31.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1789 =C2=B1 17%=C2=A0 interrupts.CPU=
128.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1378 =C2=B1 14%=C2=A0=C2=A0 +2294.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 33020 =C2=B1164%=C2=A0 interrupts.CPU153.CAL:Funct=
ion_call_interrupts
=C2=A0=C2=A0=C2=A0 214.50 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0 +91.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 411.25 =C2=B1 39%=C2=A0 interrupts.CPU16.NMI:Non-maskabl=
e_interrupts
=C2=A0=C2=A0=C2=A0 214.50 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0 +91.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 411.25 =C2=B1 39%=C2=A0 interrupts.CPU16.PMI:Performance=
_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 403.50 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0 -40.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 241.00 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU169.NMI:Non-m=
askable_interrupts
=C2=A0=C2=A0=C2=A0 403.50 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0 -40.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 241.00 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU169.PMI:Perfo=
rmance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 439.00 =C2=B1 50%=C2=A0=C2=A0=C2=A0=C2=A0 -51.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 212.75 =C2=B1 22%=C2=A0 interrupts.CPU170.NMI:Non-maskab=
le_interrupts
=C2=A0=C2=A0=C2=A0 439.00 =C2=B1 50%=C2=A0=C2=A0=C2=A0=C2=A0 -51.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 212.75 =C2=B1 22%=C2=A0 interrupts.CPU170.PMI:Performanc=
e_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1062 =C2=B1116%=C2=A0=C2=A0=C2=A0=C2=A0 -77.=
3%=C2=A0=C2=A0=C2=A0=C2=A0 240.75 =C2=B1 23%=C2=A0 interrupts.CPU174.NMI:No=
n-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1062 =C2=B1116%=C2=A0=C2=A0=C2=A0=C2=A0 -77.=
3%=C2=A0=C2=A0=C2=A0=C2=A0 240.75 =C2=B1 23%=C2=A0 interrupts.CPU174.PMI:Pe=
rformance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 291.25 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0 -34.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 191.75 =C2=B1 30%=C2=A0 interrupts.CPU2.NMI:Non-maskable=
_interrupts
=C2=A0=C2=A0=C2=A0 291.25 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0 -34.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 191.75 =C2=B1 30%=C2=A0 interrupts.CPU2.PMI:Performance_=
monitoring_interrupts
=C2=A0=C2=A0=C2=A0 342.00 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -58.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 142.75 =C2=B1 16%=C2=A0 interrupts.CPU22.NMI:Non-maskabl=
e_interrupts
=C2=A0=C2=A0=C2=A0 342.00 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -58.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 142.75 =C2=B1 16%=C2=A0 interrupts.CPU22.PMI:Performance=
_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 241.25 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -42.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 138.50 =C2=B1 22%=C2=A0 interrupts.CPU23.NMI:Non-maskabl=
e_interrupts
=C2=A0=C2=A0=C2=A0 241.25 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -42.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 138.50 =C2=B1 22%=C2=A0 interrupts.CPU23.PMI:Performance=
_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1365 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2041 =C2=B1 24%=C2=A0 interrupts.CPU=
35.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 222.00 =C2=B1 94%=C2=A0=C2=A0=C2=A0 +175.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 610.75 =C2=B1 51%=C2=A0 interrupts.CPU63.NMI:Non-maskable_inte=
rrupts
=C2=A0=C2=A0=C2=A0 222.00 =C2=B1 94%=C2=A0=C2=A0=C2=A0 +175.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 610.75 =C2=B1 51%=C2=A0 interrupts.CPU63.PMI:Performance_monit=
oring_interrupts
=C2=A0=C2=A0=C2=A0 146.75 =C2=B1 39%=C2=A0=C2=A0=C2=A0 +104.6%=C2=A0=C2=A0=
=C2=A0=C2=A0 300.25 =C2=B1 32%=C2=A0 interrupts.CPU64.NMI:Non-maskable_inte=
rrupts
=C2=A0=C2=A0=C2=A0 146.75 =C2=B1 39%=C2=A0=C2=A0=C2=A0 +104.6%=C2=A0=C2=A0=
=C2=A0=C2=A0 300.25 =C2=B1 32%=C2=A0 interrupts.CPU64.PMI:Performance_monit=
oring_interrupts
=C2=A0=C2=A0=C2=A0 557.00 =C2=B1 88%=C2=A0=C2=A0=C2=A0=C2=A0 -61.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 215.75 =C2=B1 21%=C2=A0 interrupts.CPU74.NMI:Non-maskabl=
e_interrupts
=C2=A0=C2=A0=C2=A0 557.00 =C2=B1 88%=C2=A0=C2=A0=C2=A0=C2=A0 -61.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 215.75 =C2=B1 21%=C2=A0 interrupts.CPU74.PMI:Performance=
_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 319.25 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -43.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 179.25 =C2=B1 36%=C2=A0 interrupts.CPU75.NMI:Non-maskabl=
e_interrupts
=C2=A0=C2=A0=C2=A0 319.25 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 -43.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 179.25 =C2=B1 36%=C2=A0 interrupts.CPU75.PMI:Performance=
_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1343 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +23.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1652 =C2=B1=C2=A0 4%=C2=A0 interrupt=
s.CPU80.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1095 =C2=B1 66%=C2=A0=C2=A0=C2=A0=C2=A0 -76.=
5%=C2=A0=C2=A0=C2=A0=C2=A0 257.00 =C2=B1 17%=C2=A0 interrupts.CPU96.NMI:Non=
-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1095 =C2=B1 66%=C2=A0=C2=A0=C2=A0=C2=A0 -76.=
5%=C2=A0=C2=A0=C2=A0=C2=A0 257.00 =C2=B1 17%=C2=A0 interrupts.CPU96.PMI:Per=
formance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 817.25 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +62.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1329 =C2=B1 17%=C2=A0 interrupts.RES:Resched=
uling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 12.39 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.22 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 12.35 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.21 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 12.12 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.08 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 12.11 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.07 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 12.10 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.06 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.calltrace.cycles-pp.btrfs_file_write_iter.new_sync_write.vfs_write=
.ksys_write.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0 12.07 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.04 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.calltrace.cycles-pp.btrfs_buffered_write.btrfs_file_write_iter.new=
_sync_write.vfs_write.ksys_write
=C2=A0=C2=A0=C2=A0=C2=A0 12.28 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.83 =C2=B1=C2=A0 5%=C2=A0 perf=
-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.07 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.calltrace.cycles-pp.native_queued_spi=
n_lock_slowpath._raw_spin_lock.__reserve_bytes.btrfs_reserve_metadata_bytes=
.btrfs_delalloc_reserve_metadata
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.36 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.55 =C2=B1 11%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.btrfs_delalloc_reserve_metadata.btrfs_buffer=
ed_write.btrfs_file_write_iter.new_sync_write.vfs_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.31 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.51 =C2=B1 12%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__reserve_bytes.btrfs_reserve_metadata_bytes=
.btrfs_delalloc_reserve_metadata.btrfs_buffered_write.btrfs_file_write_iter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.31 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.51 =C2=B1 12%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.btrfs_reserve_metadata_bytes.btrfs_delalloc_=
reserve_metadata.btrfs_buffered_write.btrfs_file_write_iter.new_sync_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.13 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.38 =C2=B1 14%=C2=A0 pe=
rf-profile.calltrace.cycles-pp._raw_spin_lock.__reserve_bytes.btrfs_reserve=
_metadata_bytes.btrfs_delalloc_reserve_metadata.btrfs_buffered_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.39 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.21 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.btrfs_inode_rsv_release.btrfs_buffered_write=
.btrfs_file_write_iter.new_sync_write.vfs_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.38 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.20 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.btrfs_block_rsv_release.btrfs_inode_rsv_rele=
ase.btrfs_buffered_write.btrfs_file_write_iter.new_sync_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.21 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.09 =C2=B1 20%=C2=A0 pe=
rf-profile.calltrace.cycles-pp._raw_spin_lock.btrfs_block_rsv_release.btrfs=
_inode_rsv_release.btrfs_buffered_write.btrfs_file_write_iter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.calltrace.cycles-pp.tick_nohz_irq_exit.sysvec_apic_timer_i=
nterrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.51 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.04 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.calltrace.cycles-pp.asm_call_sysvec_on_stack.sysvec_api=
c_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuid=
le_enter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.48 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.02 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.asm_c=
all_sysvec_on_stack.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_inter=
rupt.cpuidle_enter_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.37 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.93 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_tim=
er_interrupt.asm_call_sysvec_on_stack.sysvec_apic_timer_interrupt.asm_sysve=
c_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit.devkmsg_emit.dev=
kmsg_write.cold.new_sync_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.vprintk_emit.devkmsg_emit.devkmsg_write.cold=
.new_sync_write.vfs_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.devkmsg_write.cold.new_sync_write.vfs_write.=
ksys_write.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.devkmsg_emit.devkmsg_write.cold.new_sync_wri=
te.vfs_write.ksys_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe.write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 27%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.62 =C2=B1=C2=A0 7%=C2=A0 perf-profile.calltrace.cycles-pp.ktime_get.tick_=
nohz_irq_exit.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.c=
puidle_enter_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.06 =C2=B1 21%=C2=A0 perf-profile.calltrace.cycles-pp.__cna_queued_spin_lo=
ck_slowpath._raw_spin_lock.btrfs_block_rsv_release.btrfs_inode_rsv_release.=
btrfs_buffered_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.48 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.68 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sys=
vec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.33 =C2=B1 15%=C2=A0 perf-profile.calltrace.cycles-pp.__cna_queued_spin_lo=
ck_slowpath._raw_spin_lock.__reserve_bytes.btrfs_reserve_metadata_bytes.btr=
fs_delalloc_reserve_metadata
=C2=A0=C2=A0=C2=A0=C2=A0 11.79 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14.63 =C2=B1=C2=A0 8%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_ente=
r_state.cpuidle_enter.do_idle.cpu_startup_entry
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.11 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.51 =C2=B1 18%=C2=A0 perf-pr=
ofile.calltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secon=
dary.secondary_startup_64_no_verify
=C2=A0=C2=A0=C2=A0=C2=A0 10.58 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 -10.6=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 perf-profile.children.cycles-pp.native_queued_spin_lock_slowpa=
th
=C2=A0=C2=A0=C2=A0=C2=A0 12.10 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.06 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.children.cycles-pp.btrfs_file_write_iter
=C2=A0=C2=A0=C2=A0=C2=A0 12.07 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -8.=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.04 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.children.cycles-pp.btrfs_buffered_write
=C2=A0=C2=A0=C2=A0=C2=A0 14.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.09 =C2=B1=C2=A0 7%=C2=A0 perf=
-profile.children.cycles-pp._raw_spin_lock
=C2=A0=C2=A0=C2=A0=C2=A0 12.64 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.85 =C2=B1=C2=A0 5%=C2=A0 perf=
-profile.children.cycles-pp.ksys_write
=C2=A0=C2=A0=C2=A0=C2=A0 12.62 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.83 =C2=B1=C2=A0 5%=C2=A0 perf=
-profile.children.cycles-pp.new_sync_write
=C2=A0=C2=A0=C2=A0=C2=A0 12.63 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.85 =C2=B1=C2=A0 5%=C2=A0 perf=
-profile.children.cycles-pp.vfs_write
=C2=A0=C2=A0=C2=A0=C2=A0 13.17 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.60 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.children.cycles-pp.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0 13.24 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -7.=
3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.92 =C2=B1=C2=A0 6%=C2=A0 perf=
-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.38 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.55 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.__reserve_bytes
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.33 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.52 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.btrfs_reserve_metadata_bytes
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.36 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.55 =C2=B1 11%=C2=A0 pe=
rf-profile.children.cycles-pp.btrfs_delalloc_reserve_metadata
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.49 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.23 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.btrfs_block_rsv_release
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.39 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.21 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.btrfs_inode_rsv_release
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 77%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 7%=C2=
=A0 perf-profile.children.cycles-pp.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 77%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 7%=C2=
=A0 perf-profile.children.cycles-pp.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 75%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.children.cycles-pp.do_sys_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 75%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.children.cycles-pp.do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 29%=C2=A0 pe=
rf-profile.children.cycles-pp.rcu_sched_clock_irq
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 6%=
=C2=A0 perf-profile.children.cycles-pp.update_blocked_averages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 29%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 70%=C2=A0 pe=
rf-profile.children.cycles-pp.update_ts_time_stats
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 58%=C2=A0 pe=
rf-profile.children.cycles-pp.__pagevec_lru_add_fn
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 12%=C2=A0=
 perf-profile.children.cycles-pp.brd_lookup_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.__radix_tree_lookup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1=C2=A0 9%=
=C2=A0 perf-profile.children.cycles-pp.__intel_pmu_enable_all
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1=C2=A0 8%=
=C2=A0 perf-profile.children.cycles-pp._raw_spin_lock_irqsave
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1 29%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 27%=C2=A0 pe=
rf-profile.children.cycles-pp.write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.65 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.children.cycles-pp.tick_nohz_irq_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1 27%=C2=A0 pe=
rf-profile.children.cycles-pp.devkmsg_write.cold
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1 27%=C2=A0 pe=
rf-profile.children.cycles-pp.devkmsg_emit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1108%=C2=A0 pe=
rf-profile.children.cycles-pp.osq_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1107%=C2=A0 pe=
rf-profile.children.cycles-pp.__mutex_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1130%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 68%=C2=A0 pe=
rf-profile.children.cycles-pp.__do_sys_finit_module
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1130%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 68%=C2=A0 pe=
rf-profile.children.cycles-pp.load_module
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1130%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 67%=C2=A0 pe=
rf-profile.children.cycles-pp.syscall
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 88%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 53%=C2=A0 pe=
rf-profile.children.cycles-pp.wb_workfn
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 88%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 53%=C2=A0 pe=
rf-profile.children.cycles-pp.wb_writeback
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 88%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 53%=C2=A0 pe=
rf-profile.children.cycles-pp.writeback_sb_inodes
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1105%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1 54%=C2=A0 pe=
rf-profile.children.cycles-pp.__writeback_single_inode
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.76 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.21 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.65 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.13 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.children.cycles-pp.hrtimer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.15 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.65 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.children.cycles-pp.asm_call_sysvec_on_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.06 =C2=B1 28%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.05 =C2=B1=C2=A0 9%=C2=
=A0 perf-profile.children.cycles-pp.ktime_get
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.80 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.94 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0 10.10 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.05 =C2=B1=C2=A0 6%=C2=A0 pe=
rf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
2.56 =C2=B1 19%=C2=A0 perf-profile.children.cycles-pp.__cna_queued_spin_loc=
k_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.16 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.57 =C2=B1 18%=C2=A0 perf-pr=
ofile.children.cycles-pp.menu_select
=C2=A0=C2=A0=C2=A0=C2=A0 10.50 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 -10.5=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 27%=C2=A0 pe=
rf-profile.self.cycles-pp.rcu_sched_clock_irq
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 10%=C2=A0 pe=
rf-profile.self.cycles-pp.__extent_writepage
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1=C2=A0 9%=
=C2=A0 perf-profile.self.cycles-pp.__intel_pmu_enable_all
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 22%=C2=A0 pe=
rf-profile.self.cycles-pp.end_page_writeback
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1173%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1105%=C2=A0 pe=
rf-profile.self.cycles-pp.osq_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.77 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.75 =C2=B1 10%=C2=A0 pe=
rf-profile.self.cycles-pp.ktime_get
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
2.51 =C2=B1 19%=C2=A0 perf-profile.self.cycles-pp.__cna_queued_spin_lock_sl=
owpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.68 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.79 =C2=B1 21%=C2=A0 perf-pr=
ofile.self.cycles-pp.menu_select



***************************************************************************=
************************
lkp-csl-2ap3: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz with=
 192G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/te=
stcase/ucode:
=C2=A0 gcc-9/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-20200603.c=
gz/300s/lkp-csl-2ap3/new_fserver/reaim/0x5003003

commit: =

=C2=A0 cb45bab007 ("locking/qspinlock: Refactor the qspinlock slow path")
=C2=A0 0e8d8f4f12 ("locking/qspinlock: Introduce CNA into the slow path of =
qspinlock")

cb45bab007ff0cfc 0e8d8f4f1214cfbac219d6917b5 =

---------------- --------------------------- =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=C2=A0=C2=
=A0=C2=A0 fail:runs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 =

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:4=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :4=C2=A0=C2=A0=C2=A0=C2=A0 last_state.=
is_incomplete_run
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:4=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :4=C2=A0=C2=A0=C2=A0=C2=A0 last_state.=
wget_initrd
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :4=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:4=C2=A0=C2=A0=C2=A0=C2=A0 perf=
-profile.children.cycles-pp.error_entry
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0 =

=C2=A0=C2=A0=C2=A0 556.93=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -64.1%=C2=A0=C2=A0=C2=A0=C2=A0 200.03=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reaim.child_systime
=C2=A0=C2=A0=C2=A0=C2=A0 49.95=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +3.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 51.77=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reaim.child_utime
=C2=A0=C2=A0=C2=A0 318145=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +96.1%=C2=A0=C2=A0=C2=A0=C2=A0 623983=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reaim.jobs_per_min
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1657=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +96.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3249=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reaim.jobs_per_min_child
=C2=A0=C2=A0=C2=A0=C2=A0 92.26=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -7.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 85.11=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reaim.jti
=C2=A0=C2=A0=C2=A0 327019=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +100.4%=C2=A0=C2=A0=C2=A0=C2=A0 655467=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 reaim.max_jobs_per_min
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.55=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -49.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.81=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reaim.parent_time
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.19 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0 +100.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14.38 =C2=B1=C2=A0 4%=C2=A0 reaim.std_dev_=
percent
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -7.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1=C2=A0 2%=C2=A0=
 reaim.std_dev_time
=C2=A0=C2=A0=C2=A0 462973=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +17.9%=C2=A0=C2=A0=C2=A0=C2=A0 545826=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reaim.time.involuntary_context_switches
=C2=A0=C2=A0=C2=A0=C2=A0 38288=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +98.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 75996 =C2=B1=C2=A0 2%=
=C2=A0 reaim.time.major_page_faults
=C2=A01.041e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +44.8%=C2=A0 1.509e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reaim.tim=
e.minor_page_faults
=C2=A0=C2=A0=C2=A0=C2=A0 10863=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -39.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6549=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reaim.time.percent_of_cpu_this_job_got
=C2=A0=C2=A0=C2=A0=C2=A0 30257=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -47.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15754=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 reaim.time.system_time
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2714=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +50.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4077=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reaim.time.user_time
=C2=A0=C2=A0 3000456 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +38.9%=C2=A0=
=C2=A0=C2=A0 4167220 =C2=B1=C2=A0 2%=C2=A0 reaim.time.voluntary_context_swi=
tches
=C2=A0=C2=A0 1043200=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +44.9%=C2=A0=C2=A0=C2=A0 1512000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 reaim.workload
=C2=A0=C2=A0=C2=A0=C2=A0 29843=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41767=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 uptime.idle
=C2=A0 20127118 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +48.7%=C2=A0=C2=A0 29930=
674 =C2=B1=C2=A0 4%=C2=A0 cpuidle.C1.time
=C2=A0=C2=A0=C2=A0 284217 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +66.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 472177 =C2=B1=C2=A0 2%=C2=A0 cpuidle.C1.usage
=C2=A0=C2=A0=C2=A0 308815 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +26.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 389201 =C2=B1 16%=C2=A0 cpuidle.POLL.usage
=C2=A0=C2=A0=C2=A0=C2=A0 41.44=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +20.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 62.28=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mpstat.cpu.all.idle%
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.69=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.98 =C2=B1=C2=A0 2%=C2=A0 mpstat.cpu.all.soft%
=C2=A0=C2=A0=C2=A0=C2=A0 51.88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -24.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27.26=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mpstat.cpu.all.sys%
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.60=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.91=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mpstat.cpu.all.usr%
=C2=A0=C2=A0=C2=A0=C2=A0 41.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +50.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 62.00=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstat.cpu.id
=C2=A0=C2=A0=C2=A0=C2=A0 53.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -43.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.00=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstat.cpu.sy
=C2=A0=C2=A0=C2=A0 110.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -25.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 81.50 =C2=B1=C2=A0 2%=C2=
=A0 vmstat.procs.r
=C2=A0=C2=A0=C2=A0=C2=A0 25559 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37370=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 vmstat.system.cs
=C2=A0=C2=A0=C2=A0 269427 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -12.8%=C2=
=A0=C2=A0=C2=A0=C2=A0 234969=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memi=
nfo.Active
=C2=A0=C2=A0=C2=A0 269427 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -12.8%=C2=
=A0=C2=A0=C2=A0=C2=A0 234969=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memi=
nfo.Active(anon)
=C2=A0=C2=A0=C2=A0=C2=A0 32953=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +9.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36144 =C2=B1=C2=
=A0 2%=C2=A0 meminfo.KernelStack
=C2=A0=C2=A0=C2=A0=C2=A0 19202=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +63.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31338=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 meminfo.PageTables
=C2=A0=C2=A0=C2=A0 483410=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +11.8%=C2=A0=C2=A0=C2=A0=C2=A0 540459=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 meminfo.SUnreclaim
=C2=A0=C2=A0=C2=A0 304770 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -12.8%=C2=
=A0=C2=A0=C2=A0=C2=A0 265628=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memi=
nfo.Shmem
=C2=A0=C2=A0=C2=A0 620741=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +10.5%=C2=A0=C2=A0=C2=A0=C2=A0 685878=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 meminfo.Slab
=C2=A0 18788579=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +43.8%=C2=A0=C2=A0 27017272 =C2=B1=C2=A0 4%=C2=A0 numa-numastat.node0.loca=
l_node
=C2=A0 18827783=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +43.8%=C2=A0=C2=A0 27074532 =C2=B1=C2=A0 4%=C2=A0 numa-numastat.node0.numa=
_hit
=C2=A0 19046024=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +45.8%=C2=A0=C2=A0 27771991 =C2=B1=C2=A0 2%=C2=A0 numa-numastat.node1.loca=
l_node
=C2=A0 19126483=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +45.6%=C2=A0=C2=A0 27844754 =C2=B1=C2=A0 2%=C2=A0 numa-numastat.node1.numa=
_hit
=C2=A0 18849870=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +44.4%=C2=A0=C2=A0 27228340 =C2=B1=C2=A0 2%=C2=A0 numa-numastat.node2.loca=
l_node
=C2=A0 18926181=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +44.1%=C2=A0=C2=A0 27271719 =C2=B1=C2=A0 2%=C2=A0 numa-numastat.node2.numa=
_hit
=C2=A0 18622314=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +46.2%=C2=A0=C2=A0 27216882 =C2=B1=C2=A0 3%=C2=A0 numa-numastat.node3.loca=
l_node
=C2=A0 18686267=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +46.1%=C2=A0=C2=A0 27303516 =C2=B1=C2=A0 3%=C2=A0 numa-numastat.node3.numa=
_hit
=C2=A0=C2=A0=C2=A0=C2=A0 42977 =C2=B1 81%=C2=A0=C2=A0=C2=A0=C2=A0 -79.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8629 =C2=B1 59%=C2=A0 numa-meminfo.node0.=
Active
=C2=A0=C2=A0=C2=A0=C2=A0 42977 =C2=B1 81%=C2=A0=C2=A0=C2=A0=C2=A0 -79.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8629 =C2=B1 59%=C2=A0 numa-meminfo.node0.=
Active(anon)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7040=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +24.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8759 =C2=
=B1=C2=A0 8%=C2=A0 numa-meminfo.node1.KernelStack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2790 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +140.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6708 =C2=B1 26%=C2=A0 numa-meminfo.node1.=
PageTables
=C2=A0=C2=A0=C2=A0 103698=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +19.3%=C2=A0=C2=A0=C2=A0=C2=A0 123717 =C2=B1=C2=A0 9%=C2=A0 nu=
ma-meminfo.node1.SUnreclaim
=C2=A0=C2=A0=C2=A0 129487 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +18.0%=C2=
=A0=C2=A0=C2=A0=C2=A0 152790 =C2=B1=C2=A0 7%=C2=A0 numa-meminfo.node1.Slab
=C2=A0=C2=A0=C2=A0=C2=A0 32541 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 +46.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 47695 =C2=B1 24%=C2=A0 numa-meminfo.node2.KRecl=
aimable
=C2=A0=C2=A0=C2=A0=C2=A0 32541 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 +46.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 47695 =C2=B1 24%=C2=A0 numa-meminfo.node2.SRecl=
aimable
=C2=A0=C2=A0=C2=A0 150472 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 +21.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 182840 =C2=B1 15%=C2=A0 numa-meminfo.node2.Slab
=C2=A0=C2=A0=C2=A0 167884 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0 +71.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 287506 =C2=B1 45%=C2=A0 numa-meminfo.node3.AnonPages.max
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2974 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +145.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7288 =C2=B1 28%=C2=A0 numa-meminfo.node3.=
PageTables
=C2=A0=C2=A0=C2=A0 109568 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +13.7%=C2=
=A0=C2=A0=C2=A0=C2=A0 124544 =C2=B1 12%=C2=A0 numa-meminfo.node3.SUnreclaim
=C2=A0=C2=A0=C2=A0=C2=A0 10666 =C2=B1 81%=C2=A0=C2=A0=C2=A0=C2=A0 -79.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2152 =C2=B1 59%=C2=A0 numa-vmstat.node0.n=
r_active_anon
=C2=A0=C2=A0=C2=A0=C2=A0 10665 =C2=B1 81%=C2=A0=C2=A0=C2=A0=C2=A0 -79.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2152 =C2=B1 59%=C2=A0 numa-vmstat.node0.n=
r_zone_active_anon
=C2=A0=C2=A0 9854862=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +41.8%=C2=A0=C2=A0 13975810 =C2=B1=C2=A0 2%=C2=A0 numa-vmstat.node0.=
numa_hit
=C2=A0=C2=A0 9773079=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +41.9%=C2=A0=C2=A0 13870000 =C2=B1=C2=A0 2%=C2=A0 numa-vmstat.node0.=
numa_local
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7029=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +25.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8796 =C2=
=B1=C2=A0 8%=C2=A0 numa-vmstat.node1.nr_kernel_stack
=C2=A0=C2=A0=C2=A0 678.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +152.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1714 =C2=B1 26%=C2=A0 numa-vmstat.node1.nr_p=
age_table_pages
=C2=A0=C2=A0=C2=A0=C2=A0 25872=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +20.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31062 =C2=B1=C2=A0 9%=
=C2=A0 numa-vmstat.node1.nr_slab_unreclaimable
=C2=A0=C2=A0 9970820=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +42.6%=C2=A0=C2=A0 14214395=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 numa-vmstat.node1.numa_hit
=C2=A0=C2=A0 9810384=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +43.4%=C2=A0=C2=A0 14063434=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 numa-vmstat.node1.numa_local
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8132 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11904 =C2=B1 24%=C2=A0 numa-vmstat.node2.n=
r_slab_reclaimable
=C2=A0=C2=A0 9969168=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +43.4%=C2=A0=C2=A0 14294976 =C2=B1=C2=A0 2%=C2=A0 numa-vmstat.node2.=
numa_hit
=C2=A0=C2=A0 9812426=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +44.6%=C2=A0=C2=A0 14186949 =C2=B1=C2=A0 3%=C2=A0 numa-vmstat.node2.=
numa_local
=C2=A0=C2=A0=C2=A0 726.67 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +158.7%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1879 =C2=B1 26%=C2=A0 numa-vmstat.node3.nr_page_ta=
ble_pages
=C2=A0=C2=A0=C2=A0=C2=A0 27327 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +13.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31114 =C2=B1 12%=C2=A0 numa-vmstat.node3.n=
r_slab_unreclaimable
=C2=A0=C2=A0 9719726=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +44.0%=C2=A0=C2=A0 13991557 =C2=B1=C2=A0 2%=C2=A0 numa-vmstat.node3.=
numa_hit
=C2=A0=C2=A0 9615461=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +44.1%=C2=A0=C2=A0 13853485 =C2=B1=C2=A0 2%=C2=A0 numa-vmstat.node3.=
numa_local
=C2=A0=C2=A0=C2=A0 104269 =C2=B1 49%=C2=A0=C2=A0=C2=A0=C2=A0 +32.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 138078 =C2=B1 20%=C2=A0 numa-vmstat.node3.numa_other
=C2=A0=C2=A0=C2=A0=C2=A0 67226 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -12.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 58905=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 proc-vmstat.nr_active_anon
=C2=A0=C2=A0=C2=A0 316527=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -3.1%=C2=A0=C2=A0=C2=A0=C2=A0 306823=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_file_pages
=C2=A0=C2=A0=C2=A0=C2=A0 92663=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -2.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 89935=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_inactive_anon
=C2=A0=C2=A0=C2=A0=C2=A0 33012=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +9.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36075 =C2=B1=C2=
=A0 2%=C2=A0 proc-vmstat.nr_kernel_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4865=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +59.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7749 =C2=
=B1=C2=A0 4%=C2=A0 proc-vmstat.nr_page_table_pages
=C2=A0=C2=A0=C2=A0=C2=A0 76214 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -12.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 66510=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 proc-vmstat.nr_shmem
=C2=A0=C2=A0=C2=A0=C2=A0 34346=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +5.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36334=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_slab_reclaimable
=C2=A0=C2=A0=C2=A0 120937=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +11.5%=C2=A0=C2=A0=C2=A0=C2=A0 134852=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_slab_unreclaimable
=C2=A0=C2=A0=C2=A0=C2=A0 67226 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -12.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 58905=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 proc-vmstat.nr_zone_active_anon
=C2=A0=C2=A0=C2=A0=C2=A0 92663=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -2.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 89935=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_zone_inactive_anon
=C2=A0=C2=A0=C2=A0 152011 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -72.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 42500 =C2=B1 30%=C2=A0 proc-vmstat.numa_hint_fa=
ults
=C2=A0 75604538=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +44.9%=C2=A0 1.095e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmst=
at.numa_hit
=C2=A0 75344552=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +45.0%=C2=A0 1.093e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmst=
at.numa_local
=C2=A0=C2=A0=C2=A0 129725 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -78.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 27855 =C2=B1 33%=C2=A0 proc-vmstat.numa_pages_migr=
ated
=C2=A0=C2=A0=C2=A0 440421 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -27.0%=C2=
=A0=C2=A0=C2=A0=C2=A0 321634 =C2=B1 22%=C2=A0 proc-vmstat.numa_pte_updates
=C2=A0=C2=A0=C2=A0 187992 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +5.=
4%=C2=A0=C2=A0=C2=A0=C2=A0 198156=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 proc-vmstat.pgactivate
=C2=A0 83223343=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +45.7%=C2=A0 1.213e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmst=
at.pgalloc_normal
=C2=A01.056e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +44.3%=C2=A0 1.524e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmst=
at.pgfault
=C2=A0 83115624=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +45.8%=C2=A0 1.212e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmst=
at.pgfree
=C2=A0=C2=A0=C2=A0 129725 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -78.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 27855 =C2=B1 33%=C2=A0 proc-vmstat.pgmigrate_succe=
ss
=C2=A0 10628125=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +46.1%=C2=A0=C2=A0 15525117=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc=
-vmstat.pgreuse
=C2=A0=C2=A0=C2=A0=C2=A0 13330 =C2=B1 54%=C2=A0=C2=A0=C2=A0 +717.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 108933 =C2=B1 77%=C2=A0 sched_debug.cfs_rq:/.MIN_vruntim=
e.avg
=C2=A0=C2=A0=C2=A0 184231 =C2=B1 54%=C2=A0=C2=A0=C2=A0 +190.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 535537 =C2=B1 48%=C2=A0 sched_debug.cfs_rq:/.MIN_vruntime.stdd=
ev
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6040 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0 +338.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26486 =C2=B1 51%=C2=A0 sched_debug.cfs_rq:=
/.load.avg
=C2=A0=C2=A0=C2=A0 284313 =C2=B1 37%=C2=A0=C2=A0=C2=A0 +159.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 738429 =C2=B1 14%=C2=A0 sched_debug.cfs_rq:/.load.max
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1180 =C2=B1 35%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sched_debug.cfs_rq:/.load.min
=C2=A0=C2=A0=C2=A0=C2=A0 22088 =C2=B1 35%=C2=A0=C2=A0=C2=A0 +398.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 110141 =C2=B1 30%=C2=A0 sched_debug.cfs_rq:/.load.stddev
=C2=A0=C2=A0=C2=A0=C2=A0 13330 =C2=B1 54%=C2=A0=C2=A0=C2=A0 +717.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 108933 =C2=B1 77%=C2=A0 sched_debug.cfs_rq:/.max_vruntim=
e.avg
=C2=A0=C2=A0=C2=A0 184231 =C2=B1 54%=C2=A0=C2=A0=C2=A0 +190.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 535537 =C2=B1 48%=C2=A0 sched_debug.cfs_rq:/.max_vruntime.stdd=
ev
=C2=A0 16468615=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -51.1%=C2=A0=C2=A0=C2=A0 8045534 =C2=B1 11%=C2=A0 sched_debug.cfs_rq:/.min=
_vruntime.avg
=C2=A0 16715699=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -50.1%=C2=A0=C2=A0=C2=A0 8341867 =C2=B1 11%=C2=A0 sched_debug.cfs_rq:/.min=
_vruntime.max
=C2=A0 15817769=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -51.3%=C2=A0=C2=A0=C2=A0 7697369 =C2=B1 11%=C2=A0 sched_debug.cfs_rq:/.min=
_vruntime.min
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.71 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 -47.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 14%=C2=A0 sched_debug.cf=
s_rq:/.nr_running.avg
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.17=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +19.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.39 =C2=
=B1=C2=A0 4%=C2=A0 sched_debug.cfs_rq:/.nr_running.max
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 35%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sched_debug.cfs_rq:/.nr_running.min
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +74.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1=C2=A0 6%=C2=A0 sched_deb=
ug.cfs_rq:/.nr_running.stddev
=C2=A0=C2=A0=C2=A0 694.83 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -51.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 334.48 =C2=B1 20%=C2=A0 sched_debug.cfs_rq:/.runnable_av=
g.avg
=C2=A0=C2=A0=C2=A0 110.72 =C2=B1 51%=C2=A0=C2=A0=C2=A0=C2=A0 -90.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 10.63 =C2=B1114%=C2=A0 sched_debug.cfs_rq:/.runnab=
le_avg.min
=C2=A0=C2=A0=C2=A0 155.35 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +42.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 221.31 =C2=B1=C2=A0 9%=C2=A0 sched_debug.cfs_rq:/.runnab=
le_avg.stddev
=C2=A0=C2=A0=C2=A0=C2=A0 64422 =C2=B1 94%=C2=A0=C2=A0=C2=A0 +295.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 254650 =C2=B1 19%=C2=A0 sched_debug.cfs_rq:/.spread0.avg
=C2=A0=C2=A0=C2=A0 311765 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +76.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 550961 =C2=B1 14%=C2=A0 sched_debug.cfs_rq:/.spread0.max
=C2=A0=C2=A0 -587893=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -84.1%=C2=A0=C2=A0=C2=A0=C2=A0 -93210=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sched_debug.cfs_rq:/.spread0.min
=C2=A0=C2=A0=C2=A0 685.90 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -56.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 297.04 =C2=B1 23%=C2=A0 sched_debug.cfs_rq:/.util_avg.avg
=C2=A0=C2=A0=C2=A0 100.39 =C2=B1 59%=C2=A0=C2=A0=C2=A0=C2=A0 -90.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.12 =C2=B1125%=C2=A0 sched_debug.cfs_rq:/.u=
til_avg.min
=C2=A0=C2=A0=C2=A0 153.19 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +28.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 196.53 =C2=B1 12%=C2=A0 sched_debug.cfs_rq:/.util_avg.st=
ddev
=C2=A0=C2=A0=C2=A0 398.32 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -79.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 81.24 =C2=B1 25%=C2=A0 sched_debug.cfs_rq:/.util_e=
st_enqueued.avg
=C2=A0=C2=A0=C2=A0 932.06 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 -26.5%=C2=
=A0=C2=A0=C2=A0=C2=A0 684.67 =C2=B1 16%=C2=A0 sched_debug.cfs_rq:/.util_est=
_enqueued.max
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 28%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sched_debug.cfs_rq:/.util_est_enqueued.min
=C2=A0=C2=A0=C2=A0 186.70 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 -31.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 128.84 =C2=B1 18%=C2=A0 sched_debug.cfs_rq:/.util_est_en=
queued.stddev
=C2=A0=C2=A0=C2=A0=C2=A0 42223 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 +72.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 72869 =C2=B1 21%=C2=A0 sched_debug.cpu.avg_idle=
.min
=C2=A0=C2=A0=C2=A0 513534 =C2=B1 67%=C2=A0=C2=A0=C2=A0=C2=A0 -58.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 214959 =C2=B1=C2=A0 3%=C2=A0 sched_debug.cpu.avg_idle.st=
ddev
=C2=A0=C2=A0=C2=A0=C2=A0 69440 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -53.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 32566 =C2=B1 23%=C2=A0 sched_debug.cpu.curr->pi=
d.avg
=C2=A0=C2=A0=C2=A0 465.44 =C2=B1 54%=C2=A0=C2=A0=C2=A0 -100.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sch=
ed_debug.cpu.curr->pid.min
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.71 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 -40.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1=C2=A0 9%=C2=A0 sched_deb=
ug.cpu.nr_running.avg
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 35%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sched_debug.cpu.nr_running.min
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +68.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1=C2=A0 5%=C2=A0 sched_deb=
ug.cpu.nr_running.stddev
=C2=A0=C2=A0=C2=A0=C2=A0 21723 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +35.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29395 =C2=B1=C2=A0 9%=C2=A0 sched_debug.cp=
u.nr_switches.avg
=C2=A0=C2=A0=C2=A0=C2=A0 37415 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +23.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 46248 =C2=B1=C2=A0 5%=C2=A0 sched_debug.cpu.nr_=
switches.max
=C2=A0=C2=A0=C2=A0=C2=A0 17608=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +44.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25417 =C2=B1 10%=C2=A0=
 sched_debug.cpu.nr_switches.min
=C2=A0=C2=A0=C2=A0 161.39 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +47.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 237.34 =C2=B1 18%=C2=A0 sched_debug.cpu.nr_uninterruptib=
le.max
=C2=A0=C2=A0=C2=A0 -54.78=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +48.6%=C2=A0=C2=A0=C2=A0=C2=A0 -81.42=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sched_debug.cpu.nr_uninterruptible.min
=C2=A0=C2=A0=C2=A0=C2=A0 24.07 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +58.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38.15 =C2=B1 11%=C2=A0 sched_debug.cpu.nr_=
uninterruptible.stddev
=C2=A0=C2=A0=C2=A0=C2=A0 11566=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +11.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12849=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.Acpi-State.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0 11566=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +11.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12849=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.Acpi-State.num_objs
=C2=A0=C2=A0=C2=A0 240075=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +13.6%=C2=A0=C2=A0=C2=A0=C2=A0 272838=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 slabinfo.dentry.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5793=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +13.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6580=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.dentry.active_slabs
=C2=A0=C2=A0=C2=A0 243365=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +13.6%=C2=A0=C2=A0=C2=A0=C2=A0 276386=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 slabinfo.dentry.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5793=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +13.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6580=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.dentry.num_slabs
=C2=A0=C2=A0=C2=A0 955.00 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +16.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1112 =C2=B1=C2=A0 7%=C2=A0 slabinfo.file_=
lock_cache.active_objs
=C2=A0=C2=A0=C2=A0 955.00 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +16.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1112 =C2=B1=C2=A0 7%=C2=A0 slabinfo.file_=
lock_cache.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0 14271=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +14.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16366=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.files_cache.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0 14271=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +14.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16366=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.files_cache.num_objs
=C2=A0=C2=A0=C2=A0 145916=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +52.7%=C2=A0=C2=A0=C2=A0=C2=A0 222770 =C2=B1=C2=A0 2%=C2=A0 sl=
abinfo.filp.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2300=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +53.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3519 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.filp.active_slabs
=C2=A0=C2=A0=C2=A0 147261=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +53.0%=C2=A0=C2=A0=C2=A0=C2=A0 225274 =C2=B1=C2=A0 2%=C2=A0 sl=
abinfo.filp.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2300=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +53.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3519 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.filp.num_slabs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1319 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +26.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1664 =C2=B1=C2=A0 8%=C2=A0 slabinfo.=
khugepaged_mm_slot.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1319 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +26.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1664 =C2=B1=C2=A0 8%=C2=A0 slabinfo.=
khugepaged_mm_slot.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1037=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +19.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1240=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.kmalloc-512.active_slabs
=C2=A0=C2=A0=C2=A0=C2=A0 66437=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +19.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 79424=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.kmalloc-512.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1037=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +19.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1240=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.kmalloc-512.num_slabs
=C2=A0=C2=A0=C2=A0 114959=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +9.0%=C2=A0=C2=A0=C2=A0=C2=A0 125273=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.kmalloc-8.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4536 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4862 =C2=B1=C2=A0 3%=C2=A0=
 slabinfo.kmalloc-rcl-64.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4536 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4862 =C2=B1=C2=A0 3%=C2=A0=
 slabinfo.kmalloc-rcl-64.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0 10920=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +18.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12978=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.mm_struct.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0 10920=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +18.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12979=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.mm_struct.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1104 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -16.9%=C2=A0=C2=A0=C2=A0=C2=A0 917.00 =C2=B1 10%=C2=A0 slabinfo.mnt_cache.=
active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1104 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -16.9%=C2=A0=C2=A0=C2=A0=C2=A0 917.00 =C2=B1 10%=C2=A0 slabinfo.mnt_cache.=
num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1551=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +14.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1773 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.names_cache.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1551=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +14.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1773 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.names_cache.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0 35694 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 53295 =C2=B1=C2=A0 4%=C2=A0 slabinfo.pid.a=
ctive_objs
=C2=A0=C2=A0=C2=A0 557.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +49.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 832.25 =C2=B1=C2=A0 4%=C2=A0 slabinfo.pid.active_slabs
=C2=A0=C2=A0=C2=A0=C2=A0 35694 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 53295 =C2=B1=C2=A0 4%=C2=A0 slabinfo.pid.n=
um_objs
=C2=A0=C2=A0=C2=A0 557.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +49.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 832.25 =C2=B1=C2=A0 4%=C2=A0 slabinfo.pid.num_slabs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8786=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +20.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10558=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.sighand_cache.active_objs
=C2=A0=C2=A0=C2=A0 590.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0 709.75=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 slabinfo.sighand_cache.active_slabs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8858=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10654=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.sighand_cache.num_objs
=C2=A0=C2=A0=C2=A0 590.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0 709.75=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 slabinfo.sighand_cache.num_slabs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8502=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9489 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.sock_inode_cache.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8502=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9489 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.sock_inode_cache.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0 39805 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 57892 =C2=B1=C2=A0 2%=C2=A0 slabinfo.task_=
delay_info.active_objs
=C2=A0=C2=A0=C2=A0 780.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1135 =C2=B1=C2=A0 2%=C2=A0 slabinfo.task_=
delay_info.active_slabs
=C2=A0=C2=A0=C2=A0=C2=A0 39805 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 57905 =C2=B1=C2=A0 2%=C2=A0 slabinfo.task_=
delay_info.num_objs
=C2=A0=C2=A0=C2=A0 780.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1135 =C2=B1=C2=A0 2%=C2=A0 slabinfo.task_=
delay_info.num_slabs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3088=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +29.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3992 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.task_struct.active_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3098=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +29.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4005 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.task_struct.active_slabs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3098=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +29.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4005 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.task_struct.num_objs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3098=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +29.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4005 =C2=
=B1=C2=A0 2%=C2=A0 slabinfo.task_struct.num_slabs
=C2=A01.353e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +11.8%=C2=A0 1.513e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.i.branch-instructions
=C2=A0 84012986 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +46.6%=C2=A0 1.232e=
+08 =C2=B1=C2=A0 6%=C2=A0 perf-stat.i.branch-misses
=C2=A0=C2=A0=C2=A0=C2=A0 31.81 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -10.8=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.01 =C2=B1 21%=C2=A0 perf-stat.i.cache-=
miss-rate%
=C2=A0 68723351 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -10.6%=C2=A0=C2=A0 =
61409511 =C2=B1=C2=A0 4%=C2=A0 perf-stat.i.cache-misses
=C2=A02.121e+08 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +57.2%=C2=A0 3.333e+08 =
=C2=B1=C2=A0 8%=C2=A0 perf-stat.i.cache-references
=C2=A0=C2=A0=C2=A0=C2=A0 25583 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +51.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38727=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-stat.i.context-switches
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.21 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.90 =C2=B1=C2=A0 5%=C2=A0 perf=
-stat.i.cpi
=C2=A0=C2=A0=C2=A0 192200=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +7.5%=C2=A0=C2=A0=C2=A0=C2=A0 206633=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.cpu-clock
=C2=A0 3.37e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -28.3%=C2=A0 2.415e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.i.cpu-cycles
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3432=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +61.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5541 =C2=
=B1=C2=A0 3%=C2=A0 perf-stat.i.cpu-migrations
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4302=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -29.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3039 =C2=
=B1=C2=A0 8%=C2=A0 perf-stat.i.cycles-between-cache-misses
=C2=A0=C2=A0 2726072 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 +52.3%=C2=A0=C2=A0=
=C2=A0 4151327 =C2=B1 26%=C2=A0 perf-stat.i.dTLB-load-misses
=C2=A01.215e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +6.3%=C2=A0 1.292e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf=
-stat.i.dTLB-loads
=C2=A0=C2=A0=C2=A0 941111 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +46.9%=C2=A0=
=C2=A0=C2=A0 1382681 =C2=B1 11%=C2=A0 perf-stat.i.dTLB-store-misses
=C2=A02.493e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +48.4%=C2=A0 3.701e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.i.dTLB-stores
=C2=A0=C2=A0=C2=A0=C2=A0 71.80 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 65.13=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 perf-stat.i.iTLB-load-miss-rate%
=C2=A0=C2=A0 8355924 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +47.0%=C2=A0=
=C2=A0 12280660 =C2=B1=C2=A0 7%=C2=A0 perf-stat.i.iTLB-load-misses
=C2=A0=C2=A0 3268044 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +65.6%=C2=A0=C2=A0=
=C2=A0 5412376 =C2=B1=C2=A0 8%=C2=A0 perf-stat.i.iTLB-loads
=C2=A06.464e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.2%=C2=A0 7.704e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.i.instructions
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6911 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4691 =C2=B1=C2=A0 6%=C2=A0 perf=
-stat.i.instructions-per-iTLB-miss
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +28.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.ipc
=C2=A0=C2=A0=C2=A0 124.96=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +101.4%=C2=A0=C2=A0=C2=A0=C2=A0 251.73 =C2=B1=C2=A0 2%=C2=A0 perf-st=
at.i.major-faults
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.76=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -41.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.metric.GHz
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +32.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1=C2=A0 7%=C2=A0 perf=
-stat.i.metric.K/sec
=C2=A0=C2=A0=C2=A0 332691=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +49.2%=C2=A0=C2=A0=C2=A0=C2=A0 496370=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 perf-stat.i.minor-faults
=C2=A0=C2=A0=C2=A0=C2=A0 91.27=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -4.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 87.22=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.node-load-miss-rate%
=C2=A0 18748059=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -13.0%=C2=A0=C2=A0 16311904 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.node-load-mi=
sses
=C2=A0=C2=A0 1587953=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +50.0%=C2=A0=C2=A0=C2=A0 2382313=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-stat.i.node-loads
=C2=A0=C2=A0=C2=A0=C2=A0 86.40=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -8.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 78.07 =C2=B1=
=C2=A0 2%=C2=A0 perf-stat.i.node-store-miss-rate%
=C2=A0=C2=A0 9547999=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -19.9%=C2=A0=C2=A0=C2=A0 7644037 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.n=
ode-store-misses
=C2=A0=C2=A0 1064509=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +92.2%=C2=A0=C2=A0=C2=A0 2045699 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.n=
ode-stores
=C2=A0=C2=A0=C2=A0 332816=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +49.2%=C2=A0=C2=A0=C2=A0=C2=A0 496622=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 perf-stat.i.page-faults
=C2=A0=C2=A0=C2=A0 192200=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +7.5%=C2=A0=C2=A0=C2=A0=C2=A0 206633=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.task-clock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.25 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +36.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.42 =C2=B1=C2=A0 7%=C2=A0 perf=
-stat.overall.MPKI
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.83 =C2=B1=C2=A0 5%=
=C2=A0 perf-stat.overall.branch-miss-rate%
=C2=A0=C2=A0=C2=A0=C2=A0 32.96 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -13.4=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.58 =C2=B1 11%=C2=A0 perf-stat.overall.=
cache-miss-rate%
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.25=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -42.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.02=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.cpi
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4953=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -28.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3533 =C2=
=B1=C2=A0 4%=C2=A0 perf-stat.overall.cycles-between-cache-misses
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 24%=C2=A0 pe=
rf-stat.overall.dTLB-load-miss-rate%
=C2=A0=C2=A0=C2=A0=C2=A0 72.34 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 69.29=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 perf-stat.overall.iTLB-load-miss-rate%
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7868 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 -20.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6292 =C2=B1=C2=A0 7%=C2=A0 perf=
-stat.overall.instructions-per-iTLB-miss
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +73.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.ipc
=C2=A0=C2=A0=C2=A0=C2=A0 92.20=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 87.37=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.node-load-miss-rate%
=C2=A0=C2=A0=C2=A0=C2=A0 90.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -9.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 80.24=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.node-store-miss-rate%
=C2=A0 19255954=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.1%=C2=A0=C2=A0 14811673=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf=
-stat.overall.path-length
=C2=A01.382e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +5.2%=C2=A0 1.454e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf=
-stat.ps.branch-instructions
=C2=A0 85147082 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +42.1%=C2=A0=C2=A0 =
1.21e+08 =C2=B1=C2=A0 5%=C2=A0 perf-stat.ps.branch-misses
=C2=A0 69832184 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -9.6%=C2=A0=
=C2=A0 63144472 =C2=B1=C2=A0 4%=C2=A0 perf-stat.ps.cache-misses
=C2=A02.141e+08 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +52.0%=C2=A0 3.254e=
+08 =C2=B1=C2=A0 8%=C2=A0 perf-stat.ps.cache-references
=C2=A0=C2=A0=C2=A0=C2=A0 25647 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37498=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-stat.ps.context-switches
=C2=A03.458e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.6%=C2=A0 2.227e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.ps.cpu-cycles
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3456=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +55.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5375 =C2=
=B1=C2=A0 4%=C2=A0 perf-stat.ps.cpu-migrations
=C2=A0=C2=A0 2731148 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 +50.7%=C2=A0=C2=A0=
=C2=A0 4114660 =C2=B1 24%=C2=A0 perf-stat.ps.dTLB-load-misses
=C2=A0=C2=A0=C2=A0 951612 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +42.4%=C2=A0=
=C2=A0=C2=A0 1354727 =C2=B1 10%=C2=A0 perf-stat.ps.dTLB-store-misses
=C2=A02.534e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +43.0%=C2=A0 3.624e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.ps.dTLB-stores
=C2=A0=C2=A0 8410006 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +39.9%=C2=A0=
=C2=A0 11763281 =C2=B1=C2=A0 6%=C2=A0 perf-stat.ps.iTLB-load-misses
=C2=A0=C2=A0 3251030 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +60.5%=C2=A0=C2=A0=
=C2=A0 5218236 =C2=B1=C2=A0 7%=C2=A0 perf-stat.ps.iTLB-loads
=C2=A06.591e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +11.7%=C2=A0 7.364e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.ps.instructions
=C2=A0=C2=A0=C2=A0 127.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +97.9%=C2=A0=C2=A0=C2=A0=C2=A0 251.44 =C2=B1=C2=A0 2%=C2=A0 pe=
rf-stat.ps.major-faults
=C2=A0=C2=A0=C2=A0 338752=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +44.5%=C2=A0=C2=A0=C2=A0=C2=A0 489644=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 perf-stat.ps.minor-faults
=C2=A0 19070733=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -11.1%=C2=A0=C2=A0 16952678 =C2=B1=C2=A0 4%=C2=A0 perf-stat.ps.node-load-m=
isses
=C2=A0=C2=A0 1613838=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +51.7%=C2=A0=C2=A0=C2=A0 2448074=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-stat.ps.node-loads
=C2=A0=C2=A0 9716997=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -18.4%=C2=A0=C2=A0=C2=A0 7933032 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.=
node-store-misses
=C2=A0=C2=A0 1079544=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +80.8%=C2=A0=C2=A0=C2=A0 1952245=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-stat.ps.node-stores
=C2=A0=C2=A0=C2=A0 338879=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +44.6%=C2=A0=C2=A0=C2=A0=C2=A0 489896=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 perf-stat.ps.page-faults
=C2=A02.009e+13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +11.5%=C2=A0 2.239e+13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat=
.total.instructions
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 54%=C2=A0=C2=A0=C2=A0 +278.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 41%=C2=A0 perf-sched.sch_dela=
y.avg.ms.d_alloc_parallel.__lookup_slow.walk_component.link_path_walk.part
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1123%=C2=A0=C2=A0=C2=A0 +813.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1120%=C2=A0 perf-sched.sch_dela=
y.avg.ms.d_alloc_parallel.__lookup_slow.walk_component.path_lookupat.isra
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0 +210.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 21%=C2=A0 perf-sched.sch=
_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sy=
scall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 89%=C2=A0=C2=A0=C2=A0 +210.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 59%=C2=A0 perf-sched.sch_dela=
y.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 34%=C2=A0=C2=A0 +1883.2%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.91 =C2=B1 48%=C2=A0 perf-sched.sch_delay.a=
vg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_=
timer_interrupt.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 45%=C2=A0=C2=A0=C2=A0 +772.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 65%=C2=A0 perf-sched.sch_dela=
y.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ca=
ll_function_single.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 9%=C2=A0=C2=A0 +1004.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.97 =C2=B1 90%=C2=A0 perf-sched.sch_dela=
y.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_re=
schedule_ipi.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 28%=C2=A0=C2=A0=C2=A0 +390.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 41%=C2=A0 perf-sched.sch_dela=
y.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_=
64_after_hwframe.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +80.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.13 =C2=B1 21%=C2=A0 perf-sche=
d.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_=
from_fork.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +113.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 21%=C2=A0 perf-sched.sch_dela=
y.avg.ms.io_schedule.__lock_page_killable.filemap_fault.__do_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0 +196.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 65%=C2=A0 perf-sched.sch=
_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 45%=C2=A0=C2=A0=C2=A0 +742.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35 =C2=B1 83%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc=
_pages_vma.wp_page_copy
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 78%=C2=A0=C2=A0=C2=A0=C2=A0 -84.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1142%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.=
allocate_slab.___slab_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 79%=C2=A0=C2=A0 +2194.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.89 =C2=B1164%=C2=A0 perf-sched.sch_delay.a=
vg.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.pte_allo=
c_one.__pte_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 -86.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 59%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.__anon_vma_prepare.do_f=
ault.__handle_mm_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1105%=C2=A0=C2=A0=C2=A0=C2=A0 -98.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1137%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.copy_page_to_iter.gener=
ic_file_buffered_read.new_sync_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +91.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1=C2=A0 5%=C2=A0 perf=
-sched.sch_delay.avg.ms.preempt_schedule_common._cond_resched.do_user_addr_=
fault.exc_page_fault.asm_exc_page_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1100%=C2=A0=C2=A0=C2=A0=C2=A0 -92.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 94%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.down_write.__anon_vma_p=
repare.do_anonymous_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 79%=C2=A0=C2=A0=C2=A0 +277.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 73%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.down_write.__vma_adjust.__sp=
lit_vma
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 16%=C2=A0 +1.5e+05%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 8.25 =C2=B1103%=C2=A0 perf-sched.sch_delay.avg.ms.=
preempt_schedule_common._cond_resched.down_write.do_truncate.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 19%=C2=A0=C2=A0=C2=A0 +318.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 44%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.down_write.unlink_anon_vmas.=
free_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1=C2=A0 7%=C2=A0=C2=A0 +1180.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1145%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.down_write.unlink_file_vma.f=
ree_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -89.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1173%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.down_write_killable.__v=
m_munmap.__x64_sys_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 54%=C2=A0=C2=A0=C2=A0 +242.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 62%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.down_write_killable.vm_mmap_=
pgoff.elf_map
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 -87.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 13%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.down_write_killable.vm_=
mmap_pgoff.ksys_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 49%=C2=A0 +1.3e+05%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 8.04 =C2=B1152%=C2=A0 perf-sched.sch_delay.avg.ms.=
preempt_schedule_common._cond_resched.dput.do_unlinkat.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1127%=C2=A0 +16890.4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 16.82 =C2=B1163%=C2=A0 perf-sched.sch_delay.avg.ms.preem=
pt_schedule_common._cond_resched.dput.done_path_create.do_linkat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +459.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.71 =C2=B1 18%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.dput.path_openat.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1118%=C2=A0=C2=A0=C2=A0 +204.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1 94%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.dput.scan_positives.dcache_r=
eaddir
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 36%=C2=A0=C2=A0 +3156.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 63%=C2=A0 perf-sched.sch_delay.a=
vg.ms.preempt_schedule_common._cond_resched.dput.step_into.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 21%=C2=A0=C2=A0=C2=A0 +554.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.46 =C2=B1 93%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.dput.terminate_walk.path_ope=
nat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1141%=C2=A0 +19625.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1150%=C2=A0 perf-sched.sch_delay.avg.ms.=
preempt_schedule_common._cond_resched.generic_file_buffered_read.__kernel_r=
ead.load_elf_binary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1134%=C2=A0=C2=A0=C2=A0 +686.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.66 =C2=B1 59%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.__d_alloc.d=
_alloc_cursor
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 37%=C2=A0=C2=A0=C2=A0 +648.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1 28%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.security_fi=
le_alloc.__alloc_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 61%=C2=A0=C2=A0=C2=A0=C2=A0 -77.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1139%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.vm_are=
a_alloc.__install_special_mapping
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 97%=C2=A0=C2=A0=C2=A0=C2=A0 -99.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 34%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.vm_are=
a_alloc.do_brk_flags
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.67 =C2=B1140%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1173%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc_node_trace.=
__get_vm_area_node.__vmalloc_node_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 51%=C2=A0=C2=A0=C2=A0=C2=A0 +75.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 30%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc_trace.=
perf_event_mmap.mmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 85%=C2=A0=C2=A0=C2=A0=C2=A0 -93.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1148%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc_trace.=
perf_event_mmap.mprotect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 66%=C2=A0 +89763.4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 8.39 =C2=B1106%=C2=A0 perf-sched.sch_delay.avg.ms.=
preempt_schedule_common._cond_resched.mnt_want_write.path_openat.do_filp_op=
en
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1108%=C2=A0=C2=A0=C2=A0 +903.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1129%=C2=A0 perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common._cond_resched.mutex_lock.futex_exec_releas=
e.exec_mm_release
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 53%=C2=A0=C2=A0=C2=A0=C2=A0 -67.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 83%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.mutex_lock.futex_exit_r=
elease.exit_mm_release
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1125%=C2=A0=C2=A0 +1883.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.25 =C2=B1 40%=C2=A0 perf-sched.sch_delay.a=
vg.ms.preempt_schedule_common._cond_resched.smpboot_thread_fn.kthread.ret_f=
rom_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 70%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.sch_delay.avg.ms.preempt_schedule_common._cond_resched.st=
op_one_cpu.migrate_task_to.task_numa_migrate
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0 +308.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.22 =C2=B1 26%=C2=A0 perf-sched.sch=
_delay.avg.ms.preempt_schedule_common._cond_resched.stop_one_cpu.sched_exec=
.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 68%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.sch_delay.avg.ms.preempt_schedule_common._cond_resched.wa=
it_for_completion.stop_two_cpus.migrate_swap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1103%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.sch_delay.avg.ms.rwsem_down_read_slowpath.page_lock_anon_=
vma_read.rmap_walk_anon.try_to_unmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1106%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.sch_delay.avg.ms.rwsem_down_read_slowpath.rmap_walk_anon.=
remove_migration_ptes.migrate_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 49%=C2=A0=C2=A0 +1115.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1143%=C2=A0 perf-sched.sch_delay.a=
vg.ms.rwsem_down_write_slowpath.__vma_adjust.__split_vma.__do_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 52%=C2=A0=C2=A0=C2=A0=C2=A0 -89.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1107%=C2=A0 perf-sched.sch=
_delay.avg.ms.rwsem_down_write_slowpath.anon_vma_clone.anon_vma_fork.dup_mm=
ap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 54%=C2=A0=C2=A0 +1681.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 70%=C2=A0 perf-sched.sch_delay.a=
vg.ms.rwsem_down_write_slowpath.do_unlinkat.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 80%=C2=A0=C2=A0=C2=A0 +507.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 45%=C2=A0 perf-sched.sch_dela=
y.avg.ms.rwsem_down_write_slowpath.dup_mmap.dup_mm.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 24%=C2=A0=C2=A0 +1250.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 68%=C2=A0 perf-sched.sch_delay.a=
vg.ms.rwsem_down_write_slowpath.filename_create.do_linkat.__x64_sys_link
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 65%=C2=A0=C2=A0=C2=A0=C2=A0 -87.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 75%=C2=A0 perf-sched.sch=
_delay.avg.ms.rwsem_down_write_slowpath.unlink_anon_vmas.free_pgtables.exit=
_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 20%=C2=A0=C2=A0=C2=A0 +232.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 33%=C2=A0 perf-sched.sch_dela=
y.avg.ms.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.exit_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 27%=C2=A0=C2=A0=C2=A0 +363.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 43%=C2=A0 perf-sched.sch_dela=
y.avg.ms.rwsem_down_write_slowpath.vma_link.mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 68%=C2=A0=C2=A0=C2=A0=C2=A0 -95.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 13%=C2=A0 perf-sched.sch=
_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sy=
s_epoll_wait
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 18%=C2=A0=C2=A0 +5366.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.93 =C2=B1 40%=C2=A0 perf-sched.sch_delay.a=
vg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 39%=C2=A0=C2=A0=C2=A0 +464.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 60%=C2=A0 perf-sched.sch_dela=
y.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1141%=C2=A0 +48300.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0.97 =C2=B1170%=C2=A0 perf-sched.sch_delay.avg.ms.=
schedule_timeout.wait_for_completion.__flush_work.lru_add_drain_all
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1=C2=A0 7%=C2=A0=C2=A0 +1238.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.63 =C2=B1 31%=C2=A0 perf-sched.sch_dela=
y.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -74.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1149%=C2=A0 perf-sched.sch=
_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1=C2=A0 7%=C2=A0=C2=A0 +9784.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.25 =C2=B1 18%=C2=A0 perf-sched.sch_dela=
y.avg.ms.worker_thread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.01 =C2=B1 31%=C2=A0=C2=A0=C2=A0 +324.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.26 =C2=B1 36%=C2=A0 perf-sched.sch_delay.max=
.ms.d_alloc_parallel.__lookup_slow.walk_component.link_path_walk.part
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.59 =C2=B1132%=C2=A0=C2=A0 +1076.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 42.25 =C2=B1 96%=C2=A0 perf-sched.sch_delay.max.ms=
.d_alloc_parallel.__lookup_slow.walk_component.path_lookupat.isra
=C2=A0=C2=A0=C2=A0=C2=A0 16.19 =C2=B1=C2=A0 7%=C2=A0=C2=A0 +1397.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 242.51 =C2=B1 30%=C2=A0 perf-sched.sch_delay.max.ms.do_t=
ask_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.13 =C2=B1 27%=C2=A0=C2=A0 +2518.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 238.94 =C2=B1 62%=C2=A0 perf-sched.sch_delay.max.ms.exit=
_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_inte=
rrupt.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0 10.04 =C2=B1 65%=C2=A0=C2=A0 +1971.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 207.85 =C2=B1 63%=C2=A0 perf-sched.sch_delay.max.ms.exit_to_us=
er_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.=
[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.21 =C2=B1 61%=C2=A0=C2=A0 +2000.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 193.58 =C2=B1 63%=C2=A0 perf-sched.sch_delay.max.ms.exit=
_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.=
[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0 11.01 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +799.2%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 99.02 =C2=B1 86%=C2=A0 perf-sched.sch_delay.max.ms=
.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after=
_hwframe.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0 14.73 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +265.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 53.91 =C2=B1 26%=C2=A0 perf-sched.sch_delay.max.ms=
.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0 10.65 =C2=B1 44%=C2=A0=C2=A0=C2=A0 +151.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 26.76 =C2=B1 19%=C2=A0 perf-sched.sch_delay.max.ms=
.io_schedule.__lock_page_killable.filemap_fault.__do_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.21 =C2=B1 24%=C2=A0=C2=A0 +2921.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 36.62 =C2=B1124%=C2=A0 perf-sched.sch_delay.max.ms=
.pipe_read.new_sync_read.vfs_read.ksys_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1 55%=C2=A0=C2=A0 +1359.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.76 =C2=B1113%=C2=A0 perf-sched.sch_delay.m=
ax.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc_pa=
ges_vma.wp_page_copy
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 92%=C2=A0=C2=A0=C2=A0=C2=A0 -90.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1155%=C2=A0 perf-sched.sch=
_delay.max.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.=
allocate_slab.___slab_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 69%=C2=A0=C2=A0 +3449.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 13.07 =C2=B1162%=C2=A0 perf-sched.sch_delay.max.ms=
.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.pte_alloc_one=
.__pte_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0 -89.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1102%=C2=A0 perf-sched.sch=
_delay.max.ms.preempt_schedule_common._cond_resched.__anon_vma_prepare.do_f=
ault.__handle_mm_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.55 =C2=B1 93%=C2=A0=C2=A0=C2=A0=C2=A0 -95.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1153%=C2=A0 perf-sched.sch=
_delay.max.ms.preempt_schedule_common._cond_resched.__kmalloc_node.memcg_al=
loc_page_obj_cgroups.kmem_cache_alloc_node
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.97 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +591.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.72 =C2=B1119%=C2=A0 perf-sched.sch_dela=
y.max.ms.preempt_schedule_common._cond_resched.change_p4d_range.change_prot=
ection.mprotect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1106%=C2=A0=C2=A0=C2=A0=C2=A0 -98.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1137%=C2=A0 perf-sched.sch=
_delay.max.ms.preempt_schedule_common._cond_resched.copy_page_to_iter.gener=
ic_file_buffered_read.new_sync_read
=C2=A0=C2=A0=C2=A0=C2=A0 11.49 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +87.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.57 =C2=B1 31%=C2=A0 perf-sched.sch_dela=
y.max.ms.preempt_schedule_common._cond_resched.do_user_addr_fault.exc_page_=
fault.asm_exc_page_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1102%=C2=A0=C2=A0=C2=A0=C2=A0 -96.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 79%=C2=A0 perf-sched.sch=
_delay.max.ms.preempt_schedule_common._cond_resched.down_write.__anon_vma_p=
repare.do_anonymous_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.05 =C2=B1 98%=C2=A0=C2=A0=C2=A0 +478.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.10 =C2=B1 82%=C2=A0 perf-sched.sch_dela=
y.max.ms.preempt_schedule_common._cond_resched.down_write.__vma_adjust.__sp=
lit_vma
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1=C2=A0 5%=C2=A0 +1.4e+06%=C2=A0=
=C2=A0=C2=A0=C2=A0 217.29 =C2=B1104%=C2=A0 perf-sched.sch_delay.max.ms.pree=
mpt_schedule_common._cond_resched.down_write.do_truncate.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.95 =C2=B1 26%=C2=A0=C2=A0=C2=A0 +682.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 15.25 =C2=B1 64%=C2=A0 perf-sched.sch_delay.max=
.ms.preempt_schedule_common._cond_resched.down_write.unlink_anon_vmas.free_=
pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.93 =C2=B1 14%=C2=A0=C2=A0 +9721.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 91.57 =C2=B1158%=C2=A0 perf-sched.sch_delay.max.ms=
.preempt_schedule_common._cond_resched.down_write.unlink_file_vma.free_pgta=
bles
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -78.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1173%=C2=A0 perf-sched.sch=
_delay.max.ms.preempt_schedule_common._cond_resched.down_write_killable.__v=
m_munmap.__x64_sys_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -96.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 72%=C2=A0 perf-sched.sch=
_delay.max.ms.preempt_schedule_common._cond_resched.down_write_killable.vm_=
mmap_pgoff.ksys_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 28%=C2=A0 +8.3e+05%=C2=A0=C2=A0=
=C2=A0=C2=A0 113.60 =C2=B1164%=C2=A0 perf-sched.sch_delay.max.ms.preempt_sc=
hedule_common._cond_resched.dput.do_unlinkat.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1108%=C2=A0 +34647.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 72.97 =C2=B1145%=C2=A0 perf-sched.sch_delay.max.ms.preem=
pt_schedule_common._cond_resched.dput.done_path_create.do_linkat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.03 =C2=B1 39%=C2=A0=C2=A0 +1407.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 45.73 =C2=B1 29%=C2=A0 perf-sched.sch_delay.max.ms=
.preempt_schedule_common._cond_resched.dput.path_openat.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.22 =C2=B1 39%=C2=A0=C2=A0 +4068.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 50.91 =C2=B1 79%=C2=A0 perf-sched.sch_delay.max.ms=
.preempt_schedule_common._cond_resched.dput.step_into.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.38 =C2=B1 60%=C2=A0=C2=A0 +3700.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 128.54 =C2=B1127%=C2=A0 perf-sched.sch_delay.max.ms.pree=
mpt_schedule_common._cond_resched.dput.terminate_walk.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.88 =C2=B1 46%=C2=A0=C2=A0=C2=A0 +299.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.50 =C2=B1 55%=C2=A0 perf-sched.sch_dela=
y.max.ms.preempt_schedule_common._cond_resched.exit_mmap.mmput.begin_new_ex=
ec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1141%=C2=A0 +22250.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1167%=C2=A0 perf-sched.sch_delay.max.ms.=
preempt_schedule_common._cond_resched.generic_file_buffered_read.__kernel_r=
ead.load_elf_binary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.57 =C2=B1139%=C2=A0 +12527.6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 71.47 =C2=B1 89%=C2=A0 perf-sched.sch_delay.max.ms.preem=
pt_schedule_common._cond_resched.kmem_cache_alloc.__d_alloc.d_alloc_cursor
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1141%=C2=A0=C2=A0 +1525.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1144%=C2=A0 perf-sched.sch_delay.m=
ax.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.__delayacct_ts=
k_init.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.73 =C2=B1 43%=C2=A0=C2=A0=C2=A0 +863.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 16.71 =C2=B1 50%=C2=A0 perf-sched.sch_delay.max=
.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.security_file_al=
loc.__alloc_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.67 =C2=B1140%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1173%=C2=A0 perf-sched.sch_dela=
y.max.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc_node_trace.=
__get_vm_area_node.__vmalloc_node_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.19 =C2=B1 52%=C2=A0=C2=A0=C2=A0 +345.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 14.24 =C2=B1 84%=C2=A0 perf-sched.sch_delay.max=
.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc_trace.perf_event=
_mmap.mmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.01 =C2=B1 99%=C2=A0=C2=A0=C2=A0=C2=A0 -91.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1167%=C2=A0 perf-sched.sch=
_delay.max.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc_trace.=
perf_event_mmap.mprotect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 85%=C2=A0 +1.7e+05%=C2=A0=C2=A0=
=C2=A0=C2=A0 187.38 =C2=B1 84%=C2=A0 perf-sched.sch_delay.max.ms.preempt_sc=
hedule_common._cond_resched.mnt_want_write.path_openat.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1130%=C2=A0=C2=A0=C2=A0 +602.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1142%=C2=A0 perf-sched.sch_dela=
y.max.ms.preempt_schedule_common._cond_resched.mutex_lock.futex_exec_releas=
e.exec_mm_release
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1136%=C2=A0 +10794.6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 57.09 =C2=B1 72%=C2=A0 perf-sched.sch_delay.max.ms.preem=
pt_schedule_common._cond_resched.smpboot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 92%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.sch_delay.max.ms.preempt_schedule_common._cond_resched.st=
op_one_cpu.migrate_task_to.task_numa_migrate
=C2=A0=C2=A0=C2=A0=C2=A0 28.50 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +645.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 212.48 =C2=B1 39%=C2=A0 perf-sched.sch_delay.max.ms.pree=
mpt_schedule_common._cond_resched.stop_one_cpu.sched_exec.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.20 =C2=B1 76%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.sch_delay.max.ms.preempt_schedule_common._cond_resched.wa=
it_for_completion.stop_two_cpus.migrate_swap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1130%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.sch_delay.max.ms.rwsem_down_read_slowpath.page_lock_anon_=
vma_read.rmap_walk_anon.try_to_unmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1132%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.sch_delay.max.ms.rwsem_down_read_slowpath.rmap_walk_anon.=
remove_migration_ptes.migrate_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0 -96.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1173%=C2=A0 perf-sched.sch=
_delay.max.ms.rwsem_down_write_slowpath.__put_anon_vma.unlink_anon_vmas.fre=
e_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.53 =C2=B1 79%=C2=A0=C2=A0 +6359.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 98.51 =C2=B1148%=C2=A0 perf-sched.sch_delay.max.ms=
.rwsem_down_write_slowpath.__vma_adjust.__split_vma.__do_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.57 =C2=B1 63%=C2=A0=C2=A0=C2=A0 +676.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.92 =C2=B1 49%=C2=A0 perf-sched.sch_delay.max=
.ms.rwsem_down_write_slowpath.__vma_adjust.__split_vma.mprotect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.78 =C2=B1 76%=C2=A0=C2=A0=C2=A0=C2=A0 -99.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1138%=C2=A0 perf-sched.sch=
_delay.max.ms.rwsem_down_write_slowpath.anon_vma_clone.anon_vma_fork.dup_mm=
ap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 94%=C2=A0=C2=A0=C2=A0=C2=A0 -97.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1100%=C2=A0 perf-sched.sch=
_delay.max.ms.rwsem_down_write_slowpath.anon_vma_fork.dup_mmap.dup_mm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.70 =C2=B1 45%=C2=A0=C2=A0 +1878.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 112.68 =C2=B1 89%=C2=A0 perf-sched.sch_delay.max.ms.rwse=
m_down_write_slowpath.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.68 =C2=B1111%=C2=A0=C2=A0 +1530.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 60.07 =C2=B1 26%=C2=A0 perf-sched.sch_delay.max.ms=
.rwsem_down_write_slowpath.dup_mmap.dup_mm.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.33 =C2=B1 17%=C2=A0=C2=A0 +2353.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 155.41 =C2=B1105%=C2=A0 perf-sched.sch_delay.max.ms.rwse=
m_down_write_slowpath.filename_create.do_linkat.__x64_sys_link
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.23 =C2=B1 66%=C2=A0=C2=A0=C2=A0=C2=A0 -98.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 65%=C2=A0 perf-sched.sch=
_delay.max.ms.rwsem_down_write_slowpath.unlink_anon_vmas.free_pgtables.exit=
_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.50 =C2=B1 41%=C2=A0=C2=A0=C2=A0 +643.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 48.28 =C2=B1 78%=C2=A0 perf-sched.sch_delay.max=
.ms.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.exit_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.45 =C2=B1 43%=C2=A0=C2=A0 +1688.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 43.80 =C2=B1 88%=C2=A0 perf-sched.sch_delay.max.ms=
.rwsem_down_write_slowpath.vma_link.mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.31 =C2=B1 80%=C2=A0=C2=A0=C2=A0=C2=A0 -99.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 54%=C2=A0 perf-sched.sch=
_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sy=
s_epoll_wait
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 65%=C2=A0 +15185.6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 79.99 =C2=B1 38%=C2=A0 perf-sched.sch_delay.max.ms.sched=
ule_timeout.kcompactd.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0 16.34 =C2=B1 98%=C2=A0=C2=A0=C2=A0 +385.7%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 79.39 =C2=B1 79%=C2=A0 perf-sched.sch_delay.max.ms=
.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1141%=C2=A0 +72153.1%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1.93 =C2=B1171%=C2=A0 perf-sched.sch_delay.max.ms.=
schedule_timeout.wait_for_completion.__flush_work.lru_add_drain_all
=C2=A0=C2=A0=C2=A0=C2=A0 10.28 =C2=B1 58%=C2=A0=C2=A0 +2363.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 253.08 =C2=B1 17%=C2=A0 perf-sched.sch_delay.max.ms.smpboot_th=
read_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.41 =C2=B1 37%=C2=A0=C2=A0 +3406.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 295.08 =C2=B1 29%=C2=A0 perf-sched.sch_delay.max.ms.work=
er_thread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 74%=C2=A0=C2=A0=C2=A0 +358.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 29%=C2=A0 perf-sched.total_sc=
h_delay.average.ms
=C2=A0=C2=A0=C2=A0=C2=A0 39.70 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -15.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.67 =C2=B1=C2=A0 3%=C2=A0 perf-sched.tot=
al_wait_and_delay.average.ms
=C2=A0=C2=A0=C2=A0 157875 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +29.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 204320 =C2=B1=C2=A0 3%=C2=A0 perf-sched.total_wait_an=
d_delay.count.ms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5585=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +14.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6395 =C2=
=B1=C2=A0 3%=C2=A0 perf-sched.total_wait_and_delay.max.ms
=C2=A0=C2=A0=C2=A0=C2=A0 39.58 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -16.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.13 =C2=B1=C2=A0 3%=C2=A0 perf-sched.tot=
al_wait_time.average.ms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5585=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +14.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6395 =C2=
=B1=C2=A0 3%=C2=A0 perf-sched.total_wait_time.max.ms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +90.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.72 =C2=B1 10%=C2=A0 perf-sched.wai=
t_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.25 =C2=B1 22%=C2=A0=C2=A0=C2=A0 +706.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 50.40 =C2=B1 54%=C2=A0 perf-sched.wait_and_dela=
y.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ap=
ic_timer_interrupt.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.09 =C2=B1 15%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.syscall_e=
xit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0 38.34 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +47.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 56.61 =C2=B1 33%=C2=A0 perf-sched.wait_and_dela=
y.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +14.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.83 =C2=
=B1=C2=A0 3%=C2=A0 perf-sched.wait_and_delay.avg.ms.preempt_schedule_common=
._cond_resched.stop_one_cpu.__set_cpus_allowed_ptr.sched_setaffinity
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0 +330.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.42 =C2=B1 24%=C2=A0 perf-sched.wai=
t_and_delay.avg.ms.preempt_schedule_common._cond_resched.stop_one_cpu.sched=
_exec.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1 20%=C2=A0=C2=A0=C2=A0 +419.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.93 =C2=B1=C2=A0 7%=C2=A0 perf-sched.wai=
t_and_delay.avg.ms.rwsem_down_write_slowpath.do_unlinkat.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1 70%=C2=A0=C2=A0=C2=A0 +168.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.61 =C2=B1 18%=C2=A0 perf-sched.wait_and=
_delay.avg.ms.rwsem_down_write_slowpath.dup_mmap.dup_mm.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.71 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +29.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.82 =C2=B1 12%=C2=A0 perf-sched.wai=
t_and_delay.avg.ms.rwsem_down_write_slowpath.path_openat.do_filp_open.do_sy=
s_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1141%=C2=A0=C2=A0=C2=A0 +440.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 12%=C2=A0 perf-sched.wait_and=
_delay.avg.ms.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.unmap=
_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1141%=C2=A0=C2=A0=C2=A0 +604.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1 20%=C2=A0 perf-sched.wait_and=
_delay.avg.ms.rwsem_down_write_slowpath.vma_link.mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0 251.31 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -36.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 159.76 =C2=B1 18%=C2=A0 perf-sched.wait_and_delay.avg=
.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wa=
it
=C2=A0=C2=A0=C2=A0=C2=A0 87.92 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +50.7%=C2=
=A0=C2=A0=C2=A0=C2=A0 132.47 =C2=B1 22%=C2=A0 perf-sched.wait_and_delay.avg=
.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_sys=
_poll
=C2=A0=C2=A0=C2=A0 384.15=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -32.3%=C2=A0=C2=A0=C2=A0=C2=A0 260.23 =C2=B1 10%=C2=A0 perf-sc=
hed.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0 142.29=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -30.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 98.47 =C2=B1=C2=A0 6%=C2=
=A0 perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0 35.67 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +58.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 56.50=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall=
_64
=C2=A0=C2=A0=C2=A0=C2=A0 14.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +19.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 17.50 =C2=B1=C2=A0 4%=C2=A0 perf-sched.wai=
t_and_delay.count.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_sys=
call_64
=C2=A0=C2=A0=C2=A0=C2=A0 35.67 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +58.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 56.50=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_and_delay.count.do_syslog.part.0.kmsg_read.vfs_read
=C2=A0=C2=A0=C2=A0=C2=A0 39991=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +28.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 51295 =C2=B1=C2=A0 4%=
=C2=A0 perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit._=
_x64_sys_exit_group.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0 41076=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +26.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 52088 =C2=B1=C2=A0 4%=
=C2=A0 perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.=
do_syscall_64
=C2=A0=C2=A0=C2=A0 914.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +68.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1539 =C2=B1=C2=A0 6%=C2=A0 perf-sched.wai=
t_and_delay.count.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_=
sysvec_apic_timer_interrupt.[unknown]
=C2=A0=C2=A0=C2=A0 122.33 =C2=B1141%=C2=A0=C2=A0=C2=A0 +401.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 613.00 =C2=B1 22%=C2=A0 perf-sched.wait_and_delay.count.exit_t=
o_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[u=
nknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1649 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 -100.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.sysc=
all_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4728 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -91.=
3%=C2=A0=C2=A0=C2=A0=C2=A0 412.00 =C2=B1100%=C2=A0 perf-sched.wait_and_dela=
y.count.preempt_schedule_common._cond_resched.dput.scan_positives.dcache_re=
addir
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.67 =C2=B1 44%=C2=A0=C2=A0 +1325.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 66.50 =C2=B1 51%=C2=A0 perf-sched.wait_and_delay.c=
ount.preempt_schedule_common._cond_resched.smpboot_thread_fn.kthread.ret_fr=
om_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1987 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -13.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1720 =C2=B1=C2=A0 4%=C2=A0 perf=
-sched.wait_and_delay.count.preempt_schedule_common._cond_resched.stop_one_=
cpu.__set_cpus_allowed_ptr.sched_setaffinity
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3064 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +76.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5412 =C2=B1 13%=C2=A0 perf-sche=
d.wait_and_delay.count.preempt_schedule_common._cond_resched.stop_one_cpu.s=
ched_exec.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2046 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +68.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3443 =C2=B1 15%=C2=A0 perf-sche=
d.wait_and_delay.count.rwsem_down_read_slowpath.walk_component.path_lookupa=
t.isra.0
=C2=A0=C2=A0=C2=A0 896.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +81.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1625 =C2=B1 12%=C2=A0 perf-sched.wait_and=
_delay.count.rwsem_down_write_slowpath.do_unlinkat.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0 776.00 =C2=B1 75%=C2=A0=C2=A0=C2=A0 +292.9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 3049 =C2=B1 44%=C2=A0 perf-sched.wait_and_delay.co=
unt.rwsem_down_write_slowpath.dup_mmap.dup_mm.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1649 =C2=B1 32%=C2=A0=C2=A0=C2=A0 +198.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4926 =C2=B1 45%=C2=A0 perf-sched.wait_and=
_delay.count.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.exit_m=
map
=C2=A0=C2=A0=C2=A0 354.67 =C2=B1141%=C2=A0=C2=A0=C2=A0 +482.9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2067 =C2=B1 36%=C2=A0 perf-sched.wait_and_delay.co=
unt.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.unmap_region
=C2=A0=C2=A0=C2=A0 350.00 =C2=B1141%=C2=A0=C2=A0=C2=A0 +496.1%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2086 =C2=B1 33%=C2=A0 perf-sched.wait_and_delay.co=
unt.rwsem_down_write_slowpath.vma_link.mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0 13.00 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 +61.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedu=
le_timeout.constprop.0.do_select
=C2=A0=C2=A0=C2=A0 163.67 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -35.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 106.00 =C2=B1 25%=C2=A0 perf-sched.wait_and_delay.cou=
nt.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_sys_=
poll
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1762 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -17.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1454 =C2=B1 12%=C2=A0 perf-sche=
d.wait_and_delay.count.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9129 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +43.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13062 =C2=B1=C2=A0 9%=C2=A0 perf-sche=
d.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0 12642=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +52.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19242 =C2=B1=C2=A0 3%=
=C2=A0 perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5512=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3811=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_and_delay.max.ms.devkm=
sg_read.vfs_read.ksys_read.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5512=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3811=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_and_delay.max.ms.do_sy=
slog.part.0.kmsg_read.vfs_read
=C2=A0=C2=A0=C2=A0 340.62 =C2=B1141%=C2=A0=C2=A0=C2=A0 +203.4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1033=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 per=
f-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_us=
er_mode.asm_sysvec_reschedule_ipi.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5496=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -100.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_and_delay.max.ms.exit_to_=
user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.=
[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5580=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3899=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_and_delay.max.ms.pipe_=
read.new_sync_read.vfs_read.ksys_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1495 =C2=B1 31%=C2=A0=C2=A0=C2=A0 +114.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3203 =C2=B1=C2=A0 4%=C2=A0 perf-sched.wai=
t_and_delay.max.ms.preempt_schedule_common._cond_resched.smpboot_thread_fn.=
kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0 28.50 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +645.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 212.48 =C2=B1 39%=C2=A0 perf-sched.wait_and_delay.max.ms=
.preempt_schedule_common._cond_resched.stop_one_cpu.sched_exec.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0 20.64 =C2=B1 78%=C2=A0=C2=A0 +2946.5%=C2=A0=C2=A0=
=C2=A0=C2=A0 628.69 =C2=B1 62%=C2=A0 perf-sched.wait_and_delay.max.ms.rwsem=
_down_write_slowpath.dup_mmap.dup_mm.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0 20.38 =C2=B1 28%=C2=A0=C2=A0=C2=A0 +299.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 81.32 =C2=B1 53%=C2=A0 perf-sched.wait_and_delay.m=
ax.ms.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.exit_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.90 =C2=B1141%=C2=A0=C2=A0=C2=A0 +526.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.46 =C2=B1 34%=C2=A0 perf-sched.wait_and_dela=
y.max.ms.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.unmap_regi=
on
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.78 =C2=B1141%=C2=A0=C2=A0 +1570.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 63.11 =C2=B1 45%=C2=A0 perf-sched.wait_and_delay.m=
ax.ms.rwsem_down_write_slowpath.vma_link.mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5176=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -31.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3569=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_and_delay.max.ms.sched=
ule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5585=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3899=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_and_delay.max.ms.sched=
ule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_select
=C2=A0=C2=A0=C2=A0 505.28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +31.3%=C2=A0=C2=A0=C2=A0=C2=A0 663.68 =C2=B1=C2=A0 9%=C2=A0 pe=
rf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_=
fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4817 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -31.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3315 =C2=B1=C2=A0 3%=C2=A0 perf-sche=
d.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1791=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -16.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1502 =C2=
=B1=C2=A0 3%=C2=A0 perf-sched.wait_and_delay.max.ms.worker_thread.kthread.r=
et_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 39%=C2=A0=C2=A0=C2=A0 +460.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 27%=C2=A0 perf-sched.wait_tim=
e.avg.ms.d_alloc_parallel.__lookup_slow.walk_component.link_path_walk.part
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 92%=C2=A0=C2=A0=C2=A0 +182.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1 59%=C2=A0 perf-sched.wait_tim=
e.avg.ms.d_alloc_parallel.__lookup_slow.walk_component.path_lookupat.isra
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.50 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +87.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.20 =C2=B1=C2=A0 8%=C2=A0 perf-sche=
d.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1123%=C2=A0=C2=A0=C2=A0 +129.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.35 =C2=B1 86%=C2=A0 perf-sched.wait_tim=
e.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_=
fault.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.21 =C2=B1 22%=C2=A0=C2=A0=C2=A0 +697.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 49.49 =C2=B1 55%=C2=A0 perf-sched.wait_time.avg=
.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_ti=
mer_interrupt.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.60 =C2=B1 95%=C2=A0=C2=A0=C2=A0 +175.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 23.70 =C2=B1 34%=C2=A0 perf-sched.wait_time.avg=
.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_fu=
nction_single.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.03 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +354.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 27.43 =C2=B1 13%=C2=A0 perf-sched.wait_time.avg=
.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_af=
ter_hwframe.[unknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 88%=C2=A0 +24178.6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1.13 =C2=B1156%=C2=A0 perf-sched.wait_time.avg.ms.=
io_schedule.__lock_page.__do_fault.do_fault
=C2=A0=C2=A0=C2=A0=C2=A0 38.33 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +47.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 56.59 =C2=B1 33%=C2=A0 perf-sched.wait_time.avg=
.ms.pipe_read.new_sync_read.vfs_read.ksys_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1120%=C2=A0=C2=A0=C2=A0=C2=A0 -98.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1102%=C2=A0 perf-sched.wai=
t_time.avg.ms.preempt_schedule_common._cond_resched.__alloc_pages_nodemask.=
__pmd_alloc.__handle_mm_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1115%=C2=A0=C2=A0 +6617.2%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1168%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.__kmalloc.load_elf_phdrs.load_e=
lf_binary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1 44%=C2=A0=C2=A0=C2=A0 +593.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.89 =C2=B1 57%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.__kmalloc.security_task_allo=
c.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 57%=C2=A0=C2=A0=C2=A0 +614.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1 48%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.__put_anon_vma.unlink_anon_v=
mas.free_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1140%=C2=A0=C2=A0=C2=A0 +525.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.67 =C2=B1 86%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.cgroup_can_fork.copy_process=
.kernel_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 25%=C2=A0=C2=A0=C2=A0 +978.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 50%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.change_p4d_range.change_prot=
ection.mprotect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1 73%=C2=A0=C2=A0=C2=A0 +685.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.14 =C2=B1 66%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.copy_pte_range.copy_page_ran=
ge.dup_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1123%=C2=A0=C2=A0 +6830.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1103%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.down_read.path_openat.do_filp_o=
pen
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 29%=C2=A0=C2=A0=C2=A0 +796.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1 93%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.down_read.walk_component.lin=
k_path_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1141%=C2=A0=C2=A0 +2254.2%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1161%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.down_read_killable.create_elf_t=
ables.isra
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 97%=C2=A0=C2=A0 +9626.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.13 =C2=B1 62%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.down_write.__anon_vma_prepare.d=
o_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 87%=C2=A0=C2=A0 +4118.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.79 =C2=B1 55%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.down_write.__vma_adjust.shift_a=
rg_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.50 =C2=B1 68%=C2=A0=C2=A0 +1104.7%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 18.05 =C2=B1100%=C2=A0 perf-sched.wait_time.avg.ms=
.preempt_schedule_common._cond_resched.down_write.anon_vma_fork.dup_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.02 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +454.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.23 =C2=B1 69%=C2=A0 perf-sched.wait_time.avg=
.ms.preempt_schedule_common._cond_resched.down_write.do_truncate.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.78 =C2=B1 66%=C2=A0=C2=A0=C2=A0 +587.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.24 =C2=B1 99%=C2=A0 perf-sched.wait_time.avg=
.ms.preempt_schedule_common._cond_resched.down_write.dup_mmap.dup_mm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.86 =C2=B1 39%=C2=A0=C2=A0=C2=A0=C2=A0 +37.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.18 =C2=B1 11%=C2=A0 perf-sched.wai=
t_time.avg.ms.preempt_schedule_common._cond_resched.down_write.unlink_file_=
vma.free_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1141%=C2=A0=C2=A0 +3608.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 85%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.down_write_killable.__vm_munmap=
.elf_map
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1135%=C2=A0=C2=A0=C2=A0 +539.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 83%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.down_write_killable.vm_brk_f=
lags.load_elf_interp
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 21%=C2=A0=C2=A0=C2=A0 +251.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 50%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.down_write_killable.vm_mmap_=
pgoff.elf_map
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 70%=C2=A0=C2=A0 +1512.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.09 =C2=B1132%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.dput.__fput.task_work_run
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1139%=C2=A0=C2=A0 +1040.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.06 =C2=B1 93%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.dput.dcache_dir_close.__fput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1 75%=C2=A0=C2=A0 +3385.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 11.30 =C2=B1101%=C2=A0 perf-sched.wait_time.avg.ms=
.preempt_schedule_common._cond_resched.dput.do_unlinkat.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.06 =C2=B1 10%=C2=A0=C2=A0=C2=A0 +226.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 29.60 =C2=B1 20%=C2=A0 perf-sched.wait_time.avg=
.ms.preempt_schedule_common._cond_resched.dput.scan_positives.dcache_readdir
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.19 =C2=B1119%=C2=A0=C2=A0=C2=A0 +216.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.95 =C2=B1 21%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.dput.step_into.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 19%=C2=A0=C2=A0 +1845.7%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.15 =C2=B1 29%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.dput.terminate_walk.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0=C2=A0 +2914.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.82 =C2=B1 63%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.exit_mmap.mmput.begin_new_exec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.97 =C2=B1 23%=C2=A0=C2=A0=C2=A0 +131.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.24 =C2=B1 56%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.exit_mmap.mmput.do_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1126%=C2=A0=C2=A0=C2=A0 +319.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 53%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.__anon_vma_=
prepare.do_anonymous_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 15%=C2=A0=C2=A0 +2327.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.89 =C2=B1 54%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.__d_alloc.d_al=
loc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 70%=C2=A0=C2=A0 +3428.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 21.95 =C2=B1 35%=C2=A0 perf-sched.wait_time.avg.ms=
.preempt_schedule_common._cond_resched.kmem_cache_alloc.__d_alloc.d_alloc_c=
ursor
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 72%=C2=A0=C2=A0 +1816.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.56 =C2=B1 89%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.copy_fs_struct=
.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1119%=C2=A0=C2=A0 +1698.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.95 =C2=B1 91%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.getname_flags.=
do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 72%=C2=A0=C2=A0=C2=A0 +533.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.16 =C2=B1 31%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.getname_fla=
gs.user_path_at_empty
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1 34%=C2=A0=C2=A0=C2=A0 +890.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.09 =C2=B1 49%=C2=A0 perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.prepare_cre=
ds.copy_creds
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.70 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +55.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.76 =C2=B1 42%=C2=A0 perf-sched.wai=
t_time.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.vm_are=
a_dup.dup_mmap
=C2=A0=C2=A0=C2=A0=C2=A0 10.64 =C2=B1105%=C2=A0=C2=A0=C2=A0 +189.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 30.81 =C2=B1 66%=C2=A0 perf-sched.wait_time.avg.ms=
.preempt_schedule_common._cond_resched.mnt_want_write.path_openat.do_filp_o=
pen
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 68%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_time.avg.ms.preempt_schedule_common._cond_resched.mu=
tex_lock_killable.begin_new_exec.load_elf_binary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 97%=C2=A0=C2=A0 +1166.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 67%=C2=A0 perf-sched.wait_time.a=
vg.ms.preempt_schedule_common._cond_resched.remove_vma.__do_munmap.__vm_mun=
map
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +14.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.83 =C2=
=B1=C2=A0 3%=C2=A0 perf-sched.wait_time.avg.ms.preempt_schedule_common._con=
d_resched.stop_one_cpu.__set_cpus_allowed_ptr.sched_setaffinity
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.90 =C2=B1 20%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_time.avg.ms.preempt_schedule_common._cond_resched.st=
op_one_cpu.migrate_task_to.task_numa_migrate
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +539.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 26%=C2=A0 perf-sched.wai=
t_time.avg.ms.preempt_schedule_common._cond_resched.stop_one_cpu.sched_exec=
.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.38 =C2=B1 18%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_time.avg.ms.preempt_schedule_common._cond_resched.wa=
it_for_completion.stop_two_cpus.migrate_swap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +87.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1 35%=C2=A0 perf-sche=
d.wait_time.avg.ms.preempt_schedule_common._cond_resched.zap_pte_range.unma=
p_page_range.unmap_vmas
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.62 =C2=B1 44%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_time.avg.ms.rwsem_down_read_slowpath.page_lock_anon_=
vma_read.rmap_walk_anon.try_to_unmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.41 =C2=B1 41%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_time.avg.ms.rwsem_down_read_slowpath.rmap_walk_anon.=
remove_migration_ptes.migrate_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +96.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1 48%=C2=A0 perf-sche=
d.wait_time.avg.ms.rwsem_down_write_slowpath.__vma_adjust.__split_vma.mprot=
ect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.31 =C2=B1 21%=C2=A0=C2=A0=C2=A0 +398.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.54 =C2=B1=C2=A0 7%=C2=A0 perf-sched.wai=
t_time.avg.ms.rwsem_down_write_slowpath.do_unlinkat.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.93 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +64.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.53 =C2=B1 16%=C2=A0 perf-sche=
d.wait_time.avg.ms.rwsem_down_write_slowpath.dup_mmap.dup_mm.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +31.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 13%=C2=A0 perf-sched.wai=
t_time.avg.ms.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.unmap=
_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +83.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 25%=C2=A0 perf-sched.wai=
t_time.avg.ms.rwsem_down_write_slowpath.vma_link.mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0 251.12 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -36.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 159.75 =C2=B1 18%=C2=A0 perf-sched.wait_time.avg.ms.s=
chedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
=C2=A0=C2=A0=C2=A0=C2=A0 87.92 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +50.6%=C2=
=A0=C2=A0=C2=A0=C2=A0 132.37 =C2=B1 23%=C2=A0 perf-sched.wait_time.avg.ms.s=
chedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_sys_poll
=C2=A0=C2=A0=C2=A0 383.96=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -32.9%=C2=A0=C2=A0=C2=A0=C2=A0 257.59 =C2=B1=C2=A0 9%=C2=A0 pe=
rf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0 142.28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -31.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 97.22 =C2=B1=C2=A0 6%=C2=
=A0 perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.16 =C2=B1 46%=C2=A0=C2=A0=C2=A0 +383.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 39.47 =C2=B1 75%=C2=A0 perf-sched.wait_time.max=
.ms.d_alloc_parallel.__lookup_slow.walk_component.link_path_walk.part
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5512=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3811=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_time.max.ms.devkmsg_re=
ad.vfs_read.ksys_read.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5512=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3811=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_time.max.ms.do_syslog.=
part.0.kmsg_read.vfs_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5496=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3813=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_time.max.ms.exit_to_us=
er_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[u=
nknown]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1107%=C2=A0 +29156.2%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 21.16 =C2=B1159%=C2=A0 perf-sched.wait_time.max.ms.io_sc=
hedule.__lock_page.__do_fault.do_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5580=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3899=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_time.max.ms.pipe_read.=
new_sync_read.vfs_read.ksys_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.62 =C2=B1 40%=C2=A0=C2=A0=C2=A0 +343.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 20.48 =C2=B1 14%=C2=A0 perf-sched.wait_time.max=
.ms.preempt_schedule_common._cond_resched.__kmalloc.security_task_alloc.cop=
y_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.87 =C2=B1 85%=C2=A0=C2=A0=C2=A0 +498.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 17.16 =C2=B1 34%=C2=A0 perf-sched.wait_time.max=
.ms.preempt_schedule_common._cond_resched.__put_anon_vma.unlink_anon_vmas.f=
ree_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03 =C2=B1140%=C2=A0=C2=A0=C2=A0 +525.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.42 =C2=B1 54%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.cgroup_can_fork.copy_process=
.kernel_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.85 =C2=B1 22%=C2=A0=C2=A0 +2220.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 19.71 =C2=B1 82%=C2=A0 perf-sched.wait_time.max.ms=
.preempt_schedule_common._cond_resched.change_p4d_range.change_protection.m=
protect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.98 =C2=B1 62%=C2=A0=C2=A0=C2=A0 +586.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 54.83 =C2=B1100%=C2=A0 perf-sched.wait_time.max=
.ms.preempt_schedule_common._cond_resched.copy_pte_range.copy_page_range.du=
p_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1 73%=C2=A0=C2=A0=C2=A0 +476.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.44 =C2=B1 95%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.copy_strings.isra.0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1131%=C2=A0=C2=A0 +4103.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.45 =C2=B1 88%=C2=A0 perf-sched.wait_time.m=
ax.ms.preempt_schedule_common._cond_resched.down_read.path_openat.do_filp_o=
pen
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.68 =C2=B1 50%=C2=A0=C2=A0 +1905.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 53.65 =C2=B1123%=C2=A0 perf-sched.wait_time.max.ms=
.preempt_schedule_common._cond_resched.down_read.walk_component.link_path_w=
alk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1141%=C2=A0=C2=A0 +3772.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.39 =C2=B1166%=C2=A0 perf-sched.wait_time.m=
ax.ms.preempt_schedule_common._cond_resched.down_read_killable.create_elf_t=
ables.isra
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1122%=C2=A0 +22698.3%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 6.76 =C2=B1 88%=C2=A0 perf-sched.wait_time.max.ms.=
preempt_schedule_common._cond_resched.down_write.__anon_vma_prepare.do_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1103%=C2=A0=C2=A0 +3843.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.87 =C2=B1 62%=C2=A0 perf-sched.wait_time.m=
ax.ms.preempt_schedule_common._cond_resched.down_write.__vma_adjust.shift_a=
rg_pages
=C2=A0=C2=A0=C2=A0=C2=A0 23.74 =C2=B1 13%=C2=A0=C2=A0 +1153.9%=C2=A0=C2=A0=
=C2=A0=C2=A0 297.72 =C2=B1136%=C2=A0 perf-sched.wait_time.max.ms.preempt_sc=
hedule_common._cond_resched.down_write.anon_vma_clone.anon_vma_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.46 =C2=B1 76%=C2=A0=C2=A0 +3275.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 285.49 =C2=B1146%=C2=A0 perf-sched.wait_time.max.ms.pree=
mpt_schedule_common._cond_resched.down_write.anon_vma_fork.dup_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.55 =C2=B1 14%=C2=A0=C2=A0 +2664.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 236.39 =C2=B1 90%=C2=A0 perf-sched.wait_time.max.ms.pree=
mpt_schedule_common._cond_resched.down_write.do_truncate.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0 +3120.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.78 =C2=B1 90%=C2=A0 perf-sched.wait_time.m=
ax.ms.preempt_schedule_common._cond_resched.down_write_killable.__vm_munmap=
.elf_map
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1 47%=C2=A0=C2=A0=C2=A0 +456.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.51 =C2=B1 76%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.down_write_killable.vm_mmap_=
pgoff.elf_map
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1139%=C2=A0=C2=A0=C2=A0 +758.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.10 =C2=B1 66%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.dput.dcache_dir_close.__fput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.91 =C2=B1 89%=C2=A0=C2=A0 +6827.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 132.20 =C2=B1137%=C2=A0 perf-sched.wait_time.max.ms.pree=
mpt_schedule_common._cond_resched.dput.do_unlinkat.do_syscall_64
=C2=A0=C2=A0=C2=A0 336.18 =C2=B1140%=C2=A0=C2=A0=C2=A0=C2=A0 +73.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 581.60 =C2=B1 78%=C2=A0 perf-sched.wait_time.max.ms.pree=
mpt_schedule_common._cond_resched.dput.done_path_create.do_linkat
=C2=A0=C2=A0=C2=A0 341.13 =C2=B1137%=C2=A0=C2=A0=C2=A0 +196.8%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1012=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 per=
f-sched.wait_time.max.ms.preempt_schedule_common._cond_resched.dput.step_in=
to.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.64 =C2=B1 52%=C2=A0=C2=A0 +4704.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 463.29 =C2=B1 72%=C2=A0 perf-sched.wait_time.max.ms.pree=
mpt_schedule_common._cond_resched.dput.terminate_walk.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.94 =C2=B1 71%=C2=A0=C2=A0 +1718.2%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 17.05 =C2=B1 33%=C2=A0 perf-sched.wait_time.max.ms=
.preempt_schedule_common._cond_resched.exit_mmap.mmput.begin_new_exec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.94 =C2=B1 41%=C2=A0=C2=A0=C2=A0 +683.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 54.36 =C2=B1113%=C2=A0 perf-sched.wait_time.max=
.ms.preempt_schedule_common._cond_resched.exit_mmap.mmput.do_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1119%=C2=A0=C2=A0=C2=A0 +888.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.65 =C2=B1 80%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.__anon_vma_=
prepare.do_anonymous_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1 51%=C2=A0=C2=A0 +3060.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 13.37 =C2=B1 71%=C2=A0 perf-sched.wait_time.max.ms=
.preempt_schedule_common._cond_resched.kmem_cache_alloc.__d_alloc.d_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.61 =C2=B1 71%=C2=A0 +29984.9%=C2=A0=C2=A0=
=C2=A0=C2=A0 484.07 =C2=B1 65%=C2=A0 perf-sched.wait_time.max.ms.preempt_sc=
hedule_common._cond_resched.kmem_cache_alloc.__d_alloc.d_alloc_cursor
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.01 =C2=B1 76%=C2=A0=C2=A0=C2=A0 +779.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.90 =C2=B1 68%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.copy_fs_str=
uct.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.25 =C2=B1 73%=C2=A0=C2=A0=C2=A0 +327.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.36 =C2=B1 28%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.getname_fla=
gs.user_path_at_empty
=C2=A0=C2=A0=C2=A0=C2=A0 23.94 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +259.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 85.92 =C2=B1 53%=C2=A0 perf-sched.wait_time.max.ms=
.preempt_schedule_common._cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.01 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 +52.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.13 =C2=B1 24%=C2=A0 perf-sched.wai=
t_time.max.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc_trace.=
perf_event_mmap.mmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1 77%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_time.max.ms.preempt_schedule_common._cond_resched.mu=
tex_lock_killable.begin_new_exec.load_elf_binary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1 97%=C2=A0=C2=A0 +1470.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.36 =C2=B1 97%=C2=A0 perf-sched.wait_time.m=
ax.ms.preempt_schedule_common._cond_resched.remove_vma.__do_munmap.__vm_mun=
map
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.81 =C2=B1 79%=C2=A0=C2=A0=C2=A0 +146.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.92 =C2=B1 44%=C2=A0 perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.remove_vma.__do_munmap.mmap_=
region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.51 =C2=B1 23%=C2=A0=C2=A0=C2=A0 +226.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.54 =C2=B1 98%=C2=A0 perf-sched.wait_time.max=
.ms.preempt_schedule_common._cond_resched.remove_vma.exit_mmap.mmput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.36 =C2=B1116%=C2=A0=C2=A0=C2=A0 +497.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 44.00 =C2=B1 94%=C2=A0 perf-sched.wait_time.max=
.ms.preempt_schedule_common._cond_resched.shmem_undo_range.shmem_truncate_r=
ange.shmem_evict_inode
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1495 =C2=B1 31%=C2=A0=C2=A0=C2=A0 +114.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3203 =C2=B1=C2=A0 4%=C2=A0 perf-sched.wai=
t_time.max.ms.preempt_schedule_common._cond_resched.smpboot_thread_fn.kthre=
ad.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.21 =C2=B1 22%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_time.max.ms.preempt_schedule_common._cond_resched.st=
op_one_cpu.migrate_task_to.task_numa_migrate
=C2=A0=C2=A0=C2=A0=C2=A0 12.64 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0 +300.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 50.66 =C2=B1 43%=C2=A0 perf-sched.wait_time.max=
.ms.preempt_schedule_common._cond_resched.stop_one_cpu.sched_exec.bprm_exec=
ve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.61 =C2=B1 29%=C2=A0=C2=A0=C2=A0 -100.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 perf-sched.wait_time.max.ms.preempt_schedule_common._cond_resched.wa=
it_for_completion.stop_two_cpus.migrate_swap
=C2=A0=C2=A0=C2=A0=C2=A0 20.69 =C2=B1 50%=C2=A0=C2=A0=C2=A0 -100.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 perf-sched.wait_time.max.ms.rwsem_down_read_slowpath.page_lock_anon_vma=
_read.rmap_walk_anon.try_to_unmap
=C2=A0=C2=A0=C2=A0=C2=A0 19.13 =C2=B1 36%=C2=A0=C2=A0=C2=A0 -100.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 perf-sched.wait_time.max.ms.rwsem_down_read_slowpath.rmap_walk_anon.rem=
ove_migration_ptes.migrate_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.03 =C2=B1 55%=C2=A0=C2=A0=C2=A0=C2=A0 -96.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1151%=C2=A0 perf-sched.wai=
t_time.max.ms.rwsem_down_write_slowpath.__put_anon_vma.unlink_anon_vmas.fre=
e_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.53 =C2=B1 25%=C2=A0=C2=A0=C2=A0 +397.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 37.43 =C2=B1 76%=C2=A0 perf-sched.wait_time.max=
.ms.rwsem_down_write_slowpath.__vma_adjust.__split_vma.mprotect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0 31.44 =C2=B1 23%=C2=A0=C2=A0 +1888.2%=C2=A0=C2=A0=
=C2=A0=C2=A0 625.17 =C2=B1 62%=C2=A0 perf-sched.wait_time.max.ms.rwsem_down=
_write_slowpath.dup_mmap.dup_mm.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.32 =C2=B1 99%=C2=A0=C2=A0=C2=A0=C2=A0 -88.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1 87%=C2=A0 perf-sched.wai=
t_time.max.ms.rwsem_down_write_slowpath.unlink_anon_vmas.free_pgtables.exit=
_mmap
=C2=A0=C2=A0=C2=A0=C2=A0 20.37 =C2=B1 28%=C2=A0=C2=A0=C2=A0 +184.7%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 57.99 =C2=B1 80%=C2=A0 perf-sched.wait_time.max.ms=
.rwsem_down_write_slowpath.unlink_file_vma.free_pgtables.exit_mmap
=C2=A0=C2=A0=C2=A0=C2=A0 11.76 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +170.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 31.80 =C2=B1 43%=C2=A0 perf-sched.wait_time.max.ms=
.rwsem_down_write_slowpath.vma_link.mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5176=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -31.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3569=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_time.max.ms.schedule_h=
rtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5585=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -30.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3899=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-sched.wait_time.max.ms.schedule_h=
rtimeout_range_clock.poll_schedule_timeout.constprop.0.do_select
=C2=A0=C2=A0=C2=A0 505.14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +15.5%=C2=A0=C2=A0=C2=A0=C2=A0 583.69 =C2=B1=C2=A0 5%=C2=A0 pe=
rf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4816 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 -31.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3297 =C2=B1=C2=A0 3%=C2=A0 perf-sche=
d.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1791=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -20.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1420 =C2=
=B1=C2=A0 3%=C2=A0 perf-sched.wait_time.max.ms.worker_thread.kthread.ret_fr=
om_fork
=C2=A0=C2=A0=C2=A0=C2=A0 29455 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +33.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39449 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU0.=
NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 25470=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +32.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33628=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU0.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26529 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +43.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 38110 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU1.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22797 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32782 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU1.=
SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28371 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +54.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43762 =C2=B1 13%=C2=A0 softirqs.CPU10.NET_=
RX
=C2=A0=C2=A0=C2=A0=C2=A0 22629 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32439 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU10=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27171 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37593 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU10=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23180 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32248=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU100.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28196 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +34.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37895 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU10=
1.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32511 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU101.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27883 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40015 =C2=B1 11%=C2=A0 softirqs.CPU102.NET=
_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22937 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32444 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU10=
2.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28037=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39461 =C2=B1=C2=A0 7%=
=C2=A0 softirqs.CPU103.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23000 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32435 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU10=
3.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28345=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38229 =C2=B1=C2=A0 9%=
=C2=A0 softirqs.CPU104.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22314 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32417 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU10=
4.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27097 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38114 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU10=
5.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22615 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32294 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU10=
5.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26463 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +50.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39943 =C2=B1 12%=C2=A0 softirqs.CPU106.NET=
_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22730 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32319 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU10=
6.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27957 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +29.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36058 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU10=
7.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22901 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32362 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU10=
7.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29320 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +33.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39101 =C2=B1 10%=C2=A0 softirqs.CPU108.NET=
_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22873 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32301 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU10=
8.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29106 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +31.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38266 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU10=
9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22591 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32336=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU109.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28741 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +34.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38676 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU11=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22399 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +44.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32364 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU11=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26804 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38006 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU11=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22766 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32619 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU11=
0.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25623 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37393 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU11=
1.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22586 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32391 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU11=
1.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28020 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +31.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36917 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU11=
2.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22741=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32349 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU112.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28310 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +35.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38234 =C2=B1 12%=C2=A0 softirqs.CPU113.NET=
_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22884 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32577 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU11=
3.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25668 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37457 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU11=
4.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22706 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32178=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU114.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28637 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +37.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39418 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU11=
5.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22796=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32139=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU115.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26953 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38291 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU11=
6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22646=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32171 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU116.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28477 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +35.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38544 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU11=
7.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22866 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32189 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU11=
7.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27445 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38675 =C2=B1 11%=C2=A0 softirqs.CPU118.NET=
_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22902=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32386 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU118.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26884 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37182 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU11=
9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22721 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32265 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU11=
9.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28376 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +36.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38767 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU12=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22706 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31877 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU12=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27315 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39644 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU12=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23157 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32175=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU120.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26387 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +51.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40015 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU12=
1.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22856=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +38.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31646=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU121.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25176 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +67.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42194 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU12=
2.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22775=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31962=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU122.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25636 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +60.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41225 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU12=
3.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23322=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +37.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32124=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU123.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29777 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +37.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40911 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU12=
4.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23141 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32098=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU124.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25720 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +53.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39356 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU12=
5.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23140 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32104=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU125.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27106 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +44.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39214 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU12=
6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33141 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +11.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36924 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU12=
6.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 23154 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32083=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU126.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25748 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +53.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39601 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU12=
7.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23011 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32068=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU127.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28647 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +42.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 40718=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 softirqs.CPU128.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34186 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +11.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38137 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU12=
8.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 23173 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32016=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU128.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27101 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +48.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40259 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU12=
9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22818=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32045=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU129.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 31534 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +25.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 39696 =C2=B1 10%=C2=A0 softirqs.CPU13.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22674 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32108 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU13=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27452=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +48.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40871 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU130.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23203=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +37.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31807 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU130.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26896 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +51.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40860 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU13=
1.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23148 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +37.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31814=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU131.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28393 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40084 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU13=
2.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23200=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +36.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31706=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU132.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26482 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +54.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40891 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU13=
3.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22970=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32382 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU133.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26774 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +44.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38735 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU13=
4.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33646=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +10.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37240 =C2=B1=C2=A0 7%=
=C2=A0 softirqs.CPU134.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 23088 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32008=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU134.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26666=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +54.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41081 =C2=B1=C2=A0 7%=
=C2=A0 softirqs.CPU135.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33456 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +14.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38141 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU13=
5.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22804=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31925=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU135.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26562 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +55.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41276 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU13=
6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23134 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32141=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU136.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25297 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +62.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41210 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU13=
7.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22846 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31955=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU137.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26519 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +51.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40192 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU13=
8.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22478 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31858=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU138.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26079 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +62.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42258 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU13=
9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22994 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32007=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU139.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26936 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38512 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU14=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22604 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32166 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU14=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27625 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +44.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39847 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU14=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33066 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +14.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37895 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU14=
0.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22609=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32006=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU140.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26460 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +58.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41826 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU14=
1.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34319 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +9.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37601 =C2=B1=C2=A0 8%=C2=A0 softirq=
s.CPU141.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22848 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31868=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU141.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27385 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +52.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41645 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU14=
2.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22881 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32033=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU142.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27724 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40700 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU14=
3.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34109 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +10.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37789 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU14=
3.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 23092 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32110=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU143.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28902 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +30.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37711=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU144.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34885 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +8.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37745 =C2=B1=C2=A0 7%=C2=A0 softirq=
s.CPU144.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22671=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31929=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU144.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29181 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +43.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 41814 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU145.NET=
_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22655=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +38.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31371 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU145.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28250 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +33.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37815 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU14=
6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22502=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32115=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU146.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26352 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +44.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38033 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU14=
7.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34098=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +9.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37212 =C2=B1=C2=
=A0 5%=C2=A0 softirqs.CPU147.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22712=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31759=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU147.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26457 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +47.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39077 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU14=
8.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34771=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +10.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38542 =C2=B1=C2=A0 5%=
=C2=A0 softirqs.CPU148.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22626=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31925=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU148.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27813 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38431 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU14=
9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34785 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +9.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38071 =C2=B1=C2=A0 6%=C2=A0 softirq=
s.CPU149.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22830=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31857=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU149.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27674=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +35.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37356 =C2=B1 10%=C2=A0=
 softirqs.CPU15.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22708 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31984 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU15=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28914 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40073 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU15=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22867=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32054=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU150.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26654=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +46.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39145 =C2=B1=C2=A0 4%=
=C2=A0 softirqs.CPU151.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 35269 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +7.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37772 =C2=B1=C2=A0 5%=C2=A0 softirq=
s.CPU151.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22567=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31987=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU151.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27340 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +35.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37050 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU15=
2.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22561=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31833=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU152.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25682 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +52.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39264 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU15=
3.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33854 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +13.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38450 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU15=
3.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22484=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31972=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU153.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27824 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40343=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU154.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34996 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +9.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38165 =C2=B1=C2=A0 5%=C2=A0 softirq=
s.CPU154.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22409=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31717=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU154.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26948 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +51.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40940 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU15=
5.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 35069=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +10.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38779 =C2=B1=C2=A0 5%=
=C2=A0 softirqs.CPU155.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22696=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32266=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU155.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26787 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39032 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU15=
6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22583=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31902=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU156.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26065 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +47.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38529 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU15=
7.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22442=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31866=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU157.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27310 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38826 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU15=
8.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22593=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31752=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU158.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26411 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +47.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39018=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU159.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22535=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32103=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU159.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28586 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +30.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37421 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU16=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22668 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32879 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU16=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27341 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38105 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU16=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22494=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31829=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU160.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26309=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +47.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38870 =C2=B1=C2=A0 6%=
=C2=A0 softirqs.CPU161.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22652=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31964=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU161.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28102 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +35.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38031 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU16=
2.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34995 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +6.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37255 =C2=B1=C2=A0 7%=C2=A0 softirq=
s.CPU162.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22800=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32000=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU162.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 24958 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +53.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38412 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU16=
3.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22582=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32079=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU163.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27327 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +36.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37415 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU16=
4.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22516=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +43.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32204=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU164.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27456 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40188 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU16=
5.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22509=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32104=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU165.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26840 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38118 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU16=
6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22847=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32002=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU166.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28288 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41208 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU16=
7.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22656=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +43.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32529 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU167.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27845=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38982 =C2=B1=C2=A0 5%=
=C2=A0 softirqs.CPU168.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22861=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31984=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU168.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26590 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +55.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41316 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU16=
9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22774=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31990=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU169.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27965 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +34.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37581 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU17=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22416=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +43.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32064 =C2=B1=C2=A0 3%=
=C2=A0 softirqs.CPU17.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29095 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41848 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU17=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22753=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32295=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU170.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25289=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +56.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39538 =C2=B1=C2=A0 4%=
=C2=A0 softirqs.CPU171.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33179 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +7.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35615 =C2=B1=C2=A0 7%=C2=A0 softirq=
s.CPU171.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22899=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32171=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU171.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25293 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +60.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40480 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU17=
2.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22584=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32196=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU172.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27200 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +50.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40831 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU17=
3.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22804=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32183=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU173.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27779 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41464 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU17=
4.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22569=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32056=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU174.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26980 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40261 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU17=
5.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22818=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32220=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU175.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27496 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +48.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40909 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU17=
6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22818=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32139=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU176.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27197=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38817 =C2=B1=C2=A0 8%=
=C2=A0 softirqs.CPU177.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22770=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31976=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU177.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27688 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40318 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU17=
8.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22820=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31937=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU178.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26078 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +51.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39444 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU17=
9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22716=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31912=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU179.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27755 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39191 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU18=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22621 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31900=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU18.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28019 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39303 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU18=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22549=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31869=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU180.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27487 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +46.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 40381 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU181.NET=
_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22776=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31943=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU181.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26432 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +55.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40971 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU18=
2.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22815=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32105=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU182.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27997 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41010 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU18=
3.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22875=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32004=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU183.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 24478 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +67.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 40939 =C2=B1 10%=C2=A0 softirqs.CPU184.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22192 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32177=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU184.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27366=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38417 =C2=B1=C2=A0 8%=
=C2=A0 softirqs.CPU185.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22879=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32119=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU185.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28955 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +36.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39443 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU18=
6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22929=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31913=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU186.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26140 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +50.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39290 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU18=
7.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23163=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +38.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32110=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU187.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26199=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +56.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40920 =C2=B1 11%=C2=A0=
 softirqs.CPU188.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22814=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32276=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU188.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27178 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40699 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU18=
9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22673=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32083=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU189.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27438 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38069 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU19=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22583 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32066 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU19=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26118 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37257 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU19=
0.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22621=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32022=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU190.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25609 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +52.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39055 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU19=
1.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22510=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31618=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU191.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28410 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +34.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38091 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU2.=
NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22190=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +43.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31937 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU2.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28923 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +37.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 39780 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU20.NET_=
RX
=C2=A0=C2=A0=C2=A0=C2=A0 22749 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32113 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU20=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27078 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37429 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU21=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22477 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32029 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU21=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26006 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38922 =C2=B1 11%=C2=A0 softirqs.CPU22.NET_=
RX
=C2=A0=C2=A0=C2=A0=C2=A0 22743 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32108 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU22=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28691 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40046 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU23=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22668 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31976 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU23=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 32698 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +27.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41704 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU24=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23538=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31764=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU24.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27793=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +44.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40038 =C2=B1=C2=A0 9%=
=C2=A0 softirqs.CPU25.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22892 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31602=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU25.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 30671 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +36.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41822 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU26=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23207 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +36.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31744=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU26.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26281 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +57.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41417 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU27=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22758 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31952=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU27.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26713 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +54.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41300 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU28=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33769 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +11.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37593 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU28=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22857 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31586=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU28.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27219 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +53.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41664 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU29=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22988 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31775=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU29.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26571 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +51.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40171 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU3.=
NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23000 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31946 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU3.=
SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26856 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +57.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42396 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU30=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22915 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31629=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU30.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28747 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40898 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU31=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22863 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31864=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU31.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26418 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +56.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41211 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU32=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22861 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31613=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU32.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27379 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +52.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 41619 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU33.NET_=
RX
=C2=A0=C2=A0=C2=A0=C2=A0 22743=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +38.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31538=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU33.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27331 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +47.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40432 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU34=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23071 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +37.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31730=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU34.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27997 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41922 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU35=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34868 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +10.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38580 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU35=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 23029 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +37.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31635=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU35.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26763 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +59.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42657 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU36=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22829=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +38.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31657=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU36.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27252=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +48.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40489 =C2=B1=C2=A0 3%=
=C2=A0 softirqs.CPU37.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22546 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31603=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU37.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26072 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +67.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43643 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU38=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22711 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31710=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU38.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27579 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +57.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43518 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU39=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22705 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31596=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU39.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28570 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +30.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37345 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU4.=
NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22763 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32189 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU4.=
SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26544 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +52.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40348 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU40=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22746 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31726=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU40.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28165 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +47.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41432 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU41=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22791 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31624=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU41.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28718 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41176 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU42=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22603=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31493=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU42.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27257 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +54.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42085 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU43=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22763 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31742=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU43.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26604 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +58.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42041 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU44=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33772 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +13.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38218 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU44=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22764 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31790=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU44.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26786 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +54.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41361 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU45=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34271 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +10.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37764 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU45=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22813 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31565=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU45.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28082 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40154 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU46=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34703 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +9.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37818 =C2=B1=C2=A0 6%=C2=A0 softirq=
s.CPU46.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22800 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31785=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU46.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28229 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42156 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU47=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 35007 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +9.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38323 =C2=B1=C2=A0 7%=C2=A0 softirq=
s.CPU47.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22878 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +38.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31613=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU47.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29087 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40686 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU48=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22510=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31621=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU48.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27833 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +47.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40991 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU49=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22119=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31572=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU49.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28242=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +35.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38374 =C2=B1=C2=A0 6%=
=C2=A0 softirqs.CPU5.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22636 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32161 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU5.=
SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28615 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +37.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39250 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU50=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34409=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +12.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38623 =C2=B1=C2=A0 5%=
=C2=A0 softirqs.CPU50.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22248=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31482=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU50.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28739 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40405=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU51.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22458 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31679=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU51.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28428 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +34.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38284=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU52.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22308=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31601=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU52.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29032 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +33.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38786 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU53=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34502 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +10.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37943 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU53=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22408=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31526=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU53.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27640 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39380 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU54=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22473=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31609=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU54.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26943 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38374 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU55=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22289 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31800=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU55.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27400 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38409 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU56=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22354=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31300=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU56.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26999 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39554 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU57=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34130 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +12.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38546 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU57=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22383=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31569=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU57.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26684 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +50.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40177 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU58=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 34403 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +11.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38510 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU58=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 21983=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +44.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31667=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU58.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28353=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40037 =C2=B1=C2=A0 5%=
=C2=A0 softirqs.CPU59.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22456=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31589=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU59.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27801 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +34.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 37398 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU6.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22604 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32058 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU6.=
SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26348 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +55.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41023=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU60.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22333=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31517=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU60.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27592 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39449 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU61=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22340=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31449=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU61.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27991 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39173 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU62=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22336=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31505=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU62.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27979 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39848 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU63=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22455=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31595=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU63.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27343 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +47.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40224 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU64=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22264=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31709=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU64.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 30930 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +24.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 38565 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU65.NET_=
RX
=C2=A0=C2=A0=C2=A0=C2=A0 22563=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31572=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU65.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27228 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38207 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU66=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33624 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +10.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37300 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU66=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22263=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31615=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU66.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26629 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38826 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU67=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22267=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31644=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU67.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27039 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39598 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU68=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22376=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31552=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU68.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26835 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37921 =C2=B1=C2=A0 4%=C2=A0 softirqs.CPU69=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22292=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31695=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU69.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28526 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +36.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38980 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU7.=
NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22556 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +42.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32026 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU7.=
SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27716 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +44.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39956 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU70=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22376=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31421=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU70.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25987 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +54.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40017 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU71=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22256=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31803=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU71.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 30271 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +31.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39836 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU72=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22864=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +39.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31988=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU72.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28646 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +40.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40326 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU73=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22434=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31715=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU73.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27673 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +44.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40027 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU74=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22454=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31688=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU74.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26780 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +50.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40207 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU75=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22613=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31840=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU75.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28051=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +45.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40826 =C2=B1=C2=A0 5%=
=C2=A0 softirqs.CPU76.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22608=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31879=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU76.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26339 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39425 =C2=B1 10%=C2=A0 softirqs.CPU77.NET_=
RX
=C2=A0=C2=A0=C2=A0=C2=A0 22329=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +43.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32019=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU77.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28822=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +38.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40011 =C2=B1=C2=A0 6%=
=C2=A0 softirqs.CPU78.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22588=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31903=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU78.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26965 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +50.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40656 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU79=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22337=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31701=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU79.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28854 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +36.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39243 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU8.=
NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33868 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +8.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36644 =C2=B1=C2=A0 4%=C2=A0 softirq=
s.CPU8.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22572 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31966 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU8.=
SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25294 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +62.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41046 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU80=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22560=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31949=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU80.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27226 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +44.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39272 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU81=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22433=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31802=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU81.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28179 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41089 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU82=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22503=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31742=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU82.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25370 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +65.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41993 =C2=B1=C2=A0 3%=C2=A0 softirqs.CPU83=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33224 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +9.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36387 =C2=B1=C2=A0 5%=C2=A0 softirq=
s.CPU83.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22482=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +43.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32239=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU83.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29150 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41357 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU84=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22540=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31629=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU84.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27566 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40032 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU85=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22614=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +40.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31779=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU85.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26616 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +48.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39392 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU86=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22503=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31899=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU86.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27217=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +54.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42097 =C2=B1=C2=A0 4%=
=C2=A0 softirqs.CPU87.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 32656=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +11.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36286 =C2=B1=C2=A0 8%=
=C2=A0 softirqs.CPU87.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22383=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31744=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU87.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 29444 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +35.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39821 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU88=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22560 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +41.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31887=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU88.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26383 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39403 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU89=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22647=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31984=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU89.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27413=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +45.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39873 =C2=B1=C2=A0 3%=
=C2=A0 softirqs.CPU9.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22436 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32154 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU9.=
SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28117 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39110 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU90=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22524=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31903=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU90.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 28805 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41207 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU91=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22981=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +38.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31714=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU91.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27920 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +46.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40778 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU92=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33255 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +8.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36199 =C2=B1=C2=A0 7%=C2=A0 softirq=
s.CPU92.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22467=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31955=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU92.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26935 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +49.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 40211 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU93=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22407=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31898=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU93.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 25585 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +63.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 41880 =C2=B1=C2=A0 5%=C2=A0 softirqs.CPU94=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 33095 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +10.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36528 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU94=
.RCU
=C2=A0=C2=A0=C2=A0=C2=A0 22417=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31761=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU94.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27659 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39639 =C2=B1=C2=A0 6%=C2=A0 softirqs.CPU95=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 21998=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +42.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31361=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU95.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26582 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38128 =C2=B1=C2=A0 8%=C2=A0 softirqs.CPU96=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22170 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +45.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32297=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.CPU96.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27522 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +39.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38353 =C2=B1=C2=A0 9%=C2=A0 softirqs.CPU97=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22468 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32209 =C2=B1=C2=A0 2%=C2=A0 softirqs.CPU97=
.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 27117 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +39.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 37902 =C2=B1 10%=C2=A0 softirqs.CPU98.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 22600=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +43.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32361 =C2=B1=C2=A0 2%=
=C2=A0 softirqs.CPU98.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 26557 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +43.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38161 =C2=B1=C2=A0 7%=C2=A0 softirqs.CPU99=
.NET_RX
=C2=A0=C2=A0=C2=A0=C2=A0 23003=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +41.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32565=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 softirqs.CPU99.SCHED
=C2=A0=C2=A0 5270210=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +44.9%=C2=A0=C2=A0=C2=A0 7635912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.NET_RX
=C2=A0=C2=A0 4357512=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +40.8%=C2=A0=C2=A0=C2=A0 6136169=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 softirqs.SCHED
=C2=A0=C2=A0=C2=A0=C2=A0 80.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -80.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.calltrace.cycles-pp.nativ=
e_queued_spin_lock_slowpath._raw_spin_lock.scan_positives.dcache_readdir.it=
erate_dir
=C2=A0=C2=A0=C2=A0=C2=A0 81.90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.02 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.calltrace.cycles-pp.dcache_readdir.iterate_dir.__=
x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 81.91=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.03 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.calltrace.cycles-pp.__x64_sys_getdents64.do_sysca=
ll_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 81.90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.03 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.calltrace.cycles-pp.iterate_dir.__x64_sys_getdent=
s64.do_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 80.60=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.80 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.calltrace.cycles-pp.scan_positives.dcache_readdir=
.iterate_dir.__x64_sys_getdents64.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0 80.30=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.63 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.calltrace.cycles-pp._raw_spin_lock.scan_positives=
.dcache_readdir.iterate_dir.__x64_sys_getdents64
=C2=A0=C2=A0=C2=A0=C2=A0 85.88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -51.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.79 =C2=B1 13%=
=C2=A0 perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 85.98=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -50.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35.15 =C2=B1 13%=
=C2=A0 perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.80 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.calltrace.cycles-pp.do_sys_openat2.do_sys_open.do_syscall_=
64.entry_SYSCALL_64_after_hwframe.creat64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.calltrace.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe.creat64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.creat64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.82 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.creat64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.84 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.calltrace.cycles-pp.creat64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.93 =C2=B1 10%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.div_long
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.62 =C2=B1 10%=C2=A0 perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_=
do_batch.rcu_core.__softirqentry_text_start.asm_call_sysvec_on_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.62 =C2=B1 10%=C2=A0 perf-profile.calltrace.cycles-pp.__strcat_chk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1=C2=A0 9%=C2=
=A0 perf-profile.calltrace.cycles-pp.add_int.add_int
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1=C2=A0 8%=C2=
=A0 perf-profile.calltrace.cycles-pp.add_long.add_long
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.68 =C2=B1=C2=A0 9%=C2=A0 perf-profile.calltrace.cycles-pp.rcu_do_batch.rc=
u_core.__softirqentry_text_start.asm_call_sysvec_on_stack.do_softirq_own_st=
ack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.69 =C2=B1=C2=A0 9%=C2=A0 perf-profile.calltrace.cycles-pp.rcu_core.__soft=
irqentry_text_start.asm_call_sysvec_on_stack.do_softirq_own_stack.irq_exit_=
rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.73 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.__handle_mm_fau=
lt.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.76 =C2=B1=C2=A0 9%=C2=A0 perf-profile.calltrace.cycles-pp.__softirqentry_=
text_start.asm_call_sysvec_on_stack.do_softirq_own_stack.irq_exit_rcu.sysve=
c_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.76 =C2=B1=C2=A0 9%=C2=A0 perf-profile.calltrace.cycles-pp.asm_call_sysvec=
_on_stack.do_softirq_own_stack.irq_exit_rcu.sysvec_apic_timer_interrupt.asm=
_sysvec_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.76 =C2=B1=C2=A0 9%=C2=A0 perf-profile.calltrace.cycles-pp.do_softirq_own_=
stack.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interr=
upt.cpuidle_enter_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1 11%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__strncat_chk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.77 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.handle_mm_fault=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.77 =C2=B1=C2=A0 9%=C2=A0 perf-profile.calltrace.cycles-pp.irq_exit_rcu.sy=
svec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_sta=
te.cpuidle_enter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.79 =C2=B1 23%=C2=A0 perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_=
write_slowpath.__vma_adjust.__split_vma.__do_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.81 =C2=B1 23%=C2=A0 perf-profile.calltrace.cycles-pp.rwsem_down_write_slo=
wpath.__vma_adjust.__split_vma.__do_munmap.mmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.81 =C2=B1 22%=C2=A0 perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_=
write_slowpath.__vma_adjust.__split_vma.mprotect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.82 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.walk_component.=
link_path_walk.path_openat.do_filp_open.do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.84 =C2=B1 21%=C2=A0 perf-profile.calltrace.cycles-pp.rwsem_down_write_slo=
wpath.__vma_adjust.__split_vma.mprotect_fixup.do_mprotect_pkey
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.85 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.do_user_addr_fa=
ult.exc_page_fault.asm_exc_page_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.85 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.link_path_walk.=
path_openat.do_filp_open.do_sys_openat2.do_sys_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.86 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.exc_page_fault.=
asm_exc_page_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.86 =C2=B1 22%=C2=A0 perf-profile.calltrace.cycles-pp.__vma_adjust.__split=
_vma.__do_munmap.mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 24%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.unlink_fi=
le_vma.free_pgtables.unmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03 =C2=B1 22%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.vma_link.=
mmap_region.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.88 =C2=B1 24%=C2=A0 perf-profile.calltrace.cycles-pp.unlink_file_vma.free=
_pgtables.exit_mmap.mmput.begin_new_exec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.88 =C2=B1 21%=C2=A0 perf-profile.calltrace.cycles-pp.__split_vma.__do_mun=
map.mmap_region.do_mmap.vm_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.07 =C2=B1 23%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.unlink_file_vma.fr=
ee_pgtables.unmap_region.__do_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.06 =C2=B1 21%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.vma_link.mmap_regi=
on.do_mmap.vm_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.08 =C2=B1 23%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.unlink_file_vma.free_pgtables.unmap_region._=
_do_munmap.mmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.09 =C2=B1 23%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.free_pgtables.unmap_region.__do_munmap.mmap_=
region.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1 23%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.unmap_region.__do_munmap.mmap_region.do_mmap=
.vm_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.93 =C2=B1=C2=A0 4%=C2=A0 perf-profile.calltrace.cycles-pp.asm_exc_page_fa=
ult
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.10 =C2=B1 19%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.mmput.begin_new_exec=
.load_elf_binary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1 20%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.k=
sys_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.94 =C2=B1 19%=C2=A0 perf-profile.calltrace.cycles-pp.__vma_adjust.__split=
_vma.mprotect_fixup.do_mprotect_pkey.__x64_sys_mprotect
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.98 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.__split_vma.mprotect=
_fixup.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.02 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.mprotect_fixup.do_mp=
rotect_pkey.__x64_sys_mprotect.do_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.22 =C2=B1 24%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmpu=
t.do_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.03 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.__x64_sys_mprotect.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.03 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.do_mprotect_pkey.__x=
64_sys_mprotect.do_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 72%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.45 =C2=B1 11%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 72%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.45 =C2=B1 11%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.06 =C2=B1 26%=C2=A0 perf-profile.calltrace.cycles-pp._raw_spin_lock.lockr=
ef_get.d_alloc_cursor.dcache_dir_open.do_dentry_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.06 =C2=B1 26%=C2=A0 perf-profile.calltrace.cycles-pp.__cna_queued_spin_lo=
ck_slowpath._raw_spin_lock.lockref_get.d_alloc_cursor.dcache_dir_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.06 =C2=B1 26%=C2=A0 perf-profile.calltrace.cycles-pp.lockref_get.d_alloc_=
cursor.dcache_dir_open.do_dentry_open.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.06 =C2=B1 26%=C2=A0 perf-profile.calltrace.cycles-pp.dcache_dir_open.do_d=
entry_open.path_openat.do_filp_open.do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.06 =C2=B1 26%=C2=A0 perf-profile.calltrace.cycles-pp.d_alloc_cursor.dcach=
e_dir_open.do_dentry_open.path_openat.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.27 =C2=B1 14%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.27 =C2=B1 14%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.__libc_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.27 =C2=B1 14%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.__libc_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.27 =C2=B1 14%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.en=
try_SYSCALL_64_after_hwframe.__libc_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1 22%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_gro=
up_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.12 =C2=B1 11%=C2=A0 perf-profile.calltrace.cycles-pp.__cna_queued_spin_lo=
ck_slowpath._raw_spin_lock.dcache_readdir.iterate_dir.__x64_sys_getdents64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.73 =C2=B1 24%=C2=A0=
 perf-profile.calltrace.cycles-pp.exit_mmap.mmput.begin_new_exec.load_elf_b=
inary.exec_binprm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1 13%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__libc_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.73 =C2=B1 24%=C2=A0=
 perf-profile.calltrace.cycles-pp.mmput.begin_new_exec.load_elf_binary.exec=
_binprm.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.32 =C2=B1 16%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_ente=
r_state.cpuidle_enter.do_idle.cpu_startup_entry
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.15 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.drain_obj_stock.refi=
ll_obj_stock.kmem_cache_free.rcu_do_batch.rcu_core
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.78 =C2=B1 23%=C2=A0=
 perf-profile.calltrace.cycles-pp.begin_new_exec.load_elf_binary.exec_binpr=
m.bprm_execve.do_execveat_common
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.18 =C2=B1 21%=C2=A0 perf-profile.calltrace.cycles-pp.sysvec_apic_timer_in=
terrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.d=
o_idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.80 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.03 =C2=B1 22%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__do_munmap.mmap_region.do_mmap.vm_mmap_pgof=
f.ksys_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.73 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.98 =C2=B1 14%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_=
sys_exit_group
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.73 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.98 =C2=B1 14%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_g=
roup.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.28 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp._raw_spin_lock.lockr=
ef_get.do_dentry_open.path_openat.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.28 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.__cna_queued_spin_lo=
ck_slowpath._raw_spin_lock.lockref_get.do_dentry_open.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.29 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.lockref_get.do_dentr=
y_open.path_openat.do_filp_open.do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.36 =C2=B1 39%=C2=A0 perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_=
write_slowpath.dup_mmap.dup_mm.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.20 =C2=B1 13%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.21 =C2=B1 13%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.21 =C2=B1 13%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.41 =C2=B1 38%=C2=A0 perf-profile.calltrace.cycles-pp.rwsem_down_write_slo=
wpath.dup_mmap.dup_mm.copy_process.kernel_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.41 =C2=B1 17%=C2=A0 perf-profile.calltrace.cycles-pp.refill_obj_stock.kme=
m_cache_free.rcu_do_batch.rcu_core.__softirqentry_text_start
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.92 =C2=B1 26%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.unlink_fi=
le_vma.free_pgtables.exit_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.01 =C2=B1 25%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.unlink_file_vma.fr=
ee_pgtables.exit_mmap.mmput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.83 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.65 =C2=B1 14%=C2=A0=
 perf-profile.calltrace.cycles-pp.load_elf_binary.exec_binprm.bprm_execve.d=
o_execveat_common.__x64_sys_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.83 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.67 =C2=B1 13%=C2=A0=
 perf-profile.calltrace.cycles-pp.exec_binprm.bprm_execve.do_execveat_commo=
n.__x64_sys_execve.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.32 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_cl=
one.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.24 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.23 =C2=B1 21%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_=
pgoff.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.25 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.23 =C2=B1 21%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.26 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.25 =C2=B1 21%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.26 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.25 =C2=B1 21%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.68 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.72 =C2=B1 10%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.string_rtns_1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.29 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__=
do_sys_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.58 =C2=B1 13%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_=
syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
2.62 =C2=B1=C2=A0 6%=C2=A0 perf-profile.calltrace.cycles-pp.do_dentry_open.=
path_openat.do_filp_open.do_sys_openat2.do_sys_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.52 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.__soft=
irqentry_text_start.run_ksoftirqd
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.79 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.__softirqentry_text_st=
art.run_ksoftirqd.smpboot_thread_fn
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.79 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.rcu_core.__softirqentry_text_start.run_ksoft=
irqd.smpboot_thread_fn.kthread
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.79 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.__softirqentry_text_start.run_ksoftirqd.smpb=
oot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.79 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_=
from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.82 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.65 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.88 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.kthread.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.65 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.89 =C2=B1 15%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.27 =C2=B1 28%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.do_sys_openat2.do_sys_open.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.28 =C2=B1 28%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.30 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +6.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.36 =C2=B1 10%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter=
.do_idle.cpu_startup_entry
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.21 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp._raw_spin_lock.=
lockref_get_not_dead.__legitimize_path.unlazy_walk.complete_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.22 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.lockref_get_not=
_dead.__legitimize_path.unlazy_walk.complete_walk.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.22 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.unlazy_walk.com=
plete_walk.path_openat.do_filp_open.do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.22 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.__legitimize_pa=
th.unlazy_walk.complete_walk.path_openat.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.22 =C2=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.complete_walk.p=
ath_openat.do_filp_open.do_sys_openat2.do_sys_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.47 =C2=B1=C2=A0 7%=C2=A0 perf-profile.calltrace.cycles-pp._raw_spin_lock.=
lockref_put_or_lock.dput.step_into.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.47 =C2=B1=C2=A0 7%=C2=A0 perf-profile.calltrace.cycles-pp.__cna_queued_sp=
in_lock_slowpath._raw_spin_lock.lockref_put_or_lock.dput.step_into
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.47 =C2=B1=C2=A0 7%=C2=A0 perf-profile.calltrace.cycles-pp.dput.step_into.=
path_openat.do_filp_open.do_open_execat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.47 =C2=B1=C2=A0 7%=C2=A0 perf-profile.calltrace.cycles-pp.lockref_put_or_=
lock.dput.step_into.path_openat.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +7.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.99 =C2=B1 19%=C2=A0 perf-profile.calltrace.cycles-pp.do_sys_open.do_sysca=
ll_64.entry_SYSCALL_64_after_hwframe.__open64_nocancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +7.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.99 =C2=B1 19%=C2=A0 perf-profile.calltrace.cycles-pp.do_sys_openat2.do_sy=
s_open.do_syscall_64.entry_SYSCALL_64_after_hwframe.__open64_nocancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +7.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.99 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.do_syscall_64.entry_=
SYSCALL_64_after_hwframe.__open64_nocancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +7.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
7.00 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_aft=
er_hwframe.__open64_nocancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +7.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
7.00 =C2=B1 18%=C2=A0 perf-profile.calltrace.cycles-pp.__open64_nocancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.79 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +7.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.82 =C2=B1=C2=A0 8%=C2=A0 pe=
rf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cp=
u_startup_entry.start_secondary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.86 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.96 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.s=
tart_secondary.secondary_startup_64_no_verify
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.17 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.59 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary=
.secondary_startup_64_no_verify
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.17 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.59 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.seconda=
ry_startup_64_no_verify
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.17 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.59 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_v=
erify
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.20 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.63 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +8.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
8.58 =C2=B1 38%=C2=A0 perf-profile.calltrace.cycles-pp.do_execveat_common._=
_x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +8.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
8.59 =C2=B1 38%=C2=A0 perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_=
syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +11.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.23 =C2=
=B1=C2=A0 5%=C2=A0 perf-profile.calltrace.cycles-pp.__cna_queued_spin_lock_=
slowpath._raw_spin_lock.scan_positives.dcache_readdir.iterate_dir
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +11.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.95 =C2=B1=C2=A0 2%=C2=A0 perf=
-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.do_sys=
_open.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +11.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.96 =C2=B1=C2=A0 2%=C2=A0 perf=
-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.do_sys_open.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +24.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.23 =C2=
=B1=C2=A0 4%=C2=A0 perf-profile.calltrace.cycles-pp._raw_spin_lock.lockref_=
get_not_dead.__legitimize_path.unlazy_walk.pick_link
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +24.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.25 =C2=
=B1=C2=A0 4%=C2=A0 perf-profile.calltrace.cycles-pp.unlazy_walk.pick_link.s=
tep_into.path_openat.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +24.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.25 =C2=
=B1=C2=A0 4%=C2=A0 perf-profile.calltrace.cycles-pp.__legitimize_path.unlaz=
y_walk.pick_link.step_into.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +24.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.25 =C2=
=B1=C2=A0 4%=C2=A0 perf-profile.calltrace.cycles-pp.lockref_get_not_dead.__=
legitimize_path.unlazy_walk.pick_link.step_into
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +24.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.25 =C2=
=B1=C2=A0 4%=C2=A0 perf-profile.calltrace.cycles-pp.pick_link.step_into.pat=
h_openat.do_filp_open.do_open_execat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.02 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25.41 =C2=B1=C2=A0 8%=C2=A0 perf=
-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall=
_64.entry_SYSCALL_64_after_hwframe.execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.02 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25.42 =C2=B1=C2=A0 8%=C2=A0 perf=
-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.02 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25.42 =C2=B1=C2=A0 8%=C2=A0 perf=
-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.e=
xecve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.02 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25.42 =C2=B1=C2=A0 8%=C2=A0 perf=
-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25.43 =C2=B1=C2=A0 8%=C2=A0 perf=
-profile.calltrace.cycles-pp.execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +30.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.45 =C2=
=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.__cna_queued_spin_lock_=
slowpath._raw_spin_lock.lockref_get_not_dead.__legitimize_path.unlazy_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +30.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.82 =C2=
=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.step_into.path_openat.d=
o_filp_open.do_open_execat.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +30.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.84 =C2=
=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.do_filp_open.do_open_ex=
ecat.bprm_execve.do_execveat_common.__x64_sys_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +30.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.84 =C2=
=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.path_openat.do_filp_ope=
n.do_open_execat.bprm_execve.do_execveat_common
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +30.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.84 =C2=
=B1=C2=A0 3%=C2=A0 perf-profile.calltrace.cycles-pp.do_open_execat.bprm_exe=
cve.do_execveat_common.__x64_sys_execve.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.95 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +32.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.76 =C2=B1=C2=A0 3%=C2=A0 perf=
-profile.calltrace.cycles-pp.bprm_execve.do_execveat_common.__x64_sys_execv=
e.do_syscall_64.entry_SYSCALL_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0 82.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -82.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.native=
_queued_spin_lock_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0 81.90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.02 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.children.cycles-pp.dcache_readdir
=C2=A0=C2=A0=C2=A0=C2=A0 81.91=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.03 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.children.cycles-pp.__x64_sys_getdents64
=C2=A0=C2=A0=C2=A0=C2=A0 81.90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.03 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.children.cycles-pp.iterate_dir
=C2=A0=C2=A0=C2=A0=C2=A0 80.60=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -68.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.80 =C2=B1=C2=
=A0 5%=C2=A0 perf-profile.children.cycles-pp.scan_positives
=C2=A0=C2=A0=C2=A0=C2=A0 82.71=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -27.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 54.83 =C2=B1=C2=
=A0 2%=C2=A0 perf-profile.children.cycles-pp._raw_spin_lock
=C2=A0=C2=A0=C2=A0=C2=A0 89.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -18.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 71.08=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.do_syscall_64
=C2=A0=C2=A0=C2=A0=C2=A0 89.35=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -17.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 71.82=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.entry_SYSCAL=
L_64_after_hwframe
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1 20%=C2=A0 pe=
rf-profile.children.cycles-pp.llseek
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.45 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.ksys_lseek
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.45 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.dcache_dir_lseek
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 21%=C2=A0=
 perf-profile.children.cycles-pp.ktime_get_update_offsets_now
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.update_load_avg
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 17%=C2=A0=
 perf-profile.children.cycles-pp.ktime_get
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.copy_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.copy_string_kernel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.time
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.__x64_sys_rt_sigreturn
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.perf_iterate_sb
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp._raw_spin_trylock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.irqtime_account_irq
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.unlock_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.common_file_perm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.shift_arg_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.__list_del_entry=
_valid
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.__check_object_s=
ize
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.compar1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.lru_add_drain_cpu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.do_faccessat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.call_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.rebalance_domains
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.__pud_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.do_task_dead
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.new_sync_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.ip_finish_output2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.sync_regs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.d_add
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.lru_add_drain
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp._cond_resched
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.cfree
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.update_rq_clock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.pagevec_lru_move=
_fn
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.__rb_insert_augm=
ented
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.kfree
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.security_cred_fr=
ee
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1 14%=C2=A0 perf-profile.children.cycles-pp.worker_thread
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1 11%=C2=A0 perf-profile.children.cycles-pp.read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.anon_vma_interval_tree_insert
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.__might_sleep
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.simple_lookup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.create_elf_tables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.setup_arg_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 54%=C2=A0 pe=
rf-profile.children.cycles-pp.irq_enter_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 6%=C2=A0 perf-profile.children.cycles-pp.alloc_pages_vma
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 6%=C2=A0 perf-profile.children.cycles-pp.page_add_file_rm=
ap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1 17%=C2=A0 perf-profile.children.cycles-pp.memcpy_erms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 17%=C2=A0 perf-profile.children.cycles-pp.do_linkat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 17%=C2=A0 perf-profile.children.cycles-pp.__x64_sys_link
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.inode_permission
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.ip_output
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 23%=C2=A0 perf-profile.children.cycles-pp.tick_nohz_next_event
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.__close
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 12%=C2=A0 perf-profile.children.cycles-pp.try_charge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 6%=C2=A0 perf-profile.children.cycles-pp.do_truncate
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 12%=C2=A0 perf-profile.children.cycles-pp.udp_sendmsg
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 12%=C2=A0 perf-profile.children.cycles-pp.put_task_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 12%=C2=A0 perf-profile.children.cycles-pp.free_pages_and_swap_c=
ache
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.unlink
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.wake_up_new_task
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.__d_lookup_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 10%=C2=A0 perf-profile.children.cycles-pp.uncharge_batch
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.group_send_sig_info
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.__get_user_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.strnlen_user
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.security_task_kill
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.apparmor_task_kill
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 10%=C2=A0 perf-profile.children.cycles-pp.__pmd_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 4%=
=C2=A0 perf-profile.children.cycles-pp.apparmor_file_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.children.cycles-pp.kill
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.12 =C2=B1=C2=A0 3%=C2=A0 perf-profile.children.cycles-pp.security_file_fr=
ee
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.12 =C2=B1=C2=A0 3%=C2=A0 perf-profile.children.cycles-pp.apparmor_file_fr=
ee_security
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.__anon_vma_prepa=
re
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.find_vma
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.get_arg_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.__get_user_pages=
_remote
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.mem_cgroup_charge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.try_to_wake_up
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.rcu_sched_clock_=
irq
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 22%=C2=A0 perf-profile.children.cycles-pp.file_free_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1=C2=A0 6%=
=C2=A0 perf-profile.children.cycles-pp.security_file_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.getname_flags
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.kill_pid_info
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.15 =C2=B1=C2=A0 3%=C2=A0 perf-profile.children.cycles-pp.native_irq_retur=
n_iret
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 6%=C2=A0 perf-profile.children.cycles-pp.vfs_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 6%=C2=A0 perf-profile.children.cycles-pp.__mod_memcg_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 6%=C2=A0 perf-profile.children.cycles-pp.mem_cgroup_uncha=
rge_list
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.kill_something_info
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.ksys_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1 10%=C2=A0 perf-profile.children.cycles-pp.rcu_cblist_dequeue
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.vma_interval_tre=
e_remove
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.__x64_sys_kill
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1 10%=C2=A0 perf-profile.children.cycles-pp.filldir64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1 10%=C2=A0 perf-profile.children.cycles-pp.put_cred_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1 26%=C2=A0 perf-profile.children.cycles-pp.tick_nohz_get_sleep_l=
ength
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1 13%=C2=A0 perf-profile.children.cycles-pp.__slab_free
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.up_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.copy_pte_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.clear_page_erms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 5%=
=C2=A0 perf-profile.children.cycles-pp.down_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.malloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.wait4
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.down_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.__get_free_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.__put_anon_vma
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.arch_do_signal
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.__dentry_kill
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp._raw_spin_lock_irqsave
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.strncpy_from_user
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.aa_get_task_label
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.schedule_idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1 17%=C2=A0 perf-profile.children.cycles-pp.rwsem_wake
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.___might_sleep
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.copy_strings
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.update_cfs_group
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 11%=C2=A0 pe=
rf-profile.children.cycles-pp.new_sync_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.sched_exec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.alloc_set_pte
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.children.cycles-pp.get_page_from_freelist
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.prep_new_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.__pte_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.children.cycles-pp.__mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.sock_sendmsg
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.perf_event_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.__memcg_kmem_unc=
harge_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1 45%=C2=A0 perf-profile.children.cycles-pp.dcache_dir_close
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.sock_write_iter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1=C2=A0 7%=C2=A0 perf-profile.children.cycles-pp.lockref_put_retu=
rn
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 9%=C2=
=A0 perf-profile.children.cycles-pp.ksys_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.apparmor_task_getsecid
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 9%=
=C2=A0 perf-profile.children.cycles-pp.vfs_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.11 =C2=B1 10%=C2=A0 perf-profile.children.cycles-pp.do_unlinkat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.find_idlest_group
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.11 =C2=B1 33%=C2=A0 perf-profile.children.cycles-pp.__close_nocancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.11 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.vm_area_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.do_anonymous_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.security_task_getsecid
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.children.cycles-pp.__xstat64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles=
-pp.__mod_memcg_lruvec_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.obj_cgroup_charge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.18 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.apparmor_file_al=
loc_security
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.11 =C2=B1=C2=A0 3%=C2=A0 perf-profile.children.cycles-pp.__clear_user
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.task_tick_fair
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.find_busiest_group
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.update_sd_lb_stats
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.11 =C2=B1=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.ima_file_check
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.vma_interval_tree_insert
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.page_remove_rmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.wp_page_copy
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.children.cycles-pp.pte_alloc_one
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.schedule
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp._dl_addr
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.12 =C2=B1=C2=A0 8%=C2=A0 perf-profile.children.cycles-pp.finish_task_swit=
ch
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.12 =C2=B1 13%=C2=A0 perf-profile.children.cycles-pp.__put_task_struct
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.20 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.security_file_al=
loc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.children.cycles-pp.select_task_rq_fair
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.load_balance
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1=C2=A0 4%=
=C2=A0 perf-profile.children.cycles-pp.vm_area_dup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.__d_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 7%=C2=
=A0 perf-profile.children.cycles-pp.do_wait
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.pick_next_task_fair
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.anon_vma_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 8%=C2=
=A0 perf-profile.children.cycles-pp.__do_sys_wait4
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 8%=C2=
=A0 perf-profile.children.cycles-pp.kernel_wait4
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.children.cycles-pp.__vm_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.scheduler_tick
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.14 =C2=B1=C2=A0 3%=C2=A0 perf-profile.children.cycles-pp.cna_order_queue
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.copy_page_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1=C2=A0 7%=C2=
=A0 perf-profile.children.cycles-pp.__memcg_kmem_charge_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.15 =C2=B1=C2=A0 5%=C2=A0 perf-profile.children.cycles-pp.newidle_balance
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 19%=C2=A0=
 perf-profile.children.cycles-pp.__lock_parent
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.rwsem_spin_on_owner
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.release_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.page_counter_try_charge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.div_int
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.update_process_times
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.tick_sched_handle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.__memcg_kmem_charge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.anon_vma_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.mem_rtns_1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.46 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.div_short
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.remove_vma
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.64 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.tick_sched_timer
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1=C2=A0 5%=
=C2=A0 perf-profile.children.cycles-pp.setlocale
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.__schedule
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.tlb_flush_mmu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.tlb_finish_mmu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1 11%=C2=A0=
 perf-profile.children.cycles-pp.__fput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.__alloc_pages_nodemask
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.76 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.__hrtimer_run_queues
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.46 =C2=B1 11%=C2=A0 pe=
rf-profile.children.cycles-pp.add_short
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.lookup_fast
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.unlink_anon_vmas
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.get_obj_cgroup_from_current
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1 10%=C2=A0=
 perf-profile.children.cycles-pp.task_work_run
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.children.cycles-pp.iterate_supers
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.__x64_sys_sync
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.ksys_sync
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.d_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.sync
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03 =C2=B1 11%=C2=A0 pe=
rf-profile.children.cycles-pp.hrtimer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1=C2=A0 8%=
=C2=A0 perf-profile.children.cycles-pp.exit_to_user_mode_prepare
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.load_elf_interp
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.zap_pte_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.unmap_page_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.84 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.creat64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.unmap_vmas
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1 11%=C2=A0 pe=
rf-profile.children.cycles-pp.propagate_protected_usage
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.__strcat_chk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1=C2=A0 4%=
=C2=A0 perf-profile.children.cycles-pp.path_lookupat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1=C2=A0 4%=
=C2=A0 perf-profile.children.cycles-pp.filename_lookup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1=C2=A0 4%=
=C2=A0 perf-profile.children.cycles-pp.__do_sys_newstat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.children.cycles-pp.__alloc_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.alloc_empty_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1=C2=A0 4%=
=C2=A0 perf-profile.children.cycles-pp.vfs_statx
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.elf_map
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.children.cycles-pp.d_alloc_parallel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.68 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.filemap_map_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.children.cycles-pp.__lookup_slow
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.73 =C2=B1 41%=C2=A0 pe=
rf-profile.children.cycles-pp.syscall_exit_to_user_mode
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.93 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.div_long
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.78 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.do_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1=C2=A0 9%=C2=
=A0 perf-profile.children.cycles-pp.add_int
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1=C2=A0 8%=C2=
=A0 perf-profile.children.cycles-pp.add_long
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1 11%=C2=A0 pe=
rf-profile.children.cycles-pp.__strncat_chk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.74 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.terminate_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.02 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.mprotect_fixup
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.__x64_sys_mprotect
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.do_mprotect_pkey
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.90 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.__memcg_kmem_uncharge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.46 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.20 =C2=B1 21%=C2=A0 pe=
rf-profile.children.cycles-pp.unmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.kmem_cache_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.23 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.__handle_mm_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.30 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.children.cycles-pp.handle_mm_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.37 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.do_user_addr_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.47 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.30 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.children.cycles-pp.link_path_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.38 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.exc_page_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1=C2=A0 3%=
=C2=A0 perf-profile.children.cycles-pp.walk_component
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.34 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.__libc_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.41 =C2=B1 16%=C2=A0 pe=
rf-profile.children.cycles-pp.vma_link
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.51 =C2=B1=C2=A0 4%=
=C2=A0 perf-profile.children.cycles-pp.asm_exc_page_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.43 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.page_counter_cancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.72 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.88 =C2=B1 19%=C2=A0 pe=
rf-profile.children.cycles-pp.__vma_adjust
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.54 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.page_counter_uncharge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.74 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.94 =C2=B1 19%=C2=A0 pe=
rf-profile.children.cycles-pp.__split_vma
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.irq_exit_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.children.cycles-pp.do_softirq_own_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.23 =C2=B1 19%=C2=A0 perf-profile.children.cycles-pp.dcache_dir_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1.23 =C2=B1 19%=C2=A0 perf-profile.children.cycles-pp.d_alloc_cursor
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.69 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.96 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.begin_new_exec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.85 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.21 =C2=B1 20%=C2=A0 pe=
rf-profile.children.cycles-pp.__do_munmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.22 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.__x64_sys_exit_group
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.22 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.do_group_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.81 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.22 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.do_exit
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.09 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.50 =C2=B1=C2=A0 8%=C2=
=A0 perf-profile.children.cycles-pp.asm_call_sysvec_on_stack
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.84 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.29 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.dup_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.39 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.84 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.drain_obj_stock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.85 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.32 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.dup_mm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.18 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.74 =C2=B1=C2=A0 8%=C2=
=A0 perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.94 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.58 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.copy_process
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.29 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.94 =C2=B1=C2=A0 7%=C2=
=A0 perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.72 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.__do_sys_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.72 =C2=B1 13%=C2=A0 pe=
rf-profile.children.cycles-pp.kernel_clone
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.47 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.25 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.refill_obj_stock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.92 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.78 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.load_elf_binary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.93 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.79 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.exec_binprm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.68 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.74 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.string_rtns_1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.30 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.37 =C2=B1 20%=C2=A0 pe=
rf-profile.children.cycles-pp.ksys_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.35 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.51 =C2=B1 24%=C2=A0 pe=
rf-profile.children.cycles-pp.unlink_file_vma
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.36 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.63 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.mmap_region
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.37 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.67 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.do_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.39 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.72 =C2=B1 18%=C2=A0 pe=
rf-profile.children.cycles-pp.vm_mmap_pgoff
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.46 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.92 =C2=B1 21%=C2=A0 pe=
rf-profile.children.cycles-pp.free_pgtables
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.40 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.88 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.exit_mmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.40 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.89 =C2=B1 14%=C2=A0 pe=
rf-profile.children.cycles-pp.mmput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
2.65 =C2=B1=C2=A0 9%=C2=A0 perf-profile.children.cycles-pp.lockref_get
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +2.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.80 =C2=B1=C2=A0 8%=
=C2=A0 perf-profile.children.cycles-pp.do_dentry_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.79 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.run_ksoftirqd
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.82 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.smpboot_thread_fn
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.65 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.88 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.kthread
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.66 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.92 =C2=B1 15%=C2=A0 pe=
rf-profile.children.cycles-pp.ret_from_fork
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.91 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.25 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.rcu_do_batch
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.92 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.25 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.rcu_core
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.97 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.38 =C2=B1 12%=C2=A0 pe=
rf-profile.children.cycles-pp.__softirqentry_text_start
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.99 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.52 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.kmem_cache_free
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.02 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.76 =C2=B1 23%=C2=A0 pe=
rf-profile.children.cycles-pp.osq_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.15 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +5.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.16 =C2=B1 22%=C2=A0 pe=
rf-profile.children.cycles-pp.rwsem_down_write_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.33 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +6.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.38 =C2=B1 10%=C2=A0 pe=
rf-profile.children.cycles-pp.intel_idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
6.37 =C2=B1=C2=A0 2%=C2=A0 perf-profile.children.cycles-pp.complete_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.19 =C2=B1 18%=C2=A0=
 perf-profile.children.cycles-pp.__open64_nocancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.89 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.99 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.children.cycles-pp.cpuidle_enter_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.89 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.00 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.children.cycles-pp.cpuidle_enter
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.48 =C2=B1=C2=A0 6%=
=C2=A0 perf-profile.children.cycles-pp.lockref_put_or_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.17 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.59 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.children.cycles-pp.start_secondary
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.20 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.63 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.children.cycles-pp.secondary_startup_64_no_verify
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.20 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.63 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.children.cycles-pp.cpu_startup_entry
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.20 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.63 =C2=B1=C2=A0 8%=C2=A0=
 perf-profile.children.cycles-pp.do_idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +7.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.04 =C2=B1=C2=A0 6%=
=C2=A0 perf-profile.children.cycles-pp.dput
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +11.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.26 =C2=B1=C2=A0 2%=C2=A0 perf=
-profile.children.cycles-pp.do_sys_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +11.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.25 =C2=B1=C2=A0 2%=C2=A0 perf=
-profile.children.cycles-pp.do_sys_openat2
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +24.=
2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.28 =C2=B1=C2=A0 4%=C2=A0 perf-prof=
ile.children.cycles-pp.pick_link
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25.43 =C2=B1=C2=A0 8%=C2=A0 perf=
-profile.children.cycles-pp.execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +30.=
8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.92 =C2=B1=C2=A0 3%=C2=A0 perf-prof=
ile.children.cycles-pp.lockref_get_not_dead
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +30.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.87 =C2=B1=C2=A0 3%=C2=A0 perf=
-profile.children.cycles-pp.do_open_execat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +30.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.95 =C2=B1=C2=A0 3%=C2=A0 perf=
-profile.children.cycles-pp.__legitimize_path
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +30.=
8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.96 =C2=B1=C2=A0 3%=C2=A0 perf-prof=
ile.children.cycles-pp.unlazy_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.20 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +31.=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31.15 =C2=B1=C2=A0 3%=C2=A0 perf-prof=
ile.children.cycles-pp.step_into
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.05 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +32.=
7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.76 =C2=B1=C2=A0 3%=C2=A0 perf-prof=
ile.children.cycles-pp.bprm_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.14 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +32.=
9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.99 =C2=B1=C2=A0 3%=C2=A0 perf-prof=
ile.children.cycles-pp.do_execveat_common
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.15 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +32.=
9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.01 =C2=B1=C2=A0 3%=C2=A0 perf-prof=
ile.children.cycles-pp.__x64_sys_execve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.16 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +41.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42.98 =C2=B1=C2=A0 2%=C2=A0 perf=
-profile.children.cycles-pp.path_openat
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.17 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +41.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 42.98 =C2=B1=C2=A0 2%=C2=A0 perf=
-profile.children.cycles-pp.do_filp_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +54.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 54.20 =C2=
=B1=C2=A0 2%=C2=A0 perf-profile.children.cycles-pp.__cna_queued_spin_lock_s=
lowpath
=C2=A0=C2=A0=C2=A0=C2=A0 81.68=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -81.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.native_que=
ued_spin_lock_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 21%=C2=A0=
 perf-profile.self.cycles-pp.ktime_get_update_offsets_now
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
link_path_walk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
apparmor_task_getsecid
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
page_add_file_rmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
common_file_perm
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
__list_del_entry_valid
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
copy_page
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
_raw_spin_trylock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.self.cycles-pp.__rb_insert_augmented
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.05 =C2=B1=C2=A0 8%=C2=A0 perf-profile.self.cycles-pp.compar1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 9%=C2=A0 perf-profile.self.cycles-pp.__might_sleep
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 9%=C2=A0 perf-profile.self.cycles-pp.sync_regs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1 14%=C2=A0 perf-profile.self.cycles-pp.__alloc_file
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 7%=C2=A0 perf-profile.self.cycles-pp.kfree
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
strnlen_user
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-profile.self.cycles-pp.=
anon_vma_interval_tree_insert
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1 11%=C2=A0 perf-profile.self.cycles-pp.memcpy_erms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.06 =C2=B1=C2=A0 6%=C2=A0 perf-profile.self.cycles-pp.free_pages_and_swap_=
cache
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 7%=C2=A0 perf-profile.self.cycles-pp.filldir64
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 7%=C2=A0 perf-profile.self.cycles-pp.rcu_sched_clock_irq
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.self.cycles-pp.__d_lookup_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 6%=C2=A0 perf-profile.self.cycles-pp.copy_pte_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 6%=C2=A0 perf-profile.self.cycles-pp._raw_spin_lock_irqsa=
ve
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 19%=C2=A0 perf-profile.self.cycles-pp.file_free_rcu
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1 10%=C2=A0 perf-profile.self.cycles-pp.rwsem_down_write_slowpath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 4%=
=C2=A0 perf-profile.self.cycles-pp.apparmor_file_open
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.12 =C2=B1=C2=A0 3%=C2=A0 perf-profile.self.cycles-pp.apparmor_file_free_s=
ecurity
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.07 =C2=B1=C2=A0 5%=C2=A0 perf-profile.self.cycles-pp.vma_interval_tree_re=
move
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.15 =C2=B1=C2=A0 3%=C2=A0 perf-profile.self.cycles-pp.native_irq_return_ir=
et
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 6%=C2=A0 perf-profile.self.cycles-pp.__mod_memcg_state
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1 11%=C2=A0 perf-profile.self.cycles-pp.rcu_cblist_dequeue
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1 14%=C2=A0 perf-profile.self.cycles-pp.__handle_mm_fault
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 5%=C2=A0 perf-profile.self.cycles-pp.down_read
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.self.cycles-pp.up_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1 13%=C2=A0 perf-profile.self.cycles-pp.__slab_free
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1=C2=A0 8%=
=C2=A0 perf-profile.self.cycles-pp.lockref_get_not_dead
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.08 =C2=B1=C2=A0 5%=C2=A0 perf-profile.self.cycles-pp.clear_page_erms
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1 70%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1=C2=A0 6%=C2=
=A0 perf-profile.self.cycles-pp.down_write
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 7%=C2=A0 perf-profile.self.cycles-pp.malloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.09 =C2=B1=C2=A0 7%=C2=A0 perf-profile.self.cycles-pp.aa_get_task_label
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.self.cycles-pp.___might_sleep
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 14%=C2=A0 pe=
rf-profile.self.cycles-pp.update_cfs_group
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.self.cycles-pp.page_remove_rmap
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.self.cycles-pp.find_idlest_group
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.10 =C2=B1=C2=A0 4%=C2=A0 perf-profile.self.cycles-pp.lockref_put_return
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1=C2=A0 6%=
=C2=A0 perf-profile.self.cycles-pp.apparmor_file_alloc_security
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.11 =C2=B1=C2=A0 7%=C2=A0 perf-profile.self.cycles-pp.update_sd_lb_stats
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.self.cycles-pp.vma_interval_tree_insert
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 5%=C2=
=A0 perf-profile.self.cycles-pp.release_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.12 =C2=B1 13%=C2=A0 perf-profile.self.cycles-pp.page_counter_uncharge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.self.cycles-pp._dl_addr
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.13 =C2=B1=C2=A0 3%=C2=A0 perf-profile.self.cycles-pp.cna_order_queue
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.self.cycles-pp.zap_pte_range
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.self.cycles-pp.page_counter_try_charge
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1=C2=A0 2%=C2=
=A0 perf-profile.self.cycles-pp.rwsem_spin_on_owner
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 11%=C2=A0 pe=
rf-profile.self.cycles-pp.div_int
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35 =C2=B1 11%=C2=A0=
 perf-profile.self.cycles-pp.mem_rtns_1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 11%=C2=A0 pe=
rf-profile.self.cycles-pp.div_short
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 10%=C2=A0 pe=
rf-profile.self.cycles-pp.add_short
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1=C2=A0 4%=C2=
=A0 perf-profile.self.cycles-pp.get_obj_cgroup_from_current
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.69 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.self.cycles-pp._raw_spin_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1=C2=A0 2%=
=C2=A0 perf-profile.self.cycles-pp.filemap_map_pages
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1=C2=A0 3%=C2=
=A0 perf-profile.self.cycles-pp.kmem_cache_alloc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 10%=C2=A0=
 perf-profile.self.cycles-pp.refill_obj_stock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1 11%=C2=A0 pe=
rf-profile.self.cycles-pp.__strcat_chk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1 11%=C2=A0 pe=
rf-profile.self.cycles-pp.propagate_protected_usage
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.46 =C2=B1 10%=C2=A0 pe=
rf-profile.self.cycles-pp.drain_obj_stock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.92 =C2=B1 10%=C2=A0 pe=
rf-profile.self.cycles-pp.div_long
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.01 =C2=B1=C2=A0 8%=C2=
=A0 perf-profile.self.cycles-pp.add_long
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.02 =C2=B1=C2=A0 9%=C2=
=A0 perf-profile.self.cycles-pp.add_int
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.10 =C2=B1 11%=C2=A0 pe=
rf-profile.self.cycles-pp.__strncat_chk
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 12%=C2=A0 pe=
rf-profile.self.cycles-pp.page_counter_cancel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.66 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.65 =C2=B1 10%=C2=A0 pe=
rf-profile.self.cycles-pp.string_rtns_1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.11 =C2=B1=C2=A0 9%=C2=
=A0 perf-profile.self.cycles-pp.kmem_cache_free
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.93 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +4.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.50 =C2=B1 22%=C2=A0 pe=
rf-profile.self.cycles-pp.osq_lock
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.33 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.38 =C2=B1 10%=C2=A0 pe=
rf-profile.self.cycles-pp.intel_idle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +53.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 53.38 =C2=
=B1=C2=A0 2%=C2=A0 perf-profile.self.cycles-pp.__cna_queued_spin_lock_slowp=
ath
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1579 =C2=B1 53%=C2=A0=C2=A0=C2=A0 +572.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 10624 =C2=B1 82%=C2=A0 interrupts.31:PCI-MSI.52=
4289-edge.eth0-TxRx-0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1203 =C2=B1112%=C2=A0=C2=A0=C2=A0=C2=A0 +61.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1940 =C2=B1 68%=C2=A0 interrupts.32:=
PCI-MSI.524290-edge.eth0-TxRx-1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8340 =C2=B1 68%=C2=A0=C2=A0=C2=A0=C2=A0 -76.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2003 =C2=B1 74%=C2=A0 interrupts.34:=
PCI-MSI.524292-edge.eth0-TxRx-3
=C2=A0=C2=A0=C2=A0 775419 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +21.9%=C2=
=A0=C2=A0=C2=A0=C2=A0 944875 =C2=B1=C2=A0 2%=C2=A0 interrupts.CAL:Function_=
call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5146 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -51.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2512 =C2=B1 34%=C2=A0 interrupt=
s.CPU0.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5146 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -51.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2512 =C2=B1 34%=C2=A0 interrupt=
s.CPU0.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1113 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +13.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1259 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU0.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 643.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +53.6%=C2=
=A0=C2=A0=C2=A0=C2=A0 988.50 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU0.TLB:TLB_=
shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4043 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +33.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5400 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU1.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5177 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -41.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3020 =C2=B1 36%=C2=A0 interrupt=
s.CPU1.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5177 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -41.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3020 =C2=B1 36%=C2=A0 interrupt=
s.CPU1.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 735.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +48.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1090 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU=
1.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 562.00 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +47.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 829.00 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU1.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1579 =C2=B1 53%=C2=A0=C2=A0=C2=A0 +572.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 10624 =C2=B1 82%=C2=A0 interrupts.CPU10.31:PCI-=
MSI.524289-edge.eth0-TxRx-0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3821 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +28.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4903 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU10.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5187 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3968 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU10.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5187 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3968 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU10.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 738.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +48.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1098 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
10.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 522.00 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0 +72.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 900.00 =C2=B1 10%=C2=A0 interrupts.CPU10.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3934 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4913 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU100.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5204 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3916 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU100.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5204 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3916 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU100.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 743.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +61.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1200 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU=
100.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 474.00 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +91.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 909.00 =C2=B1 12%=C2=A0 interrupts.CPU100.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3945 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4901 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU101.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5197 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -36.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3313 =C2=B1 26%=C2=A0 interrupt=
s.CPU101.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5197 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -36.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3313 =C2=B1 26%=C2=A0 interrupt=
s.CPU101.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 720.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +60.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1158 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
101.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 496.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +82.6%=C2=
=A0=C2=A0=C2=A0=C2=A0 906.75 =C2=B1 15%=C2=A0 interrupts.CPU101.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3918 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4810 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU102.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5186 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3879 =C2=B1 10%=C2=A0 interrupt=
s.CPU102.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5186 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3879 =C2=B1 10%=C2=A0 interrupt=
s.CPU102.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 699.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +61.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1131 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
102.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 406.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0 +108.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 846.00 =C2=B1 12%=C2=A0 interrupts.CPU102.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3882 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4897 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU103.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5224 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3399 =C2=B1 26%=C2=A0 interrupt=
s.CPU103.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5224 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3399 =C2=B1 26%=C2=A0 interrupt=
s.CPU103.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 658.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +73.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1141 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
103.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 449.00 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +89.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 851.50 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU103.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3881 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4807 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU104.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5212 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -26.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3826 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU104.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5212 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -26.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3826 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU104.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 637.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +73.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1106 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU=
104.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 423.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +90.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 804.75 =C2=B1 14%=C2=A0 interrupts.CPU104.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3845=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +20.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4623=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts.CPU105.CAL:Function_call_in=
terrupts
=C2=A0=C2=A0=C2=A0 661.33 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +68.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1114 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
105.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 467.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +87.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 876.50 =C2=B1 21%=C2=A0 interrupts.CPU105.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3959 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4679=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU106.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5251 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3905 =C2=B1 10%=C2=A0 interrupt=
s.CPU106.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5251 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3905 =C2=B1 10%=C2=A0 interrupt=
s.CPU106.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 721.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +59.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1148 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU=
106.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 419.00 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +150.8%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1050 =C2=B1 30%=C2=A0 interrupts.CPU106.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3930 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4674 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU107.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5177 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3398 =C2=B1 26%=C2=A0 interrupt=
s.CPU107.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5177 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3398 =C2=B1 26%=C2=A0 interrupt=
s.CPU107.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 665.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +75.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1169 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
107.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 445.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +83.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 818.50 =C2=B1 13%=C2=A0 interrupts.CPU107.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3915 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4735 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU108.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5255 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -36.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3350 =C2=B1 25%=C2=A0 interrupt=
s.CPU108.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5255 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -36.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3350 =C2=B1 25%=C2=A0 interrupt=
s.CPU108.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 684.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +67.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1146 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
108.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 509.00 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +66.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 846.75 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU108.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3965 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4749 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU109.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5207 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2976 =C2=B1 38%=C2=A0 interrupt=
s.CPU109.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5207 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2976 =C2=B1 38%=C2=A0 interrupt=
s.CPU109.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 701.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +55.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1087 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
109.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 510.33 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +71.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 877.25 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU109.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1203 =C2=B1112%=C2=A0=C2=A0=C2=A0=C2=A0 +61.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1940 =C2=B1 68%=C2=A0 interrupts.CPU=
11.32:PCI-MSI.524290-edge.eth0-TxRx-1
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3794 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +31.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4999 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU11.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 734.33 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +51.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1114 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
11.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 458.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +100.9%=C2=A0=C2=A0=
=C2=A0=C2=A0 921.50 =C2=B1 10%=C2=A0 interrupts.CPU11.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3949 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +27.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5029 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU110.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5230 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3385 =C2=B1 24%=C2=A0 interrupt=
s.CPU110.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5230 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3385 =C2=B1 24%=C2=A0 interrupt=
s.CPU110.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 670.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +74.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1170 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
110.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 442.00 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +88.5%=C2=
=A0=C2=A0=C2=A0=C2=A0 833.00 =C2=B1 18%=C2=A0 interrupts.CPU110.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3865 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4802 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU111.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5230 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -36.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3330 =C2=B1 25%=C2=A0 interrupt=
s.CPU111.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5230 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -36.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3330 =C2=B1 25%=C2=A0 interrupt=
s.CPU111.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 634.00 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +85.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1177 =C2=B1 10%=C2=A0 interrupts.CPU111.R=
ES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 441.33 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +96.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 866.75 =C2=B1 14%=C2=A0 interrupts.CPU111.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3873 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4829 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU112.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5121 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3326 =C2=B1 24%=C2=A0 interrupt=
s.CPU112.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5121 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3326 =C2=B1 24%=C2=A0 interrupt=
s.CPU112.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 669.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +72.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1152 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
112.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 430.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0 +111.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 911.00 =C2=B1 15%=C2=A0 interrupts.CPU112.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3921 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4885 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU113.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 672.33 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +70.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1142 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
113.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 431.33 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +98.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 855.00 =C2=B1 11%=C2=A0 interrupts.CPU113.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3779 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +27.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4827 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU114.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 641.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +79.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1149 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU114=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 504.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +77.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 893.25 =C2=B1 20%=C2=A0 interrupts.CPU114.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3904 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4693=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU115.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 651.67 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +78.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1165 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
115.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 501.67 =C2=B1 29%=C2=A0=C2=A0=C2=A0=C2=A0 +69.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 852.50 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU115.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3818 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4703=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU116.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 630.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +81.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1145 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
116.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 439.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +98.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 873.50 =C2=B1 15%=C2=A0 interrupts.CPU116.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4154 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +13.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4728=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU117.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 650.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +70.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1110 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
117.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 502.33 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +77.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 889.00 =C2=B1 10%=C2=A0 interrupts.CPU117.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3947 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4798 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU118.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 659.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +71.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1130 =C2=B1=C2=A0 4=
%=C2=A0 interrupts.CPU118.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 464.67 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +84.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 857.25 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU118.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4065 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4860 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU119.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 614.00 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +82.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1123 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
119.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 480.33 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +74.6%=C2=
=A0=C2=A0=C2=A0=C2=A0 838.50 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU119.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4011 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4848 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU12.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 769.33 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +44.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1108 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU=
12.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 502.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +96.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 986.00 =C2=B1 12%=C2=A0 interrupts.CPU12.TLB:TLB_shoo=
tdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4091 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5003 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU120.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 717.33 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +64.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1177 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
120.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 459.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +103.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 933.50 =C2=B1 15%=C2=A0 interrupts.CPU120.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3923 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4913 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU121.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 617.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +89.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1169 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
121.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 401.67 =C2=B1 22%=C2=A0=C2=A0=C2=A0 +195.5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1186 =C2=B1 39%=C2=A0 interrupts.CPU121.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3867 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5218 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU122.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 596.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +100.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1198 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU122=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 450.00 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +109.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 940.50 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU122.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4031 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4967 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU123.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 628.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +94.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1218 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
123.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 474.67 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +96.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 931.00 =C2=B1 12%=C2=A0 interrupts.CPU123.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4232 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5090 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU124.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 639.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +82.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1168 =C2=B1=C2=A0 7=
%=C2=A0 interrupts.CPU124.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 463.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +110.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 973.25 =C2=B1 11%=C2=A0 interrupts.CPU124.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3972=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +21.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4826 =C2=
=B1=C2=A0 3%=C2=A0 interrupts.CPU125.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 658.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +78.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1175 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
125.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 480.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +96.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 940.75 =C2=B1 23%=C2=A0 interrupts.CPU125.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4093 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4947 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU126.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 672.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +75.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1183 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
126.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 498.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +90.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 946.25 =C2=B1 11%=C2=A0 interrupts.CPU126.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4111 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4965 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU127.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 613.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +95.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1198 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
127.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 451.67 =C2=B1 21%=C2=A0=C2=A0=C2=A0 +109.8%=C2=A0=C2=A0=
=C2=A0=C2=A0 947.50 =C2=B1 14%=C2=A0 interrupts.CPU127.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4066=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4891 =C2=
=B1=C2=A0 3%=C2=A0 interrupts.CPU128.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5200 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3986 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU128.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5200 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3986 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU128.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 663.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +74.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1158 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
128.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 472.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +102.4%=C2=A0=C2=A0=
=C2=A0=C2=A0 956.00 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU128.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4075 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4900=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU129.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 640.33 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +73.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1108 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU=
129.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 445.33 =C2=B1 19%=C2=A0=C2=A0=C2=A0 +113.4%=C2=A0=C2=A0=
=C2=A0=C2=A0 950.25 =C2=B1 11%=C2=A0 interrupts.CPU129.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8340 =C2=B1 68%=C2=A0=C2=A0=C2=A0=C2=A0 -76.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2003 =C2=B1 74%=C2=A0 interrupts.CPU=
13.34:PCI-MSI.524292-edge.eth0-TxRx-3
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4049 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4885 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU13.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5130 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3886 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU13.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5130 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3886 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU13.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 724.00 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +57.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1142 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
13.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 532.67 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 +70.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 908.25 =C2=B1 12%=C2=A0 interrupts.CPU13.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3881 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +30.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5044 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU130.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 621.33 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +89.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1176 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU130=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 516.33 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +92.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 996.25 =C2=B1 15%=C2=A0 interrupts.CPU130.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4035 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4923 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU131.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 661.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +69.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1121 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
131.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 425.67 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +116.8%=C2=A0=C2=A0=
=C2=A0=C2=A0 922.75 =C2=B1 15%=C2=A0 interrupts.CPU131.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4345 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +13.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4924 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU132.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 694.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +68.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1172 =C2=B1=C2=A0 5=
%=C2=A0 interrupts.CPU132.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 476.00 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +94.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 926.00 =C2=B1 13%=C2=A0 interrupts.CPU132.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4091 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5018 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU133.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 663.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +68.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1119 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
133.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 534.33 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +78.7%=C2=
=A0=C2=A0=C2=A0=C2=A0 954.75 =C2=B1 13%=C2=A0 interrupts.CPU133.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3856 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4886 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU134.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5199 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3406 =C2=B1 24%=C2=A0 interrupt=
s.CPU134.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5199 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3406 =C2=B1 24%=C2=A0 interrupt=
s.CPU134.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 667.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +74.7%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1165 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU134=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 447.33 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0 +116.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 969.25 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU134.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4120 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +18.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4886 =C2=B1=C2=A0 3%=C2=A0 interrupt=
s.CPU135.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5233 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3934 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU135.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5233 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3934 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU135.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 643.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +81.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1170 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
135.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 490.00 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +88.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 923.00 =C2=B1 18%=C2=A0 interrupts.CPU135.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4092 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5026 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU136.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5225 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3430 =C2=B1 26%=C2=A0 interrupt=
s.CPU136.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5225 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3430 =C2=B1 26%=C2=A0 interrupt=
s.CPU136.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 673.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +80.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1216 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
136.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 488.00 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +87.9%=C2=
=A0=C2=A0=C2=A0=C2=A0 916.75 =C2=B1 13%=C2=A0 interrupts.CPU136.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4234 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4925 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU137.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5217 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3418 =C2=B1 24%=C2=A0 interrupt=
s.CPU137.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5217 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3418 =C2=B1 24%=C2=A0 interrupt=
s.CPU137.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 625.33 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +87.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1172 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU137=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 441.67 =C2=B1 10%=C2=A0=C2=A0=C2=A0 +115.5%=C2=A0=C2=A0=
=C2=A0=C2=A0 951.75 =C2=B1 13%=C2=A0 interrupts.CPU137.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3987 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4907 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU138.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5218 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2992 =C2=B1 38%=C2=A0 interrupt=
s.CPU138.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5218 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2992 =C2=B1 38%=C2=A0 interrupt=
s.CPU138.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 672.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +76.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1186 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
138.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 439.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +113.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 938.25 =C2=B1 11%=C2=A0 interrupts.CPU138.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4040 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4973 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU139.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 635.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +85.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1177 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
139.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 425.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +110.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 896.00 =C2=B1 10%=C2=A0 interrupts.CPU139.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3920 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4771 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU14.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5123 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2903 =C2=B1 30%=C2=A0 interrupt=
s.CPU14.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5123 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2903 =C2=B1 30%=C2=A0 interrupt=
s.CPU14.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 725.00 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +56.2%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1132 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU14.=
RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 402.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0 +110.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 844.25 =C2=B1 10%=C2=A0 interrupts.CPU14.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4006 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +19.=
8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4800 =C2=B1=C2=A0 3%=C2=A0 interrupt=
s.CPU140.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5230 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3932 =C2=B1 10%=C2=A0 interrupt=
s.CPU140.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5230 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3932 =C2=B1 10%=C2=A0 interrupt=
s.CPU140.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 578.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0 +102.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1171 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU140=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 506.00 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +90.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 963.00 =C2=B1 11%=C2=A0 interrupts.CPU140.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4080 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5131 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU141.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5148 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3418 =C2=B1 25%=C2=A0 interrupt=
s.CPU141.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5148 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3418 =C2=B1 25%=C2=A0 interrupt=
s.CPU141.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 695.00 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +74.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1214 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
141.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 503.33 =C2=B1 23%=C2=A0=C2=A0=C2=A0 +150.9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1263 =C2=B1 44%=C2=A0 interrupts.CPU141.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4155 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4843 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU142.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 638.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +82.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1161 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
142.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 509.33 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +89.0%=C2=
=A0=C2=A0=C2=A0=C2=A0 962.50 =C2=B1 14%=C2=A0 interrupts.CPU142.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4018 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4993=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU143.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 643.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +86.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1201 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU=
143.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 553.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +83.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1013 =C2=B1 10%=C2=A0 interrupts.CPU143.T=
LB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3990 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4989 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU144.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 654.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +78.0%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1164 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU144=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 415.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0 +124.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 934.25 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU144.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3875 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +30.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5056 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU145.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 647.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +79.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1163 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU145=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 445.67 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +112.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 947.75 =C2=B1 12%=C2=A0 interrupts.CPU145.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3891 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4857 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU146.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 635.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +80.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1147 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
146.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 438.67 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +127.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 996.25 =C2=B1 10%=C2=A0 interrupts.CPU146.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3899 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +28.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4990 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU147.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5189 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3915 =C2=B1 10%=C2=A0 interrupt=
s.CPU147.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5189 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3915 =C2=B1 10%=C2=A0 interrupt=
s.CPU147.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 643.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +80.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1160 =C2=B1=C2=A0 2=
%=C2=A0 interrupts.CPU147.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 430.00 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +116.9%=C2=A0=C2=A0=
=C2=A0=C2=A0 932.50 =C2=B1 17%=C2=A0 interrupts.CPU147.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4129 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +18.=
4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4889=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 interrupts.CPU148.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5219 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3932 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU148.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5219 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3932 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU148.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 588.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +93.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1139 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
148.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 501.00 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +78.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 895.25 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU148.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4186 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4953 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU149.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5185 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3509 =C2=B1 31%=C2=A0 interrupt=
s.CPU149.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5185 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3509 =C2=B1 31%=C2=A0 interrupt=
s.CPU149.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 638.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +70.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1091 =C2=B1=C2=A0 2=
%=C2=A0 interrupts.CPU149.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 558.33 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +71.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 959.25 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU149.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3912 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4750 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU15.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5197 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4013 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU15.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5197 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4013 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU15.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 776.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +39.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1080 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
15.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 473.00 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +98.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 938.75 =C2=B1 11%=C2=A0 interrupts.CPU15.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4178 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4936 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU150.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5192 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3873 =C2=B1 10%=C2=A0 interrupt=
s.CPU150.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5192 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3873 =C2=B1 10%=C2=A0 interrupt=
s.CPU150.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 678.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +64.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1115 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
150.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 513.33 =C2=B1 28%=C2=A0=C2=A0=C2=A0=C2=A0 +73.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 891.00 =C2=B1 21%=C2=A0 interrupts.CPU150.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4052 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4939 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU151.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5260 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3903 =C2=B1 10%=C2=A0 interrupt=
s.CPU151.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5260 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3903 =C2=B1 10%=C2=A0 interrupt=
s.CPU151.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 623.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +86.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1164 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
151.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 484.67 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +98.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 959.50 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU151.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3982 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4982 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU152.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5183 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3475 =C2=B1 26%=C2=A0 interrupt=
s.CPU152.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5183 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3475 =C2=B1 26%=C2=A0 interrupt=
s.CPU152.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 623.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +79.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1119 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
152.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 494.00 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +89.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 937.25 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU152.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4109 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5131 =C2=B1 10%=C2=A0 interrupt=
s.CPU153.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5179 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3536 =C2=B1 31%=C2=A0 interrupt=
s.CPU153.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5179 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3536 =C2=B1 31%=C2=A0 interrupt=
s.CPU153.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 614.67 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +94.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1197 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU=
153.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 486.00 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 +83.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 893.75 =C2=B1 13%=C2=A0 interrupts.CPU153.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4161 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4846 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU154.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 635.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +74.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1109 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
154.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 490.67 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0 +87.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 919.50 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU154.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3946 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +28.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5057 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU155.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 631.33 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +78.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1127 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
155.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 489.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +107.9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1017 =C2=B1 11%=C2=A0 interrupts.CPU155.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4028 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4887 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU156.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 627.33 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +82.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1142 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
156.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 452.33 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +113.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 963.25 =C2=B1 15%=C2=A0 interrupts.CPU156.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3893 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +28.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4993 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU157.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 637.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +80.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1149 =C2=B1=C2=A0 4=
%=C2=A0 interrupts.CPU157.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 451.67 =C2=B1 20%=C2=A0=C2=A0=C2=A0 +105.6%=C2=A0=C2=A0=
=C2=A0=C2=A0 928.50 =C2=B1 11%=C2=A0 interrupts.CPU157.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4155 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4971 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU158.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 628.33 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +75.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1104 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
158.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 468.33 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +103.4%=C2=A0=C2=A0=
=C2=A0=C2=A0 952.50 =C2=B1 11%=C2=A0 interrupts.CPU158.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3965 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4910 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU159.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 597.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +95.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1166 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
159.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 436.00 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +121.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 966.50 =C2=B1 11%=C2=A0 interrupts.CPU159.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3811 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +28.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4890 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU16.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5211 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3953 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU16.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5211 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3953 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU16.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 726.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +55.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1132 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
16.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 505.67 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +75.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 885.50 =C2=B1 12%=C2=A0 interrupts.CPU16.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3965 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4948 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU160.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 636.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +74.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1113 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
160.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 516.67 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +88.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 973.00 =C2=B1 14%=C2=A0 interrupts.CPU160.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4054 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5036 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU161.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 601.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +89.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1139 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
161.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 514.33 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +81.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 935.50 =C2=B1 12%=C2=A0 interrupts.CPU161.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4039 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +19.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4836 =C2=B1=C2=A0 3%=C2=A0 interrupt=
s.CPU162.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 643.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +67.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1075=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 interrupts.CPU162.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 469.33 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +107.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 972.00 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU162.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4022 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4864 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU163.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 609.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +92.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1172=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 interrupts.CPU163.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 431.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +146.3%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1061 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU163.TLB:T=
LB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4036=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +20.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4869 =C2=
=B1=C2=A0 4%=C2=A0 interrupts.CPU164.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 613.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +86.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1142 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
164.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 492.33 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 +87.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 925.25 =C2=B1 10%=C2=A0 interrupts.CPU164.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3957 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4883 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU165.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4307 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -42.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2492 =C2=B1 41%=C2=A0 interrupts.CPU=
165.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4307 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0 -42.=
1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2492 =C2=B1 41%=C2=A0 interrupts.CPU=
165.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 583.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +88.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1101 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU165=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 449.00 =C2=B1 22%=C2=A0=C2=A0=C2=A0 +108.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 937.25 =C2=B1 13%=C2=A0 interrupts.CPU165.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4219 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4932 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU166.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 624.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +76.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1104 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
166.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 484.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +100.6%=C2=A0=C2=A0=
=C2=A0=C2=A0 971.50 =C2=B1 17%=C2=A0 interrupts.CPU166.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4064 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +21.=
0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4918 =C2=B1=C2=A0 3%=C2=A0 interrupt=
s.CPU167.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 616.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +83.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1131 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
167.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 452.00 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +95.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 884.50 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU167.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4087 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4879 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU168.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 649.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +69.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1098 =C2=B1=C2=A0 4=
%=C2=A0 interrupts.CPU168.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 478.33 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +92.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 920.50 =C2=B1 12%=C2=A0 interrupts.CPU168.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3753 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4524 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU169.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 585.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +81.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1065 =C2=B1=C2=A0 2=
%=C2=A0 interrupts.CPU169.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 459.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0 +104.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 937.50 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU169.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3764 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +28.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4841 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU17.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5198 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2964 =C2=B1 35%=C2=A0 interrupt=
s.CPU17.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5198 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2964 =C2=B1 35%=C2=A0 interrupt=
s.CPU17.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 729.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +52.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1109 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
17.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 450.67 =C2=B1 10%=C2=A0=C2=A0=C2=A0 +104.4%=C2=A0=C2=A0=
=C2=A0=C2=A0 921.25 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU17.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4099 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5118 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU170.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 590.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +91.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1130=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 interrupts.CPU170.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 552.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +75.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 971.75 =C2=B1 10%=C2=A0 interrupts.CPU170.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4023 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4808=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU171.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 594.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +82.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1085 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
171.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 468.33 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +94.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 908.75 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU171.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3917 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4895 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU172.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5248 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3915 =C2=B1 10%=C2=A0 interrupt=
s.CPU172.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5248 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3915 =C2=B1 10%=C2=A0 interrupt=
s.CPU172.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 543.00 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0 +103.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1105 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU172=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 468.67 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +94.0%=C2=A0=
=C2=A0=C2=A0=C2=A0 909.25 =C2=B1 17%=C2=A0 interrupts.CPU172.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4057 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4975 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU173.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5158 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3521 =C2=B1 31%=C2=A0 interrupt=
s.CPU173.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5158 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3521 =C2=B1 31%=C2=A0 interrupt=
s.CPU173.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 597.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +87.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1123 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
173.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 498.67 =C2=B1 19%=C2=A0=C2=A0=C2=A0 +133.2%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1163 =C2=B1 26%=C2=A0 interrupts.CPU173.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3833 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4859 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU174.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5208 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3920 =C2=B1 11%=C2=A0 interrupt=
s.CPU174.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5208 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3920 =C2=B1 11%=C2=A0 interrupt=
s.CPU174.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 570.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +91.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1090 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
174.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 470.00 =C2=B1 19%=C2=A0=C2=A0=C2=A0 +108.3%=C2=A0=C2=A0=
=C2=A0=C2=A0 979.00 =C2=B1 12%=C2=A0 interrupts.CPU174.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4117 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4845 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU175.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5202 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3896 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU175.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5202 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3896 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU175.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 638.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +70.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1090 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
175.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 463.00 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +104.4%=C2=A0=C2=A0=
=C2=A0=C2=A0 946.50 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU175.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4021 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4699 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU176.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 608.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +79.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1091 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
176.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 477.33 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +97.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 941.50 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU176.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4071 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +15.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4702=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU177.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 596.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +82.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1086=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 interrupts.CPU177.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 435.00 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +114.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 934.00 =C2=B1 14%=C2=A0 interrupts.CPU177.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4130 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4815 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU178.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 633.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +64.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1039 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
178.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 478.67 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +95.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 934.50 =C2=B1 19%=C2=A0 interrupts.CPU178.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3821 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4846 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU179.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 594.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +76.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1050 =C2=B1=C2=A0 4=
%=C2=A0 interrupts.CPU179.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 479.00 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +96.5%=C2=
=A0=C2=A0=C2=A0=C2=A0 941.00 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU179.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4196 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4890 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU18.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 728.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +51.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1100 =C2=B1=C2=A0 3=
%=C2=A0 interrupts.CPU18.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 506.00 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +71.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 868.75 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU18.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3950 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4870 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU180.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 606.33 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +72.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1045 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
180.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 498.00 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +72.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 858.00 =C2=B1 17%=C2=A0 interrupts.CPU180.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4113 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +18.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4864 =C2=B1=C2=A0 5%=C2=A0 interrupt=
s.CPU181.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 620.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +73.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1077 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
181.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 483.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +90.3%=C2=
=A0=C2=A0=C2=A0=C2=A0 919.75 =C2=B1 11%=C2=A0 interrupts.CPU181.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4070 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4761 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU182.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 588.00 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +82.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1075 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
182.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 480.00 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +124.7%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1078 =C2=B1 10%=C2=A0 interrupts.CPU182.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4198 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +15.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4868 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU183.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 681.33 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +59.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1087 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
183.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 509.33 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +78.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 909.00 =C2=B1 15%=C2=A0 interrupts.CPU183.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3955 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4970 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU184.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 565.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +93.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1095 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
184.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 443.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +107.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 918.25 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU184.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4105 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4781 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU185.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 546.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +105.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1125 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU185=
.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 505.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +86.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 943.50 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU185.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4067 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4878 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU186.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 604.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +71.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1035 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
186.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 486.67 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +89.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 923.25 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU186.TLB:TLB_s=
hootdowns
=C2=A0=C2=A0=C2=A0 588.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +77.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1046 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
187.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 499.67 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +86.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 930.50 =C2=B1 15%=C2=A0 interrupts.CPU187.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4186 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4901 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU188.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 616.33 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +77.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1091 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
188.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 461.33 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0 +102.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 932.25 =C2=B1 15%=C2=A0 interrupts.CPU188.TLB:TLB_shootd=
owns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3980 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4849 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU189.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 594.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +87.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1116 =C2=B1=C2=A0 3=
%=C2=A0 interrupts.CPU189.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 431.33 =C2=B1 10%=C2=A0=C2=A0=C2=A0 +126.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 974.75 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU189.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3937 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4772 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU19.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5173 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3525 =C2=B1 25%=C2=A0 interrupt=
s.CPU19.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5173 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3525 =C2=B1 25%=C2=A0 interrupt=
s.CPU19.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 722.67 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +48.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1070 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
19.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 479.67 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +95.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 937.00 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU19.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3905 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4890 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU190.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5230 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3937 =C2=B1 10%=C2=A0 interrupt=
s.CPU190.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5230 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3937 =C2=B1 10%=C2=A0 interrupt=
s.CPU190.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 580.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +84.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1071 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
190.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 454.33 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +111.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 961.75 =C2=B1 14%=C2=A0 interrupts.CPU190.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3985 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4918 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU191.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5184 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3422 =C2=B1 24%=C2=A0 interrupt=
s.CPU191.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5184 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3422 =C2=B1 24%=C2=A0 interrupt=
s.CPU191.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 589.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +91.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1129 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
191.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 498.67 =C2=B1 25%=C2=A0=C2=A0=C2=A0 +102.2%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1008 =C2=B1 14%=C2=A0 interrupts.CPU191.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3847 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +29.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4965 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU2.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5162 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3948 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU2.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5162 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3948 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU2.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 691.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +59.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1099 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
2.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 486.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +83.7%=C2=
=A0=C2=A0=C2=A0=C2=A0 894.25 =C2=B1 13%=C2=A0 interrupts.CPU2.TLB:TLB_shoot=
downs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4000 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4786 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU20.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5181 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2999 =C2=B1 32%=C2=A0 interrupt=
s.CPU20.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5181 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2999 =C2=B1 32%=C2=A0 interrupt=
s.CPU20.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 774.00 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +45.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1128 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU20.=
RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 458.33 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +111.7%=C2=A0=C2=A0=
=C2=A0=C2=A0 970.25 =C2=B1 12%=C2=A0 interrupts.CPU20.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4143 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +13.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4684 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU21.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 814.67 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 +35.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1100 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU21.=
RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 453.67 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +97.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 894.25 =C2=B1 13%=C2=A0 interrupts.CPU21.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3936=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +26.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4968 =C2=
=B1=C2=A0 4%=C2=A0 interrupts.CPU22.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5194 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4017 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU22.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5194 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4017 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU22.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 754.67 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +45.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1100 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU22.=
RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 467.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +100.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 935.25 =C2=B1 17%=C2=A0 interrupts.CPU22.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4046 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4758 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU23.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 716.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1043 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
23.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 416.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0 +108.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 867.50 =C2=B1 12%=C2=A0 interrupts.CPU23.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4323 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5066 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU24.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5170 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4027 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU24.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5170 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4027 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU24.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 876.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +33.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1166 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
24.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 678.33 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +50.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1020 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU24.=
TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4259 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5027 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU25.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5240 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3993 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU25.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5240 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3993 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU25.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 791.67 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +44.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1142 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
25.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 594.00 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 +62.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 964.75 =C2=B1 15%=C2=A0 interrupts.CPU25.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4234 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +20.=
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5111 =C2=B1=C2=A0 3%=C2=A0 interrupt=
s.CPU26.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 821.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +41.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1161 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
26.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 528.00 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +96.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1038 =C2=B1 18%=C2=A0 interrupts.CPU26.TL=
B:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4202 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5101 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU27.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5218 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4045 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU27.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5218 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4045 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU27.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 720.00 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +58.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1142 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
27.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 502.67 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +89.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 953.50 =C2=B1 12%=C2=A0 interrupts.CPU27.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4162 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +18.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4921 =C2=B1=C2=A0 5%=C2=A0 interrupt=
s.CPU28.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5157 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3951 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU28.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5157 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3951 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU28.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 755.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +47.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1113 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
28.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 497.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +91.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 953.50 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU28.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4088 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5072 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU29.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5188 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4021 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU29.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5188 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4021 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU29.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 719.33 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +57.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1129 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
29.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 464.33 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0 +131.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1073 =C2=B1 26%=C2=A0 interrupts.CPU29.TLB:T=
LB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3770=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +25.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4739 =C2=
=B1=C2=A0 5%=C2=A0 interrupts.CPU3.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 746.33 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +50.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1120 =C2=B1 11%=C2=A0 interrupts.CPU3.RES=
:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 511.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +74.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 892.75 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU3.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4203 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4998 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU30.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5183 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3055 =C2=B1 37%=C2=A0 interrupt=
s.CPU30.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5183 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -41.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3055 =C2=B1 37%=C2=A0 interrupt=
s.CPU30.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 749.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +52.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1146 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
30.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 469.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +108.5%=C2=A0=C2=A0=
=C2=A0=C2=A0 978.75 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU30.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4133 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4971 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU31.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5174 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3536 =C2=B1 26%=C2=A0 interrupt=
s.CPU31.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5174 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3536 =C2=B1 26%=C2=A0 interrupt=
s.CPU31.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 777.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +53.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1195 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
31.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 496.00 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +96.7%=C2=
=A0=C2=A0=C2=A0=C2=A0 975.75 =C2=B1 16%=C2=A0 interrupts.CPU31.TLB:TLB_shoo=
tdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4107 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4849 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU32.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5163 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -21.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4038 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU32.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5163 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -21.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4038 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU32.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 711.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +52.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1088 =C2=B1=C2=A0 5=
%=C2=A0 interrupts.CPU32.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 489.33 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +115.7%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1055 =C2=B1 11%=C2=A0 interrupts.CPU32.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4170 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4897 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU33.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5215 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3480 =C2=B1 25%=C2=A0 interrupt=
s.CPU33.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5215 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3480 =C2=B1 25%=C2=A0 interrupt=
s.CPU33.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 785.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +46.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1148 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
33.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 547.67 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +71.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 939.75 =C2=B1 11%=C2=A0 interrupts.CPU33.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4302 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +16.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4992 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU34.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5214 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4031 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU34.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5214 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4031 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU34.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 787.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +41.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1113 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
34.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 590.33 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +60.2%=C2=
=A0=C2=A0=C2=A0=C2=A0 945.50 =C2=B1 11%=C2=A0 interrupts.CPU34.TLB:TLB_shoo=
tdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4044 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +22.=
9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4969 =C2=B1=C2=A0 4%=C2=A0 interrupt=
s.CPU35.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5220 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3520 =C2=B1 25%=C2=A0 interrupt=
s.CPU35.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5220 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3520 =C2=B1 25%=C2=A0 interrupt=
s.CPU35.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 735.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +56.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1154 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU=
35.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 485.00 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +101.3%=C2=A0=C2=A0=
=C2=A0=C2=A0 976.50 =C2=B1 11%=C2=A0 interrupts.CPU35.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4291 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +14.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4930 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU36.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 782.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +51.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1182 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
36.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 491.00 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +84.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 904.75 =C2=B1 16%=C2=A0 interrupts.CPU36.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3949 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4898 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU37.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 723.67 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +54.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1114 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
37.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 490.00 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0 +111.4%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1036 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU37.=
TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5218 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4000 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU38.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5218 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4000 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU38.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 797.67 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +40.3%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1119 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU38.=
RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 500.33 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +89.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 948.50 =C2=B1 12%=C2=A0 interrupts.CPU38.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3987 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5023 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU39.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 772.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +47.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1134 =C2=B1=C2=A0 6=
%=C2=A0 interrupts.CPU39.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 483.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0 +102.2%=C2=A0=C2=A0=
=C2=A0=C2=A0 976.75 =C2=B1 17%=C2=A0 interrupts.CPU39.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3933 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +38.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5428 =C2=B1 14%=C2=A0 interrupt=
s.CPU4.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5183 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2939 =C2=B1 31%=C2=A0 interrupt=
s.CPU4.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5183 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -43.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2939 =C2=B1 31%=C2=A0 interrupt=
s.CPU4.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 799.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +35.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1083 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
4.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 489.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +100.9%=C2=A0=C2=A0=
=C2=A0=C2=A0 983.50 =C2=B1 11%=C2=A0 interrupts.CPU4.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4034 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4991=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU40.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5212 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3963 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU40.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5212 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3963 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU40.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 745.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +53.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1145 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
40.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 407.67 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +140.6%=C2=A0=C2=A0=
=C2=A0=C2=A0 981.00 =C2=B1 13%=C2=A0 interrupts.CPU40.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4029 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5040 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU41.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5237 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3980 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU41.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5237 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3980 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU41.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 764.00 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +49.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1143 =C2=B1 10%=C2=A0 interrupts.CPU41.RES:R=
escheduling_interrupts
=C2=A0=C2=A0=C2=A0 480.33 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +102.8%=C2=A0=C2=A0=
=C2=A0=C2=A0 974.00 =C2=B1 14%=C2=A0 interrupts.CPU41.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4158 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4950 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU42.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5205 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3963 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU42.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5205 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3963 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU42.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 777.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +48.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1150 =C2=B1=C2=A0 7=
%=C2=A0 interrupts.CPU42.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 494.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +85.4%=C2=
=A0=C2=A0=C2=A0=C2=A0 917.25 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU42.TLB:TLB=
_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4145 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4974 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU43.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5199 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3971 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU43.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5199 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3971 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU43.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 734.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +54.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1136 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
43.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 479.33 =C2=B1 21%=C2=A0=C2=A0=C2=A0 +116.7%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1038 =C2=B1 12%=C2=A0 interrupts.CPU43.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4038 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4867 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU44.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5236 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3438 =C2=B1 24%=C2=A0 interrupt=
s.CPU44.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5236 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3438 =C2=B1 24%=C2=A0 interrupt=
s.CPU44.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 721.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +57.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1135 =C2=B1=C2=A0 6=
%=C2=A0 interrupts.CPU44.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 486.67 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 +94.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 948.50 =C2=B1 11%=C2=A0 interrupts.CPU44.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4089 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4895 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU45.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 744.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +45.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1083 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
45.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 450.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +114.5%=C2=A0=C2=A0=
=C2=A0=C2=A0 966.00 =C2=B1 19%=C2=A0 interrupts.CPU45.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3816 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +30.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4991 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU46.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5219 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3502 =C2=B1 23%=C2=A0 interrupt=
s.CPU46.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5219 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3502 =C2=B1 23%=C2=A0 interrupt=
s.CPU46.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 740.33 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +61.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1197 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
46.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 455.00 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0 +107.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 944.75 =C2=B1 15%=C2=A0 interrupts.CPU46.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3989 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4947 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU47.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5204 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3506 =C2=B1 24%=C2=A0 interrupt=
s.CPU47.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5204 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3506 =C2=B1 24%=C2=A0 interrupt=
s.CPU47.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 741.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +53.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1135 =C2=B1 12%=C2=A0 interrupts.CPU47.RE=
S:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 437.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +120.8%=C2=A0=C2=A0=
=C2=A0=C2=A0 965.75 =C2=B1 16%=C2=A0 interrupts.CPU47.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4165 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5095 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU48.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5176 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -21.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4053 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU48.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5176 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -21.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4053 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU48.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 835.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +29.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1077 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
48.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 594.67 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 +62.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 964.50 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU48.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4171 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4950 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU49.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5186 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3452 =C2=B1 24%=C2=A0 interrupt=
s.CPU49.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5186 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3452 =C2=B1 24%=C2=A0 interrupt=
s.CPU49.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 710.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +55.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1105 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
49.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 553.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +74.0%=C2=
=A0=C2=A0=C2=A0=C2=A0 963.25 =C2=B1 10%=C2=A0 interrupts.CPU49.TLB:TLB_shoo=
tdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4064 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4944 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU5.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 772.33 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +45.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1125 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
5.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 491.00 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +95.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 958.50 =C2=B1 10%=C2=A0 interrupts.CPU5.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3929 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4966 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU50.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5201 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4011 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU50.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5201 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4011 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU50.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 747.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +40.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1050 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
50.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 482.33 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +103.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 979.75 =C2=B1 12%=C2=A0 interrupts.CPU50.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4192 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5043 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU51.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5249 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3987 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU51.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5249 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3987 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU51.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 780.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +54.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1209 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU=
51.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 504.00 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +95.9%=C2=A0=
=C2=A0=C2=A0=C2=A0 987.50 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU51.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4084 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4972 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU52.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5208 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4006 =C2=B1 11%=C2=A0 interrupt=
s.CPU52.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5208 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4006 =C2=B1 11%=C2=A0 interrupt=
s.CPU52.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 724.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +48.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1076 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
52.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 536.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +91.7%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1027 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU52.=
TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5184 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3933 =C2=B1 10%=C2=A0 interrupt=
s.CPU53.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5184 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3933 =C2=B1 10%=C2=A0 interrupt=
s.CPU53.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 722.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +49.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1077 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
53.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 447.33 =C2=B1 20%=C2=A0=C2=A0=C2=A0 +118.6%=C2=A0=C2=A0=
=C2=A0=C2=A0 978.00 =C2=B1 11%=C2=A0 interrupts.CPU53.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4057 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5073 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU54.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5172 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3487 =C2=B1 24%=C2=A0 interrupt=
s.CPU54.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5172 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3487 =C2=B1 24%=C2=A0 interrupt=
s.CPU54.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 722.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +50.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1088 =C2=B1=C2=A0 7=
%=C2=A0 interrupts.CPU54.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 491.33 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +382.4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2370 =C2=B1102%=C2=A0 interrupts.CPU54.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4092 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4825=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU55.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 755.67 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +49.2%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1127 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU55.=
RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 445.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +117.2%=C2=A0=C2=A0=C2=A0=C2=A0 968.00 =C2=B1 11%=C2=A0 interrupts.C=
PU55.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4116 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4940 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU56.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5144 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3427 =C2=B1 23%=C2=A0 interrupt=
s.CPU56.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5144 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3427 =C2=B1 23%=C2=A0 interrupt=
s.CPU56.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 707.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +55.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1100=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts.CPU56.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 448.00 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +120.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 986.00 =C2=B1 13%=C2=A0 interrupts.CPU56.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3861=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +26.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4871 =C2=
=B1=C2=A0 3%=C2=A0 interrupts.CPU57.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5187 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3474 =C2=B1 25%=C2=A0 interrupt=
s.CPU57.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5187 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3474 =C2=B1 25%=C2=A0 interrupt=
s.CPU57.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 703.00 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +55.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1094 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
57.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 495.67 =C2=B1 19%=C2=A0=C2=A0=C2=A0 +106.5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1023 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU57.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4003 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5016 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU58.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5267=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -32.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3543 =C2=
=B1 30%=C2=A0 interrupts.CPU58.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5267=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -32.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3543 =C2=
=B1 30%=C2=A0 interrupts.CPU58.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 692.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +61.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1114=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts.CPU58.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 467.67 =C2=B1 16%=C2=A0=C2=A0=C2=A0 +109.8%=C2=A0=C2=A0=
=C2=A0=C2=A0 981.25 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU58.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4147 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5024 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU59.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5175 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3419 =C2=B1 24%=C2=A0 interrupt=
s.CPU59.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5175 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3419 =C2=B1 24%=C2=A0 interrupt=
s.CPU59.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 765.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +40.8%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1077 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
59.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 477.67 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 +97.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 944.25 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU59.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4121 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4932 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU6.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5158 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3518 =C2=B1 25%=C2=A0 interrupt=
s.CPU6.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5158 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3518 =C2=B1 25%=C2=A0 interrupt=
s.CPU6.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 735.33 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +48.5%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1091 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU6.R=
ES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 535.33 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +72.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 923.25 =C2=B1 14%=C2=A0 interrupts.CPU6.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4122 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +32.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5471 =C2=B1 18%=C2=A0 interrupt=
s.CPU60.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 746.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +48.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1110 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
60.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 496.00 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0 +92.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 953.25 =C2=B1 13%=C2=A0 interrupts.CPU60.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4022 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +33.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5376 =C2=B1 14%=C2=A0 interrupt=
s.CPU61.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5190 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3378 =C2=B1 24%=C2=A0 interrupt=
s.CPU61.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5190 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3378 =C2=B1 24%=C2=A0 interrupt=
s.CPU61.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 734.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +48.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1088 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
61.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 484.67 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +109.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1013 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU61.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3917 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4953 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU62.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5189 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3489 =C2=B1 25%=C2=A0 interrupt=
s.CPU62.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5189 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3489 =C2=B1 25%=C2=A0 interrupt=
s.CPU62.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 778.00 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +42.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1109 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
62.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 486.33 =C2=B1 23%=C2=A0=C2=A0=C2=A0 +110.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1021 =C2=B1 17%=C2=A0 interrupts.CPU62.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4163 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5029=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU63.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5231 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3419 =C2=B1 24%=C2=A0 interrupt=
s.CPU63.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5231 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3419 =C2=B1 24%=C2=A0 interrupt=
s.CPU63.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 775.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +39.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1082=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 interrupts.CPU63.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 491.00 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0 +95.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 961.25 =C2=B1 16%=C2=A0 interrupts.CPU63.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4016 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4990 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU64.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5129 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2973 =C2=B1 36%=C2=A0 interrupt=
s.CPU64.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5129 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2973 =C2=B1 36%=C2=A0 interrupt=
s.CPU64.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 757.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +47.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1119 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
64.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 453.67 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +119.8%=C2=A0=C2=A0=
=C2=A0=C2=A0 997.00 =C2=B1 11%=C2=A0 interrupts.CPU64.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3854 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4868 =C2=B1=C2=A0 7%=C2=A0 inte=
rrupts.CPU65.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 767.33 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +37.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1056 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
65.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 519.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +85.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 962.75 =C2=B1 13%=C2=A0 interrupts.CPU65.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3915 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4888 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU66.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5199 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3409 =C2=B1 25%=C2=A0 interrupt=
s.CPU66.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5199 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3409 =C2=B1 25%=C2=A0 interrupt=
s.CPU66.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 712.67 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +56.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1118 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
66.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 431.67 =C2=B1 30%=C2=A0=C2=A0=C2=A0 +138.8%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1030 =C2=B1 14%=C2=A0 interrupts.CPU66.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4026 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4870 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU67.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5157 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3950 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU67.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5157 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3950 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU67.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 671.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +56.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1053 =C2=B1=C2=A0 2=
%=C2=A0 interrupts.CPU67.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 489.67 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +99.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 977.50 =C2=B1 12%=C2=A0 interrupts.CPU67.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4034 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4921 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU68.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5175 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3561 =C2=B1 30%=C2=A0 interrupt=
s.CPU68.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5175 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -31.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3561 =C2=B1 30%=C2=A0 interrupt=
s.CPU68.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 709.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +56.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1107 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
68.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 493.00 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0 +95.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 965.25 =C2=B1 12%=C2=A0 interrupts.CPU68.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4014 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +24.=
6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5001 =C2=B1=C2=A0 2%=C2=A0 interrupt=
s.CPU69.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5152 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3476 =C2=B1 25%=C2=A0 interrupt=
s.CPU69.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5152 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3476 =C2=B1 25%=C2=A0 interrupt=
s.CPU69.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 717.33 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +50.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1078 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
69.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 434.67 =C2=B1 26%=C2=A0=C2=A0=C2=A0 +123.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 969.25 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU69.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3972 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4892=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU7.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 776.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +40.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1091 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
7.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 467.33 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +102.8%=C2=A0=C2=A0=
=C2=A0=C2=A0 947.75 =C2=B1 16%=C2=A0 interrupts.CPU7.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4068 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +26.=
2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5134=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 interrupts.CPU70.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5188 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2975 =C2=B1 37%=C2=A0 interrupt=
s.CPU70.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5188 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2975 =C2=B1 37%=C2=A0 interrupt=
s.CPU70.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 718.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +54.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1107 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
70.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 494.00 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +104.5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1010 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU70.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3920 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +29.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5078 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU71.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5112 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3920 =C2=B1 11%=C2=A0 interrupt=
s.CPU71.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5112 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3920 =C2=B1 11%=C2=A0 interrupt=
s.CPU71.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 667.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +64.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1101 =C2=B1=C2=A0 5=
%=C2=A0 interrupts.CPU71.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 473.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +103.8%=C2=A0=C2=A0=
=C2=A0=C2=A0 963.75 =C2=B1 13%=C2=A0 interrupts.CPU71.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3913 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4963 =C2=B1=C2=A0 2%=C2=A0 inte=
rrupts.CPU72.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5206 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3932 =C2=B1 10%=C2=A0 interrupt=
s.CPU72.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5206 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3932 =C2=B1 10%=C2=A0 interrupt=
s.CPU72.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 811.67 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +33.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1081 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
72.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3939 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4962 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU73.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5184 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3408 =C2=B1 25%=C2=A0 interrupt=
s.CPU73.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5184 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3408 =C2=B1 25%=C2=A0 interrupt=
s.CPU73.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 763.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +40.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1072 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
73.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 570.00 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +97.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1123 =C2=B1 25%=C2=A0 interrupts.CPU73.TL=
B:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4069 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4954 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU74.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5223 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3972 =C2=B1 10%=C2=A0 interrupt=
s.CPU74.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5223 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -23.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3972 =C2=B1 10%=C2=A0 interrupt=
s.CPU74.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 715.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +53.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1101 =C2=B1=C2=A0 5=
%=C2=A0 interrupts.CPU74.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 526.00 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +90.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1004 =C2=B1 11%=C2=A0 interrupts.CPU74.TLB:T=
LB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4034 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +21.=
5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4900 =C2=B1=C2=A0 4%=C2=A0 interrupt=
s.CPU75.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5241 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2995 =C2=B1 37%=C2=A0 interrupt=
s.CPU75.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5241 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2995 =C2=B1 37%=C2=A0 interrupt=
s.CPU75.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 712.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +49.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1065 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
75.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4203 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4995 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU76.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5216 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3525 =C2=B1 31%=C2=A0 interrupt=
s.CPU76.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5216 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 -32.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3525 =C2=B1 31%=C2=A0 interrupt=
s.CPU76.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 719.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +44.5%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1039 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
76.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 488.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +87.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 913.25 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU76.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3955 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4901 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU77.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5224 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3944 =C2=B1 11%=C2=A0 interrupt=
s.CPU77.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5224 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3944 =C2=B1 11%=C2=A0 interrupt=
s.CPU77.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 703.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +50.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1062 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
77.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 466.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0 +125.8%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1053 =C2=B1 13%=C2=A0 interrupts.CPU77.TLB:T=
LB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4189 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +15.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4852 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU78.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5190 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3455 =C2=B1 24%=C2=A0 interrupt=
s.CPU78.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5190 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3455 =C2=B1 24%=C2=A0 interrupt=
s.CPU78.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 706.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +49.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1055 =C2=B1=C2=A0 4=
%=C2=A0 interrupts.CPU78.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 442.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +135.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1044 =C2=B1 15%=C2=A0 interrupts.CPU78.TLB:T=
LB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3902 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +24.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4865 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU79.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5225 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3390 =C2=B1 24%=C2=A0 interrupt=
s.CPU79.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5225 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3390 =C2=B1 24%=C2=A0 interrupt=
s.CPU79.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 704.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +58.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1115 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
79.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 444.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +111.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 937.25 =C2=B1 11%=C2=A0 interrupts.CPU79.TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4089 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4898=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU8.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5181 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4024 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU8.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5181 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -22.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4024 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU8.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 785.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +41.3%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1110 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
8.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 480.00 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 +94.0%=C2=
=A0=C2=A0=C2=A0=C2=A0 931.00 =C2=B1 17%=C2=A0 interrupts.CPU8.TLB:TLB_shoot=
downs
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4093 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5018 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU80.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 721.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +44.9%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1045 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
80.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 485.33 =C2=B1 10%=C2=A0=C2=A0=C2=A0 +101.9%=C2=A0=C2=A0=
=C2=A0=C2=A0 980.00 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU80.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4059 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4843 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU81.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5243 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3894 =C2=B1 10%=C2=A0 interrupt=
s.CPU81.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5243 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3894 =C2=B1 10%=C2=A0 interrupt=
s.CPU81.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 689.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +53.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1055 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU=
81.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 553.67 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +87.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1040 =C2=B1 13%=C2=A0 interrupts.CPU81.TLB:T=
LB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3950 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4863 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU82.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5207 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3447 =C2=B1 25%=C2=A0 interrupt=
s.CPU82.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5207 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3447 =C2=B1 25%=C2=A0 interrupt=
s.CPU82.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 723.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +45.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1048 =C2=B1=C2=A0 2=
%=C2=A0 interrupts.CPU82.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 424.67 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +143.4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1033 =C2=B1 11%=C2=A0 interrupts.CPU82.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4227 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5085 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU83.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5224 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2998 =C2=B1 38%=C2=A0 interrupt=
s.CPU83.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5224 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2998 =C2=B1 38%=C2=A0 interrupt=
s.CPU83.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 690.00 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +57.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1084 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
83.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 437.33 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0 +170.6%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1183 =C2=B1 19%=C2=A0 interrupts.CPU83.TLB:T=
LB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4122 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +19.=
3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4918 =C2=B1=C2=A0 3%=C2=A0 interrupt=
s.CPU84.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5236 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -44.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2906 =C2=B1 29%=C2=A0 interrupt=
s.CPU84.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5236 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -44.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2906 =C2=B1 29%=C2=A0 interrupt=
s.CPU84.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 714.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +49.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1066 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
84.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 460.00 =C2=B1 17%=C2=A0=C2=A0=C2=A0 +124.9%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1034 =C2=B1 11%=C2=A0 interrupts.CPU84.TLB:TLB_sho=
otdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4072 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +19.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4864 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU85.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5256 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3967 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU85.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5256 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -24.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3967 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU85.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 696.67 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +53.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1067 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
85.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 445.67 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +112.0%=C2=A0=C2=A0=
=C2=A0=C2=A0 945.00 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU85.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4091 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4964 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU86.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 699.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +56.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1093 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
86.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 466.00 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +126.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1053 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU86.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4003 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5015 =C2=B1=C2=A0 4%=C2=A0 inte=
rrupts.CPU87.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 687.00 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +54.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1058 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
87.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 474.33 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +116.1%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1025 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU87.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4087 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4982 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU88.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 695.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +48.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1033 =C2=B1=C2=A0 2=
%=C2=A0 interrupts.CPU88.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 482.00 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +114.2%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1032 =C2=B1=C2=A0 7%=C2=A0 interrupts.CPU88.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3940 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0=
 +25.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4944 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU89.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5209 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3895 =C2=B1 10%=C2=A0 interrupt=
s.CPU89.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5209 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3895 =C2=B1 10%=C2=A0 interrupt=
s.CPU89.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 695.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +51.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1054 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
89.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 434.00 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +131.6%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1005 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU89.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3991 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +18.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4728 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU9.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5149 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3418 =C2=B1 25%=C2=A0 interrupt=
s.CPU9.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5149 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -33.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3418 =C2=B1 25%=C2=A0 interrupt=
s.CPU9.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 704.67 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 +56.2%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1100 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
9.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 433.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +107.6%=C2=A0=
=C2=A0=C2=A0=C2=A0 900.25 =C2=B1 12%=C2=A0 interrupts.CPU9.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4145 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4868 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU90.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5217 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2977 =C2=B1 40%=C2=A0 interrupt=
s.CPU90.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5217 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -42.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2977 =C2=B1 40%=C2=A0 interrupt=
s.CPU90.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 672.33 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +61.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1085 =C2=B1=C2=A0 2%=C2=A0 interrupts.CPU=
90.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 491.33 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +90.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 934.00 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU90.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4304 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=
 +17.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5051 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU91.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 799.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +34.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1076 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU=
91.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 458.33 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +112.6%=C2=A0=C2=A0=
=C2=A0=C2=A0 974.50 =C2=B1=C2=A0 3%=C2=A0 interrupts.CPU91.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3978 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 +21.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4816 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU92.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5190 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -54.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2371 =C2=B1 21%=C2=A0 interrupt=
s.CPU92.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5190 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -54.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2371 =C2=B1 21%=C2=A0 interrupt=
s.CPU92.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 648.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +66.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1079 =C2=B1=C2=A0 4=
%=C2=A0 interrupts.CPU92.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 470.67 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +99.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 940.00 =C2=B1 17%=C2=A0 interrupts.CPU92.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3937 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4863 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU93.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5221 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3365 =C2=B1 23%=C2=A0 interrupt=
s.CPU93.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5221 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 -35.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3365 =C2=B1 23%=C2=A0 interrupt=
s.CPU93.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 677.67 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 +53.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1041 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
93.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 481.00 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0 +123.9%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1077 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU93.=
TLB:TLB_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4005 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 +22.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4919 =C2=B1=C2=A0 6%=C2=A0 inte=
rrupts.CPU94.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 648.00 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +61.7%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1047 =C2=B1=C2=A0 6%=C2=A0 interrupts.CPU=
94.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 469.67 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0 +103.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 954.25 =C2=B1 17%=C2=A0 interrupts.CPU94.TLB:TLB_shootdo=
wns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4039 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +26.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5088 =C2=B1=C2=A0 5%=C2=A0 inte=
rrupts.CPU95.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 664.00 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +65.4%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1098 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU=
95.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 458.00 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +119.0%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1003 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU95.TLB:TL=
B_shootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3941 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=
 +20.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4750 =C2=B1=C2=A0 3%=C2=A0 inte=
rrupts.CPU96.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5213 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -26.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3824 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU96.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5213 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -26.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3824 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU96.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 707.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 +69.0%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1196 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
96.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 453.00 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +111.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 956.75 =C2=B1=C2=A0 9%=C2=A0 interrupts.CPU96.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3892 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +29.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5041 =C2=B1=C2=A0 8%=C2=A0 inte=
rrupts.CPU97.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5166 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3867 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU97.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5166 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=
 -25.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3867 =C2=B1=C2=A0 9%=C2=A0 inte=
rrupts.CPU97.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 755.67 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +55.6%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1175 =C2=B1=C2=A0 5%=C2=A0 interrupts.CPU=
97.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 487.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +86.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 906.25 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU97.TLB:TLB_sh=
ootdowns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3869 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=
 +23.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4782=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 interrupts.CPU98.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5178 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3369 =C2=B1 24%=C2=A0 interrupt=
s.CPU98.NMI:Non-maskable_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5178 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=
 -34.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3369 =C2=B1 24%=C2=A0 interrupt=
s.CPU98.PMI:Performance_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 687.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 +68.1%=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1155 =C2=B1=C2=A0 4%=C2=A0 interrupts.CPU=
98.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 389.00 =C2=B1 13%=C2=A0=C2=A0=C2=A0 +121.1%=C2=A0=C2=A0=
=C2=A0=C2=A0 860.25 =C2=B1=C2=A0 8%=C2=A0 interrupts.CPU98.TLB:TLB_shootdow=
ns
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +21.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4876 =C2=
=B1=C2=A0 6%=C2=A0 interrupts.CPU99.CAL:Function_call_interrupts
=C2=A0=C2=A0=C2=A0 719.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +67.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1202 =C2=B1=C2=A0 2=
%=C2=A0 interrupts.CPU99.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0 463.00 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +76.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 815.50 =C2=B1 10%=C2=A0 interrupts.CPU99.TLB:TLB_shoo=
tdowns
=C2=A0=C2=A0=C2=A0 913220 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -24.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 693121 =C2=B1=C2=A0 9%=C2=A0 interrupts.NMI:Non-maska=
ble_interrupts
=C2=A0=C2=A0=C2=A0 913220 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -24.1%=C2=
=A0=C2=A0=C2=A0=C2=A0 693121 =C2=B1=C2=A0 9%=C2=A0 interrupts.PMI:Performan=
ce_monitoring_interrupts
=C2=A0=C2=A0=C2=A0 132379=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +62.4%=C2=A0=C2=A0=C2=A0=C2=A0 215045=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 interrupts.RES:Rescheduling_interrupts
=C2=A0=C2=A0=C2=A0=C2=A0 94465 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +95.5%=C2=
=A0=C2=A0=C2=A0=C2=A0 184704 =C2=B1=C2=A0 9%=C2=A0 interrupts.TLB:TLB_shoot=
downs





Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Oliver Sang

--===============6983204939555064450==--

