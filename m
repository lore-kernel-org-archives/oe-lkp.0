Content-Type: multipart/mixed; boundary="===============2512915123636462231=="
MIME-Version: 1.0
From: Wanpeng Li <wanpeng.li@hotmail.com>
To: lkp@lists.01.org
Subject: Re: 64e4e01a47 ("KVM: async_pf: Let host know whether the guest suppo..."): kvm_smp_prepare_boot_cpu+0x
Date: Mon, 26 Jun 2017 14:51:00 +0000
Message-ID: <SG2PR02MB131270F43B35B5533E80848980DF0@SG2PR02MB1312.apcprd02.prod.outlook.com>
In-Reply-To: <5950b6a8.0YPwQmwiKKGhm0Qx%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2512915123636462231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Cc Paolo, Radim,

On 6/26/17 3:24 PM, kernel test robot wrote:

> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux/commits/Wanpeng-Li/KVM-async_pf-Fix-asyn=
c_pf-exception-injection/20170623-162406

Thanks for the report.

> commit 64e4e01a47929e1b12649e371643331452bd5a84
> Author:     Wanpeng Li <wanpeng.li@hotmail.com>
> AuthorDate: Wed Jun 21 19:06:54 2017 -0700
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Fri Jun 23 16:24:17 2017 +0800
>
>      KVM: async_pf: Let host know whether the guest support delivery asyn=
c_pf as #PF vmexit
>      =

>      Adds another flag bit (bit 2) to MSR_KVM_ASYNC_PF_EN. If bit 2 is 1,=
 async
>      page faults are delivered to L1 as #PF vmexits; if bit 2 is 0, kvm_c=
an_do_async_pf
>      returns 0 if in guest mode.
>      =

>      Cc: Paolo Bonzini <pbonzini@redhat.com>
>      Cc: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
>      Signed-off-by: Wanpeng Li <wanpeng.li@hotmail.com>
>
> 14a3051e20  KVM: async_pf: Force a nested vmexit if the injected #PF is a=
sync_pf
> 64e4e01a47  KVM: async_pf: Let host know whether the guest support delive=
ry async_pf as #PF vmexit
> 64e4e01a47  KVM: async_pf: Let host know whether the guest support delive=
ry async_pf as #PF vmexit
> +----------------+------------+------------+------------+
> |                | 14a3051e20 | 64e4e01a47 | 64e4e01a47 |
> +----------------+------------+------------+------------+
> | boot_successes | 35         | 4          | 4          |
> +----------------+------------+------------+------------+
>
> [    0.000000] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:1 n=
r_node_ids:1
> [    0.000000] percpu: Embedded 44 pages/cpu @ffff88001a600000 s141056 r8=
192 d30976 u2097152
> [    0.000000] pcpu-alloc: s141056 r8192 d30976 u2097152 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] unchecked MSR access error: WRMSR to 0x4b564d02 (tried to =
write 0x000000001a615647) at rIP: 0xffffffff8a466454 (native_write_msr+0x4/=
0x30)
> [    0.000000] Call Trace:
> [    0.000000]  ? kvm_guest_cpu_init+0x116/0x1c0
> [    0.000000]  kvm_smp_prepare_boot_cpu+0xe/0x15
> [    0.000000]  start_kernel+0x16b/0x4d7
> [    0.000000]  ? thread_stack_cache_init+0x10/0x10
> [    0.000000]  ? native_write_idt_entry+0x3e/0x50
> [    0.000000]  x86_64_start_reservations+0x2f/0x31
> [    0.000000]  x86_64_start_kernel+0x143/0x152
> [    0.000000]  secondary_startup_64+0x9f/0x9f

I think this is a false report, we utilize MSR_KVM_ASYNC_PF_EN bit 2 to =

represent async page faults are delivered to L1 as #PF vmexits in this =

patchset, however, old kvm will treat bit 2 as a reserved bit, So both =

guest and host kernel applied this patchset for the pv stuff can avoid =

the confusing.

Regards,
Wanpeng Li
> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1a615600
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 128859
> [    0.000000] Kernel command line: root=3D/dev/ram0 hung_task_panic=3D1 =
debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D10=
0 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_w=
atchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor=
_count=3D8 systemd.log_level=3Derr ignore_loglevel earlyprintk=3DttyS0,1152=
00 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw link=3D/kbuild-tes=
ts/run-queue/yocto-vp/x86_64-randconfig-s2-06261058/linux-devel:devel-hourl=
y-2017062603:64e4e01a47929e1b12649e371643331452bd5a84:bisect-linux-7/.vmlin=
uz-64e4e01a47929e1b12649e371643331452bd5a84-20170626143449-5:yocto-vp-26 br=
anch=3Dlinux-devel/devel-hourly-2017062603 BOOT_IMAGE=3D/pkg/linux/x86_64-r=
andconfig-s2-06261058/gcc-6/64e4e01a47929e1b12649e371643331452bd5a84/vmlinu=
z-4.12.0-rc5-00404-g64e4e01 drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
>
>                                                            # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start b36d2325226494534e29ddfe888bf8c304eaca24 41f1830f5a7af77=
cf5c86359aba3cbd706687e52 --
> git bisect good eb4082c70710e098c06cd765fa75a0e3823c32d6  # 11:42  G     =
11     0   11  11  Merge 'linux-review/Horia-Geant/crypto-caam-fix-gfp-allo=
cation-flags-part-I/20170619-190441' into devel-hourly-2017062603
> git bisect  bad f89a4b3129fbdfaece534169edbac7ef94fa579b  # 11:53  B     =
 0    11   23   0  Merge 'linux-review/Brian-Gerst/x86-IOPL-switching-clean=
ups/20170615-151205' into devel-hourly-2017062603
> git bisect  bad 91e18312313fdd914f8d37a57343f30f086b3775  # 12:16  B     =
 0    10   23   1  Merge 'linux-review/Tejun-Heo/sched-Allow-migrating-kthr=
eads-into-online-but-inactive-CPUs/20170619-004921' into devel-hourly-20170=
62603
> git bisect  bad b8d5e2f368cdc6edd2fdd52d0488687b77c99ce3  # 12:38  B     =
 0    11   23   0  Merge 'linux-review/Kirill-Tkhai/rwsem-Implement-down_re=
ad_killable/20170620-092118' into devel-hourly-2017062603
> git bisect good fa82246a86bcc3b355492a2af52d0ac54b6b6382  # 12:47  G     =
11     0   11  11  Merge 'linux-review/Oleksij-Rempel/ARM-dts-imx6-RIoTboar=
d-provide-gpio-line-names/20170621-162822' into devel-hourly-2017062603
> git bisect  bad 83ffd343cf71c509ec783e89081fde7b6cebe85c  # 13:02  B     =
 0    11   23   0  Merge 'perf/tmp.perf/annotate' into devel-hourly-2017062=
603
> git bisect  bad 9474f84686e7cb6ad2867a06d211f4e549292454  # 13:17  B     =
 0    11   23   0  Merge 'linux-review/Paolo-Abeni/udp-v6-prefetch-rmem_all=
oc-in-udp6_queue_rcv_skb/20170623-015244' into devel-hourly-2017062603
> git bisect  bad 69cd1c7b3ac55c7a30404aeac12f0ce2a523cb1d  # 13:26  B     =
 0    11   23   0  Merge 'linux-review/Yuval-Mintz/qed-RDMA-and-infrastruct=
ure-for-iWARP/20170621-091721' into devel-hourly-2017062603
> git bisect good 5017cbd93dddc9af50b860da847687177b388a24  # 13:38  G     =
11     0   11  11  Merge 'p2pmem/io64_v2' into devel-hourly-2017062603
> git bisect  bad a9a10bc12984c25bca88fcc6678740506409865d  # 13:50  B     =
 0     7   20   1  Merge 'linux-review/Wanpeng-Li/KVM-async_pf-Fix-async_pf=
-exception-injection/20170623-162406' into devel-hourly-2017062603
> git bisect good deddbe86d4ace7c927927c580e80e18269af1d0d  # 14:05  G     =
11     0    0   0  KVM: async_pf: Add L1 guest async_pf #PF vmexit handler
> git bisect  bad 64e4e01a47929e1b12649e371643331452bd5a84  # 14:36  B     =
 0    10   23   0  KVM: async_pf: Let host know whether the guest support d=
elivery async_pf as #PF vmexit
> git bisect good 14a3051e20b1838a144986735cc25a1bbf501d66  # 14:53  G     =
11     0    0   0  KVM: async_pf: Force a nested vmexit if the injected #PF=
 is async_pf
> # first bad commit: [64e4e01a47929e1b12649e371643331452bd5a84] KVM: async=
_pf: Let host know whether the guest support delivery async_pf as #PF vmexit
> git bisect good 14a3051e20b1838a144986735cc25a1bbf501d66  # 14:56  G     =
31     0    0   0  KVM: async_pf: Force a nested vmexit if the injected #PF=
 is async_pf
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 64e4e01a47929e1b12649e371643331452bd5a84  # 15:08  B     =
 0    11   24   0  KVM: async_pf: Let host know whether the guest support d=
elivery async_pf as #PF vmexit
> # extra tests on HEAD of linux-devel/devel-hourly-2017062603
> git bisect  bad b36d2325226494534e29ddfe888bf8c304eaca24  # 15:08  B     =
 0    31   46   0  0day head guard for 'devel-hourly-2017062603'
> # extra tests on tree/branch linux-review/Wanpeng-Li/KVM-async_pf-Fix-asy=
nc_pf-exception-injection/20170623-162406
> git bisect  bad 64e4e01a47929e1b12649e371643331452bd5a84  # 15:11  B     =
 0    11   24   0  KVM: async_pf: Let host know whether the guest support d=
elivery async_pf as #PF vmexit
> # extra tests with first bad commit reverted
> git bisect good 97fe9672cce750076ea7acb34e40345029e5e3ee  # 15:23  G     =
11     0    0   0  Revert "KVM: async_pf: Let host know whether the guest s=
upport delivery async_pf as #PF vmexit"
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion


--===============2512915123636462231==--

