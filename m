Content-Type: multipart/mixed; boundary="===============5274537031176797607=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Tue, 26 Jan 2021 13:52:17 +0900
Message-ID: <YA+gAV1kW8Ru1+Bo@jagdpanzerIV.localdomain>
In-Reply-To: <YAr7d6A4CkMpgx+g@alley>
List-Id: <oe-lkp.lists.linux.dev>

--===============5274537031176797607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (21/01/22 17:21), Petr Mladek wrote:
[..]
> > [  952.271861] ? firmware_map_remove (kbuild/src/consumer/kernel/sched/=
core.c:4411) =

> > [  952.272870] ? ksys_write (kbuild/src/consumer/fs/read_write.c:661) =

> > [  952.273709] schedule (kbuild/src/consumer/include/linux/thread_info.=
h:84 (discriminator 1) kbuild/src/consumer/include/linux/sched.h:1897 (disc=
riminator 1) kbuild/src/consumer/kernel/sched/core.c:4608 (discriminator 1)=
) =

> > [  952.274495] exit_to_user_mode_prepare (kbuild/src/consumer/kernel/en=
try/common.c:160 kbuild/src/consumer/kernel/entry/common.c:191) =

> > [  952.275516] syscall_exit_to_user_mode (kbuild/src/consumer/arch/x86/=
include/asm/jump_label.h:41 kbuild/src/consumer/arch/x86/include/asm/nospec=
-branch.h:288 kbuild/src/consumer/arch/x86/include/asm/entry-common.h:80 kb=
uild/src/consumer/kernel/entry/common.c:133 kbuild/src/consumer/kernel/entr=
y/common.c:268) =

> =

> > [  952.276650] entry_INT80_compat (kbuild/src/consumer/arch/x86/entry/e=
ntry_64_compat.S:412) =

> > [  952.277673] RIP: 0023:0xf7f93a02
> > [  952.278497] RSP: 002b:00000000ff8db2f4 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000004
> > [  952.280235] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 0000000=
05666f220
> > [  952.281813] RDX: 0000000000000001 RSI: 00000000f7f59d60 RDI: 0000000=
000000001
> > [  952.283347] RBP: 000000005666f220 R08: 0000000000000000 R09: 0000000=
000000000
> > [  952.284919] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000=
000000000
> > [  952.286507] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000=
000000000
> > [  952.294673] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.328047] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.336658]
> > [  352.572231]
> > [   98.585525] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.336693]
> > [  952.359450]
> > [  352.594642] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.359483]
> > [  952.377678] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.409955] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.412504]
> > [  352.610470]
> > [   98.605699] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.412531]
> > [  952.444293]
> > [  352.625170] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.444328]
> > [  952.453669] tasks-torture:torture_onoff task: online 0 failed: errno=
 -5
> > [  952.480340]
> > [  352.638172]
> > =

> > To reproduce:
> > =

> >         # build kernel
> > 	cd linux
> > 	cp config-5.10.0-rc5-gb031a684bfd0 .config
> > 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare modu=
les_prepare bzImage
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> =

> I am still struggling with lkp-tests. I have never used them before
> and have troubles to get it working. It asks for a newer qemu at
> the moment. It means that I am still not able to reproduce it :-/
> =

> I wonder if there is a way to reproduce this without lpk-tests
> framework.

AFAIU this is just 'modprobe rcutorture'

	-ss
--===============5274537031176797607==--

