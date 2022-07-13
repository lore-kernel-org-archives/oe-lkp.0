Content-Type: multipart/mixed; boundary="===============2071116687352918054=="
MIME-Version: 1.0
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: lkp@lists.01.org
Subject: Re: [mm] 0bf5cdf08f: BUG:Bad_page_state_in_process
Date: Wed, 13 Jul 2022 17:17:44 +0800
Message-ID: <1badee01-b872-8de8-4fe1-83d6dc6b756c@linux.alibaba.com>
In-Reply-To: <Ys0P+ssAhAyfdA56@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2071116687352918054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 7/12/2022 2:08 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 0bf5cdf08f32bbb2d5dbc794fe609e1d97ca5257 ("[RFC PATCH v2 3/3] mm:=
 Add kernel PTE level pagetable pages account")
> url: https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/Add-PUD-a=
nd-kernel-PTE-level-pagetable-account/20220622-170051
> base: https://git.kernel.org/cgit/linux/kernel/git/arnd/asm-generic.git m=
aster
> patch link: https://lore.kernel.org/linux-mm/7882bbf467440f9a3ebe41d96ba5=
b6f384081bb7.1655887440.git.baolin.wang(a)linux.alibaba.com
> =

> in testcase: stress-ng
> version: stress-ng-x86_64-0.11-06_20220709
> with following parameters:
> =

> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 60s
> 	fs: xfs
> 	class: filesystem
> 	test: dnotify
> 	cpufreq_governor: performance
> 	ucode: 0xb000280
> =

> =

> =

> on test machine: 96 threads 2 sockets Ice Lake with 256G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

Thanks for reporting. I think I missed the changes in =

pud_free_pmd_page(), which also can free a kernel pte page table.

And I will use pte_free_kernel() instead in new version patch set.

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 20f30762d618..f961578e2a54 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -828,6 +828,7 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
         for (i =3D 0; i < PTRS_PER_PMD; i++) {
                 if (!pmd_none(pmd_sv[i])) {
                         pte =3D (pte_t *)pmd_page_vaddr(pmd_sv[i]);
+                       pgtable_clear_and_dec(virt_to_page(pte));
                         free_page((unsigned long)pte);
                 }
         }


> =

> =

> [   36.465236][ T1887] BUG: Bad page state in process ucfr  pfn:1ed9a9
> [   36.465238][ T1887] page:00000000c52990fe refcount:0 mapcount:-512 map=
ping:0000000000000000 index:0x0 pfn:0x1ed9a9
> [   36.465244][ T1887] flags: 0x17ffffc0000000(node=3D0|zone=3D2|lastcpup=
id=3D0x1fffff)
> [   36.465248][ T1887] raw: 0017ffffc0000000 dead000000000100 dead0000000=
00122 0000000000000000
> [   36.465249][ T1887] raw: 0000000000000000 0000000000000000 00000000fff=
ffdff 0000000000000000
> [   36.465249][ T1887] page dumped because: nonzero mapcount
> [   36.465250][ T1887] Modules linked in: acpi_cpufreq(-) device_dax(+) n=
d_pmem nd_btt dax_pmem intel_rapl_msr intel_rapl_common btrfs ipmi_ssif x86=
_pkg_temp_thermal blake2b_generic intel_powerclamp xor raid6_pq coretemp zs=
td_compress libcrc32c nvme sd_mod ast drm_vram_helper sg drm_ttm_helper nvm=
e_core kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel t=
10_pi ghash_clmulni_intel ttm rapl drm_kms_helper crc64_rocksoft_generic ah=
ci intel_cstate syscopyarea crc64_rocksoft libahci intel_uncore crc64 sysfi=
llrect ioatdma sysimgblt joydev fb_sys_fops libata dca wmi acpi_ipmi ipmi_s=
i ipmi_devintf ipmi_msghandler nfit libnvdimm acpi_pad acpi_power_meter drm=
 fuse ip_tables
> [   36.465278][ T1887] CPU: 8 PID: 1887 Comm: ucfr Tainted: G S          =
      5.19.0-rc2-00013-g0bf5cdf08f32 #1
> [   36.465280][ T1887] Call Trace:
> [   36.465283][ T1887]  <TASK>
> [ 36.465285][ T1887] dump_stack_lvl (lib/dump_stack.c:107 (discriminator =
1))
> [ 36.465292][ T1887] bad_page.cold (mm/page_alloc.c:642)
> [ 36.465296][ T1887] free_pcppages_bulk (mm/page_alloc.c:1526)
> [ 36.465302][ T1887] free_unref_page (arch/x86/include/asm/irqflags.h:137=
 mm/page_alloc.c:3459)
> [ 36.465304][ T1887] __mmdrop (arch/x86/include/asm/mmu_context.h:125 (di=
scriminator 3) kernel/fork.c:789 (discriminator 3))
> [ 36.465307][ T1887] finish_task_switch+0x200/0x2c0
> [ 36.465312][ T1887] schedule_tail (arch/x86/include/asm/preempt.h:85 ker=
nel/sched/core.c:5053)
> [ 36.465315][ T1887] ret_from_fork (arch/x86/entry/entry_64.S:289)
> [   36.465320][ T1887]  </TASK>
> [   36.465320][ T1887] Disabling lock debugging due to kernel taint
> [   37.204107][  T656] BUG: Bad page state in process kworker/7:1  pfn:40=
67654
> [   37.204114][  T656] page:0000000017c1d009 refcount:0 mapcount:-512 map=
ping:0000000000000000 index:0x0 pfn:0x4067654
> [   37.204120][  T656] flags: 0x57ffffc0000000(node=3D1|zone=3D2|lastcpup=
id=3D0x1fffff)
> [   37.204126][  T656] raw: 0057ffffc0000000 dead000000000100 dead0000000=
00122 0000000000000000
> [   37.204128][  T656] raw: 0000000000000000 0000000000000000 00000000fff=
ffdff 0000000000000000
> [   37.204128][  T656] page dumped because: nonzero mapcount
> [   37.204129][  T656] Modules linked in: acpi_cpufreq(-) device_dax(+) n=
d_pmem nd_btt dax_pmem intel_rapl_msr intel_rapl_common btrfs ipmi_ssif x86=
_pkg_temp_thermal blake2b_generic intel_powerclamp xor raid6_pq coretemp zs=
td_compress libcrc32c nvme sd_mod ast drm_vram_helper sg drm_ttm_helper nvm=
e_core kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel t=
10_pi ghash_clmulni_intel ttm rapl drm_kms_helper crc64_rocksoft_generic ah=
ci intel_cstate syscopyarea crc64_rocksoft libahci intel_uncore crc64 sysfi=
llrect ioatdma sysimgblt joydev fb_sys_fops libata dca wmi acpi_ipmi ipmi_s=
i ipmi_devintf ipmi_msghandler nfit libnvdimm acpi_pad acpi_power_meter drm=
 fuse ip_tables
> [   37.204165][  T656] CPU: 7 PID: 656 Comm: kworker/7:1 Tainted: G S  B =
            5.19.0-rc2-00013-g0bf5cdf08f32 #1
> [   37.204168][  T656] Workqueue: mm_percpu_wq vmstat_update
> [   37.204181][  T656] Call Trace:
> [   37.204184][  T656]  <TASK>

snip.
--===============2071116687352918054==--

