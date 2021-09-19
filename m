Content-Type: multipart/mixed; boundary="===============3910963710418235727=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: lkp@lists.01.org
Subject: Re: [dmaengine] fe364a7d95: UBSAN:array-index-out-of-bounds_in_drivers/acpi/acpica/dswexec.c
Date: Sun, 19 Sep 2021 23:42:29 +0300
Message-ID: <CAHp75VexBzWBWrmtmZzYo4pzEuO-Neuio=wjNfJCH6Je1DQXNQ@mail.gmail.com>
In-Reply-To: <20210918150130.GA30982@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3910963710418235727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+Cc: Rafael, ACPI ml



On Sun, Sep 19, 2021 at 10:41 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: fe364a7d95c24e07e9b3f2ab917f01d6d8330bba ("dmaengine: dw: Program=
 xBAR hardware for Elkhart Lake")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

I do not believe the above commit is related to the reported issue.

> in testcase: netperf
> version: netperf-x86_64-2.7-0_20210908
> with following parameters:
>
>         ip: ipv4
>         runtime: 300s
>         nr_threads: 1
>         cluster: cs-localhost
>         test: TCP_CRR
>         cpufreq_governor: performance
>         ucode: 0xb000280
>
> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
>
>
> on test machine: 96 threads 2 sockets Ice Lake with 256G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [   47.872842][ T1341] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   47.884637][ T1341] UBSAN: array-index-out-of-bounds in drivers/acpi/a=
cpica/dswexec.c:401:12
> [   47.884644][ T1341] index -1 is out of range for type 'acpi_operand_ob=
ject *[9]'
> [   47.884647][ T1341] CPU: 9 PID: 1341 Comm: systemd-udevd Not tainted 5=
.14.0-rc1-00001-gfe364a7d95c2-dirty #1
> [   47.884650][ T1341] Call Trace:
> 0m] Reached targ[   47.889421][ T1346] IPMI message handler: version 39.2
> [   47.927593][ T1341]  ubsan_epilogue+0x5/0x40
> [   47.931873][ T1341]  __ubsan_handle_out_of_bounds+0x69/0x80
> [   47.943808][ T1341]  acpi_ps_parse_loop+0x4a5/0x5e4
> [   47.948707][ T1341]  acpi_ps_parse_aml+0x94/0x2c0
> [   47.954716][ T1341]  acpi_ps_execute_method+0x15e/0x193
> [   47.959953][ T1341]  acpi_ns_evaluate+0x1c7/0x25e
> [   47.964663][ T1341]  acpi_evaluate_object+0x140/0x250
> [   47.969727][ T1341]  acpi_evaluate_dsm+0xac/0x140
> [   47.974456][ T1341]  acpi_nfit_ctl+0x2c0/0xa00 [nfit]
> [   47.979522][ T1341]  ? lock_acquire+0xbb/0x2c0
> [   47.983985][ T1341]  intel_bus_fwa_businfo+0x6a/0xc0 [nfit]
> [   47.989580][ T1341]  intel_bus_fwa_state+0x66/0x100 [nfit]
> [   47.995086][ T1341]  intel_bus_fwa_capability+0x19/0x40 [nfit]
> [   48.000933][ T1341]  nvdimm_bus_firmware_visible+0x35/0x80 [libnvdimm]
>          Startin[   48.007478][ T1341]  internal_create_group+0xde/0x380
> OpenIPMI Driver [   48.020614][ T1341]  internal_create_groups+0x3d/0xc0
> ..
> [   48.033229][ T1341]  ? dev_set_name+0x53/0x80
> [   48.037936][ T1341]  nvdimm_bus_register+0x133/0x1c0 [libnvdimm]
> [   48.043959][ T1341]  acpi_nfit_init+0xccf/0x1540 [nfit]
> [   48.049208][ T1341]  ? get_object+0x40/0x40
> [   48.053409][ T1341]  ? call_rcu+0x197/0x5c0
> [   48.057618][ T1341]  ? lockdep_hardirqs_on_prepare+0xd4/0x180
> [   48.063392][ T1341]  ? kfree+0x33b/0x5c0
> [   48.067341][ T1341]  ? acpi_evaluate_object+0x229/0x250
> [   48.072592][ T1341]  ? acpi_nfit_add+0x196/0x200 [nfit]
> [   48.077832][ T1341]  acpi_nfit_add+0x196/0x200 [nfit]
> [   48.082897][ T1341]  acpi_device_probe+0x44/0x180
>          Startin[   48.087616][ T1341]  really_probe+0xb3/0x340
> e command to reb[   48.106497][ T1341]  __driver_attach+0x9e/0x180
> .
> [   48.119201][ T1341]  ? __device_attach_driver+0x100/0x100
> [   48.124863][ T1341]  bus_for_each_dev+0x78/0xc0
> [   48.129409][ T1341]  bus_add_driver+0x150/0x200
> [   48.133959][ T1341]  driver_register+0x6c/0xc0
> [   48.138418][ T1341]  ? 0xffffffffc065b000
> [   48.142453][ T1341]  nfit_init+0x164/0x1000 [nfit]
> [   48.147269][ T1341]  do_one_initcall+0x58/0x300
> [   48.151817][ T1341]  ? kmem_cache_alloc_trace+0x58a/0x780
> 1;39mRegular bac[   48.168887][ T1341]  ? aa_get_task_label+0xc0/0x300
> kground program [   48.175164][ T1341]  ? __do_sys_finit_module+0xae/0x140
> processing daemo[   48.181758][ T1341]  __do_sys_finit_module+0xae/0x140
> [   48.188211][ T1341]  do_syscall_64+0x38/0xc0
> [   48.193162][ T1341]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   48.198928][ T1341] RIP: 0033:0x7fbf24907f59
> [   48.203215][ T1341] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44=
 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08=
 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01 48
> [   48.222712][ T1341] RSP: 002b:00007fffbc5e56e8 EFLAGS: 00000246 ORIG_R=
AX: 0000000000000139
> [   48.222715][ T1341] RAX: ffffffffffffffda RBX: 00005607041aae50 RCX: 0=
0007fbf24907f59
> [   48.222717][ T1341] RDX: 0000000000000000 RSI: 00007fbf2480ccad RDI: 0=
00000000000000f
>          Startin[   48.222719][ T1341] RBP: 00007fbf2480ccad R08: 0000000=
000000000 R09: 0000000000000000
> m Logging Servic[   48.265121][ T1341] R13: 00005607042343b0 R14: 0000000=
000020000 R15: 00005607041aae50
> [   48.274370][ T1341] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
>


-- =

With Best Regards,
Andy Shevchenko
--===============3910963710418235727==--

