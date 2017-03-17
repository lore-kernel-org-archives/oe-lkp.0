Content-Type: multipart/mixed; boundary="===============0069421782237531156=="
MIME-Version: 1.0
From: Thomas Garnier <thgarnie@google.com>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Fri, 17 Mar 2017 10:41:40 -0700
Message-ID: <CAJcbSZHVFhesnkOcegwRF3O_q-NS4fjbLqMd5z_kwXXwzc1CnA@mail.gmail.com>
In-Reply-To: <20170317115924.GA82960@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0069421782237531156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I tried multiple things to repro this crash without success:
 - Used the config on my existing qemu setup (boot fine)
 - Add most of the command-line (boot fine)
 - Try to run the script on a dedicated machine and it seems it is
really tailored for your setup. I had errors with usernames and cpio
crashing.

Any additional information you could share? (RIP -> function name,
callstack etc..?)

Thanks,

On Fri, Mar 17, 2017 at 4:59 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> commit: 45fc8757d1d2128e342b4e7ef39adedf7752faac ("x86: Make the GDT rema=
pping read-only on 64-bit")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/mm
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------+------------+------------+
> |                                          | 69218e4799 | 45fc8757d1 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 8          | 2          |
> | boot_failures                            | 0          | 11         |
> | BUG:unable_to_handle_kernel              | 0          | 11         |
> | Oops:#[##]                               | 0          | 11         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 11         |
> +------------------------------------------+------------+------------+
>
>
>
> [    4.347219] BUG: unable to handle kernel paging request at ffffffffff5=
77060
> [    4.349770] IP: 0xf77e91ed
> [    4.351365] PGD 1e0c067
> [    4.351366] P4D 1e0c067
> [    4.352885] PUD 1e0e067
> [    4.354421] PMD 1e0f067
> [    4.355947] PTE 800000000be09161
> [    4.357457]
> [    4.360480] Oops: 0003 [#1] SMP
> [    4.362150] Modules linked in:
> [    4.363816] CPU: 0 PID: 1 Comm: init Not tainted 4.11.0-rc2-00014-g45f=
c875 #15
> [    4.367207] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [    4.371277] task: ffff88000b9a8000 task.stack: ffffc900000d0000
> [    4.373550] RIP: 0023:0xf77e91ed
> [    4.375284] RSP: 002b:00000000ffed034c EFLAGS: 00010246
> [    4.377409] RAX: 0000000000000063 RBX: 00000000f77edff0 RCX: 00000000f=
fed034c
> [    4.379996] RDX: 00000000f77e1690 RSI: 00000000f77ee094 RDI: 000000000=
000000c
> [    4.382588] RBP: 00000000ffed0368 R08: 0000000000000000 R09: 000000000=
0000000
> [    4.385136] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [    4.387709] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [    4.390289] FS:  0000000000000000(0000) GS:ffff88000be00000(0000) knlG=
S:0000000000000000
> [    4.393870] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [    4.396131] CR2: ffffffffff577060 CR3: 0000000019d08000 CR4: 000000000=
00006f0
> [    4.398696] RIP: 0xf77e91ed RSP: 00000000ffed034c
> [    4.400716] CR2: ffffffffff577060
> [    4.402425] ---[ end trace 35060e6ad8052d5b ]---
>
>
> To reproduce:
>
>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
>
>
>
> Thanks,
> Kernel Test Robot



-- =

Thomas

--===============0069421782237531156==--

