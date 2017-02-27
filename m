Content-Type: multipart/mixed; boundary="===============8539616679225444018=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm/ptdump] 243b72aae2: WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page
Date: Mon, 27 Feb 2017 16:01:34 +0300
Message-ID: <34aa4f8e-190a-8895-bf43-22d3f08efd17@virtuozzo.com>
In-Reply-To: <20170227010341.GA32284@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8539616679225444018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/27/2017 04:03 AM, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 243b72aae28ca1032284028323bb81c9235b15c9 ("x86/mm/ptdump: Optimiz=
e check for W+X mappings for CONFIG_KASAN=3Dy")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

...
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-----------------------------------------------------+------------+-----=
-------+
> |                                                     | 5b1ad68f9b | 243b=
72aae2 |
> +-----------------------------------------------------+------------+-----=
-------+
> | boot_successes                                      | 0          | 0   =
       |
> | boot_failures                                       | 8          | 6   =
       |
> | BUG:KASAN:slab-out-of-bounds                        | 8          | 6   =
       |
> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 0          | 6   =
       |
> +-----------------------------------------------------+------------+-----=
-------+

Ok, I reproduced this, but it's definitely caused *not* by 243b72aae28.
This WARN is also reproducible on the parent commit 5b1ad68f9b.
The only difference here is that on parent one needs dozens of seconds to r=
each this WARNING.
It seems that this time difference somehow confused the robot.

As for the warning itself, it caused by kprobes. krpobe code use module_all=
oc() which
creates these RWX mappings.
I'm not sure how to fix this as AFAIK kprobes actually need RWX mapping.


> =

> [   25.592875] WARNING: CPU: 0 PID: 1 at arch/x86/mm/dump_pagetables.c:22=
6 note_page+0x820/0xaf0
> [   25.592875] WARNING: CPU: 0 PID: 1 at arch/x86/mm/dump_pagetables.c:22=
6 note_page+0x820/0xaf0
> [   25.597768] x86/mm: Found insecure W+X mapping at address ffffffffa000=
0000/0xffffffffa0000000
> [   25.597768] x86/mm: Found insecure W+X mapping at address ffffffffa000=
0000/0xffffffffa0000000
> [   25.601564] Modules linked in:
> [   25.601564] Modules linked in:
> [   25.603072] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B           4.=
10.0-rc8-00007-g243b72a #2
> [   25.603072] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B           4.=
10.0-rc8-00007-g243b72a #2
> [   25.607397] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   25.607397] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   25.611819] Call Trace:
> [   25.611819] Call Trace:
> [   25.612954]  dump_stack+0x63/0x8d
> [   25.612954]  dump_stack+0x63/0x8d
> [   25.614457]  __warn+0x10d/0x130
> [   25.614457]  __warn+0x10d/0x130
> [   25.615885]  warn_slowpath_fmt+0x4a/0x50
> [   25.615885]  warn_slowpath_fmt+0x4a/0x50
> [   25.617775]  ? _raw_spin_unlock_irq+0x22/0x40
> [   25.617775]  ? _raw_spin_unlock_irq+0x22/0x40
> [   25.619940]  note_page+0x820/0xaf0
> [   25.619940]  note_page+0x820/0xaf0
> [   25.621416]  ptdump_walk_pgd_level_core+0x420/0x480
> [   25.621416]  ptdump_walk_pgd_level_core+0x420/0x480
> [   25.623820]  ? 0xffffffff81000000
> [   25.623820]  ? 0xffffffff81000000
> [   25.625369]  ptdump_walk_pgd_level_checkwx+0x12/0x20
> [   25.625369]  ptdump_walk_pgd_level_checkwx+0x12/0x20
> [   25.627604]  mark_rodata_ro+0x112/0x120
> [   25.627604]  mark_rodata_ro+0x112/0x120
> [   25.629364]  ? rest_init+0xe0/0xe0
> [   25.629364]  ? rest_init+0xe0/0xe0
> [   25.630915]  kernel_init+0x2a/0x120
> [   25.630915]  kernel_init+0x2a/0x120
> [   25.632542]  ? rest_init+0xe0/0xe0
> [   25.632542]  ? rest_init+0xe0/0xe0
> [   25.634340]  ret_from_fork+0x2c/0x40
> [   25.634340]  ret_from_fork+0x2c/0x40
> [   25.635989] ---[ end trace 583b8aa56cec4492 ]---
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> Xiaolong
>=20

--===============8539616679225444018==--

