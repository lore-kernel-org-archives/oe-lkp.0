Content-Type: multipart/mixed; boundary="===============0199004685046757446=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: 616457a8af ("cpufreq: Implement USER constraint"): BUG: unable to handle kernel NULL pointer dereference at 0000000c
Date: Mon, 14 Jan 2019 12:07:31 +0530
Message-ID: <20190114063731.hczbkie7pzwmseu6@vireshk-i7>
In-Reply-To: <5c3931ab.5aenAXUlfSk1Ugf5%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0199004685046757446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12-01-19, 08:15, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/fr=
eq-constraints
> =

> commit 616457a8af14cb152a85e8e3b2b4c2eb54a38e09
> Author:     Viresh Kumar <viresh.kumar@linaro.org>
> AuthorDate: Wed Jan 9 15:28:22 2019 +0530
> Commit:     Viresh Kumar <viresh.kumar@linaro.org>
> CommitDate: Fri Jan 11 14:36:10 2019 +0530
> =

>     cpufreq: Implement USER constraint
>     =

>     This implements the FREQ_CONSTRAINT_USER constraint and removes the o=
ld
>     style of doing the same. We just need to update the constraint on any
>     modifications to scaling_{min|max}_frequency and the freq-constraint
>     core will call cpufreq's callback which will call cpufreq_set_policy()
>     eventually.
>     =

>     Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> =

> d6dad7a600  cpufreq: Implement freq-constraint callback
> 616457a8af  cpufreq: Implement USER constraint
> +------------------------------------------+------------+------------+
> |                                          | d6dad7a600 | 616457a8af |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 33         | 0          |
> | boot_failures                            | 0          | 11         |
> | BUG:unable_to_handle_kernel              | 0          | 11         |
> | Oops:#[##]                               | 0          | 11         |
> | EIP:freq_constraint_remove               | 0          | 11         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 11         |
> +------------------------------------------+------------+------------+
> =

> [   31.703826] evm: security.capability
> [   31.707673] evm: HMAC attrs: 0x1
> [   31.723245] RIO: rio_register_scan for mport_id=3D-1
> [   31.731925]   Magic number: 3:25:858
> [   31.736371] tty ptysd: hash matches
> [   31.743574] BUG: unable to handle kernel NULL pointer dereference at 0=
000000c
> [   31.751136] #PF error: [normal kernel read fault]
> [   31.756134] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 =

> [   31.762133] Oops: 0000 [#1] SMP PTI
> [   31.765819] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc1-00024-=
g616457a #1
> [   31.773570] EIP: freq_constraint_remove+0x16/0xc0
> [   31.778553] Code: 83 c4 04 89 d8 5b 5e 5f 5d c3 8d 76 00 8d bc 27 00 0=
0 00 00 57 56 89 c7 53 89 d3 83 ec 0c 65 a1 14 00 00 00 89 44 24 08 31 c0 <=
8b> 42 0c 8b 52 10 89 04 24 89 f8 89 54 24 04 e8 56 f9 ff ff 3d 00
> [   31.797880] EAX: 00000000 EBX: 00000000 ECX: 6228512f EDX: 00000000
> [   31.804358] ESI: dfa40db4 EDI: de46f628 EBP: 00200282 ESP: c0021e78
> [   31.810874] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210=
246
> [   31.817876] CR0: 80050033 CR2: 0000000c CR3: 024d6000 CR4: 000006b0
> [   31.824450] Call Trace:
> [   31.827076]  ? cpufreq_policy_free+0xa0/0xe0
> [   31.831578]  ? cpufreq_online+0x5f7/0x680
> [   31.835924]  ? klist_next+0xd7/0x130
> [   31.839765]  ? cpufreq_add_dev+0x37/0x50
> [   31.843930]  ? subsys_interface_register+0xa5/0xf0
> [   31.848894]  ? cpufreq_register_driver+0xea/0x1d0
> [   31.853818]  ? acpi_cpufreq_init+0x236/0x298
> [   31.858254]  ? cpufreq_gov_dbs_init+0x27/0x27
> [   31.862860]  ? do_one_initcall+0x98/0x1f1
> [   31.867326]  ? do_early_param+0x111/0x111
> [   31.871610]  ? kernel_init_freeable+0x118/0x1f6
> [   31.876341]  ? rest_init+0x120/0x120
> [   31.880100]  ? kernel_init+0x5/0x100
> [   31.883967]  ? ret_from_fork+0x19/0x24
> [   31.887920] CR2: 000000000000000c
> [   31.891393] ---[ end trace 2ddc149568b5b3e8 ]---
> [   31.896337] EIP: freq_constraint_remove+0x16/0xc0

Should be fixed now. Thanks.

-- =

viresh

--===============0199004685046757446==--

