Content-Type: multipart/mixed; boundary="===============4291960993853515032=="
MIME-Version: 1.0
From: Richard Guy Briggs <rgb@redhat.com>
To: lkp@lists.01.org
Subject: Re: [audit] dffb589851: BUG:unable_to_handle_kernel
Date: Fri, 15 Feb 2019 10:00:52 -0500
Message-ID: <20190215150052.ttzkyom7h27ikaoz@madcap2.tricolour.ca>
In-Reply-To: <20190214220938.o67ydq7aftoopjxv@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4291960993853515032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2019-02-15 06:09, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-8):
> =

> commit: dffb5898515333cbafb2ccdfcdc5942c1f151c6b ("audit: collect audit t=
ask parameters")
> git://toccata2.tricolour.ca/linux-2.6-rgb.git ghak90-audit-containerID.v5=
.6
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
--------+------------+------------+
> |                                                                        =
        | cd108b5c51 | dffb589851 |
> +------------------------------------------------------------------------=
--------+------------+------------+
> | boot_successes                                                         =
        | 16         | 0          |
> | boot_failures                                                          =
        | 16         | 4          |
> | End_of_test:RCU_HOTPLUG                                                =
        | 9          |            |
> | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print.cold.#[rcut=
orture] | 7          |            |
> | RIP:rcu_torture_stats_print.cold.#[rcutorture]                         =
        | 7          |            |
> | End_of_test:FAILURE                                                    =
        | 7          |            |
> | BUG:unable_to_handle_kernel                                            =
        | 0          | 4          |
> | Oops:#[##]                                                             =
        | 0          | 4          |
> | RIP:audit_free_syscall                                                 =
        | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception                               =
        | 0          | 4          |
> | RIP:getname_kernel                                                     =
        | 0          | 1          |
> +------------------------------------------------------------------------=
--------+------------+------------+
> =

> =

> =

> [   10.298417] BUG: unable to handle kernel NULL pointer dereference at 0=
00000000000034b
> [   10.299381] #PF error: [normal kernel read fault]
> [   10.299381] PGD 0 P4D 0 =

> [   10.299381] Oops: 0000 [#1] SMP PTI
> [   10.299381] CPU: 1 PID: 41 Comm: cryptomgr_test Not tainted 5.0.0-rc1-=
00013-gdffb589 #1
> [   10.299381] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   10.299381] RIP: 0010:audit_free_syscall+0x23/0x240
> [   10.299381] Code: c8 f3 ff 0f 1f 40 00 66 66 66 66 90 41 57 41 56 41 5=
5 41 54 55 53 48 8b 87 48 0b 00 00 48 8b 58 08 48 85 db 0f 84 04 02 00 00 <=
48> 8b 83 48 03 00 00 48 8d 93 48 03 00 00 48 89 fd 48 39 c2 74 08
> [   10.299381] RSP: 0000:ffffc90000f8be38 EFLAGS: 00010206
> [   10.299381] RAX: ffff88822a1b9630 RBX: 0000000000000003 RCX: 000000000=
0000000
> [   10.299381] RDX: ffffc90000f8be48 RSI: ffffc90000f8be40 RDI: ffff88822=
900a500
> [   10.299381] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff8=
143bb01
> [   10.299381] R10: ffff888229dab600 R11: 0000000000000001 R12: ffff88822=
900b001
> [   10.299381] R13: ffff88822900a500 R14: ffff888229dab600 R15: ffffffff8=
143bbe0
> [   10.299381] FS:  0000000000000000(0000) GS:ffff88823fd00000(0000) knlG=
S:0000000000000000
> [   10.299381] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.299381] CR2: 000000000000034b CR3: 000000000260e000 CR4: 000000000=
00006e0
> [   10.299381] Call Trace:
> [   10.299381]  ? crypto_acomp_scomp_free_ctx+0x30/0x30
> [   10.299381]  audit_free+0xe/0x30
> [   10.299381]  do_exit+0x50f/0xb70
> [   10.299381]  ? crypto_alg_tested+0x128/0x1c0
> [   10.299381]  ? crypto_acomp_scomp_free_ctx+0x30/0x30
> [   10.299381]  __module_put_and_exit+0x16/0x20
> [   10.299381]  cryptomgr_test+0x21/0x30
> [   10.299381]  kthread+0x11d/0x140
> [   10.299381]  ? __kthread_parkme+0x80/0x80
> [   10.299381]  ret_from_fork+0x35/0x40
> [   10.299381] Modules linked in:
> [   10.299381] CR2: 000000000000034b
> [   10.299381] ---[ end trace 0c5b275fb9ac2313 ]---
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email

[rgb(a)madcap2 lkp-tests (master)]$ bin/lkp qemu -k /home/rgb/git/linux-2.6=
/arch/x86_64/boot/bzImage job-script
Do you agree to create lkp users for testing? [N/y]
Skip to create user steps.
make: Entering directory `/home/rgb/git/lkp-tests/bin/event'
gcc  -static -o wakeup wakeup.o
rm -f wakeup.o
strip wakeup
make: Leaving directory `/home/rgb/git/lkp-tests/bin/event'
cpio: root:lkp: invalid group
cpio: root:lkp: invalid group
cpio: root:lkp: invalid group
gzip: /home/rgb/.lkp/cache/lkp-x86_64.cpio: No such file or directory
mv: cannot stat _/home/rgb/.lkp/cache/lkp-x86_64.cpio.gz_: No such file or =
directory

> Thanks,
> lkp

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--===============4291960993853515032==--

