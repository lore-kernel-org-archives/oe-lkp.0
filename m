Content-Type: multipart/mixed; boundary="===============4995738092868069600=="
MIME-Version: 1.0
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: lkp@lists.01.org
Subject: Re: [sched] c3a340f7e7: invalid_opcode:#[##]
Date: Tue, 30 Jun 2020 15:55:05 +0200
Message-ID: <5b7286c9-ef4f-c1d0-fae3-ebb198aa0742@rasmusvillemoes.dk>
In-Reply-To: <20200630124628.GV4817@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4995738092868069600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 30/06/2020 14.46, Peter Zijlstra wrote:
> On Mon, Jun 29, 2020 at 08:31:27AM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-4.9):
>>
>> commit: c3a340f7e7eadac7662ab104ceb16432e5a4c6b2 ("sched: Have sched_cla=
ss_highest define by vmlinux.lds.h")
> =

>> [    1.840970] kernel BUG at kernel/sched/core.c:6652!
> =

> W T H
> =

> $ readelf -Wa defconfig-build/vmlinux | grep sched_class
> 62931: c1e62d20     0 NOTYPE  GLOBAL DEFAULT    2 __begin_sched_classes
> 65736: c1e62f40    96 OBJECT  GLOBAL DEFAULT    2 stop_sched_class
> 71813: c1e62dc0    96 OBJECT  GLOBAL DEFAULT    2 fair_sched_class
> 78689: c1e62d40    96 OBJECT  GLOBAL DEFAULT    2 idle_sched_class
> 78953: c1e62fa0     0 NOTYPE  GLOBAL DEFAULT    2 __end_sched_classes
> 79090: c1e62e40    96 OBJECT  GLOBAL DEFAULT    2 rt_sched_class
> 79431: c1e62ec0    96 OBJECT  GLOBAL DEFAULT    2 dl_sched_class
> =

> $ printf "%d\n" $((0xc1e62dc0 - 0xc1e62d40))
> 128
> =

> So even though the object is 96 bytes in size, has an explicit 32 byte
> alignment, the array ends up with a stride of 128 bytes !?!?!
> =

> Consistently so with GCC-4.9. Any other GCC I tried does the sane thing.

Does that include gcc 4.8, or is it only "anything newer than 4.9"?

>
> Full patch included below.
> =

> Anybody any clue wth 4.9 is doing crazy things like this?

Perhaps
https://gcc.gnu.org/onlinedocs/gcc-4.9.4/gcc/Variable-Attributes.html#Varia=
ble-Attributes:

  When used on a struct, or struct member, the aligned attribute can
only increase the alignment; in order to decrease it, the packed
attribute must be specified as well. When used as part of a typedef, the
aligned attribute can both increase and decrease alignment, and
specifying the packed attribute generates a warning.

is part of the explanation. But this is seriously weird. I don't know
which .config you or the buildbot used, but I took an i386_defconfig
with SMP=3Dn to get a small enough struct sched_class (and disable
retpoline stuff), added

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 81640fe0eae8..53c0d3ba62ba 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -71,6 +71,13 @@ unsigned int sysctl_sched_rt_period =3D 1000000;

 __read_mostly int scheduler_running;

+void foo(void)
+{
+       extern void bar(int);
+       bar(sizeof(struct sched_class));
+       bar(_Alignof(struct sched_class));
+}
+
 /*
  * part of the period that we allow rt tasks to run in us.
  * default: 0.95s

and apparently _Alignof is only 16:

 00002c90 <foo>:
    2c90:       55                      push   %ebp
    2c91:       b8 60 00 00 00          mov    $0x60,%eax
    2c96:       89 e5                   mov    %esp,%ebp
    2c98:       e8 fc ff ff ff          call   2c99 <foo+0x9>
                        2c99: R_386_PC32        bar
    2c9d:       b8 10 00 00 00          mov    $0x10,%eax
    2ca2:       e8 fc ff ff ff          call   2ca3 <foo+0x13>
                        2ca3: R_386_PC32        bar

Neverthess, readelf -S --wide kernel/sched/fair.o:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg
Lk Inf Al

  [35] __fair_sched_class PROGBITS        00000000 002980 000060 00   A
0   0 64

so the section it was put in has an alignment of 64. The generated
assembly is indeed

        .globl  fair_sched_class
        .section        __fair_sched_class,"a",@progbits
        .align 64

/me goes brew coffee
--===============4995738092868069600==--

