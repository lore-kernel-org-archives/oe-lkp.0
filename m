Content-Type: multipart/mixed; boundary="===============6459404871614668439=="
MIME-Version: 1.0
From: Zi Yan <ziy@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [mm] 23e12fc477: UBSAN:shift-out-of-bounds_in_mm/page_isolation.c
Date: Tue, 10 May 2022 10:30:33 -0400
Message-ID: <06E9A7A4-AEF9-43CC-8AD5-B7B6263ADF73@nvidia.com>
In-Reply-To: <20220510095824.GB3969@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6459404871614668439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi kernel test robot,

There is a fixup patch for the commit: https://git.kernel.org/pub/scm/linux=
/kernel/git/akpm/25-new.git/tree/patches/mm-make-alloc_contig_range-work-at=
-pageblock-granularity-fix.patch
It fixed the issue as I verified it by following the steps below. No more b=
oot hang.

--
Best Regards,
Yan, Zi

On 10 May 2022, at 5:58, kernel test robot wrote:

> Greeting,
>
> FYI, we noticed the following commit (built with clang-15):
>
> commit: 23e12fc477f1c2729af51c427087e777d6e63803 ("mm: make alloc_contig_=
range work at pageblock granularity")
> https://github.com/hnaz/linux-mm master
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
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
> [  103.625478][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  103.628487][    T1] UBSAN: shift-out-of-bounds in mm/page_isolation.c:=
416:17
> [  103.631041][    T1] shift exponent 64 is too large for 64-bit type 'un=
signed long'
> [  103.633539][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.18.0-rc4=
-mm1-00249-g23e12fc477f1 #1 4cafac2312e666eae49f8458f1d93cbe9d5338b2
> [  103.637394][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [  103.640378][    T1] Call Trace:
> [  103.641583][    T1]  <TASK>
> [  103.642670][    T1]  __ubsan_handle_shift_out_of_bounds+0x356/0x3a0
> [  103.644703][    T1]  isolate_single_pageblock+0x683/0x870
> [  103.646498][    T1]  start_isolate_page_range+0x69/0xb10
> [  103.648349][    T1]  alloc_contig_range+0x27b/0x680
> [  103.650010][    T1]  alloc_contig_pages+0x413/0x550
> [  103.651549][    T1]  debug_vm_pgtable_alloc_huge_page+0x27/0xc1
> [  103.653486][    T1]  init_args+0xa5f/0xe06
> [  103.654924][    T1]  ? __hugetlb_cgroup_file_legacy_init+0x61f/0x61f
> [  103.656949][    T1]  debug_vm_pgtable+0x56/0x3e0
> [  103.658484][    T1]  ? __hugetlb_cgroup_file_legacy_init+0x61f/0x61f
> [  103.660556][    T1]  do_one_initcall+0x2bd/0x740
> [  103.662132][    T1]  ? __hugetlb_cgroup_file_legacy_init+0x61f/0x61f
> [  103.664179][    T1]  ? __llvm_gcov_reset+0x740/0x1320
> [  103.665837][    T1]  do_initcall_level+0x13c/0x284
> [  103.667460][    T1]  do_initcalls+0x75/0xb7
> [  103.668995][    T1]  kernel_init_freeable+0x158/0x1f6
> [  103.670678][    T1]  ? rest_init+0x2f0/0x2f0
> [  103.672143][    T1]  kernel_init+0x18/0x2a0
> [  103.673544][    T1]  ? rest_init+0x2f0/0x2f0
> [  103.675026][    T1]  ret_from_fork+0x22/0x30
> [  103.676494][    T1]  </TASK>
> [  103.677587][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  140.018114][    C0] BUG: workqueue lockup - pool cpus=3D0 node=3D0 fla=
gs=3D0x0 nice=3D0 stuck for 32s!
> [  140.021174][    C0] Showing busy workqueues and worker pools:
> [  140.022912][    C0] workqueue events_power_efficient: flags=3D0x80
> [  140.024730][    C0]   pwq 0: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 ac=
tive=3D6/256 refcnt=3D7
> [  140.024759][    C0]     pending: neigh_managed_work, neigh_managed_wor=
k, neigh_managed_work, neigh_periodic_work, neigh_periodic_work, neigh_peri=
odic_work
>
>
>
>
> To reproduce:
>
>         # build kernel
> 	cd linux
> 	cp config-5.18.0-rc4-mm1-00249-g23e12fc477f1 .config
> 	make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Dx86_64 olddefconfig prepare =
modules_prepare bzImage modules
> 	make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<m=
od-install-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> -- =

> 0-DAY CI Kernel Test Service
> https://01.org/lkp

--===============6459404871614668439==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSkRCQUVCQ2dBdEZpRUU2clI0ajhSdVEy
WG1hWm9sNG4rZWdSUUhLRlFGQW1KNmR3a1BISHBwZVVCdWRtbGsKYVdFdVkyOXRBQW9KRU9KL25v
RVVCeWhVTWpVUC9qN2FPQk1aYUh4SElkWGxobStuWXpJZDJSSmw4dFVsQS9TMgpoTWVGL1NFWUZk
VG1RUHQxUWRaeVo3Sndlak9LZ0g4THQ3ampmdWVrZmFTSlNVN2I0OFR4Y2kzaUROb0ZFbjNSClNB
eGxSMnoyZjRHTEVuMW5TcktYU1pURThxd3R0TGFiOVhRSVNiTnRNS3FxcDFXZjZKNWZVTnpvMmR5
SE50T2kKL2dPcGIzbDIyb2RyWWY5WXB6NDl4a0xpb3FVU0pwdWhwc0ZoZm5nTUJ6NEIzNVQ0eVc1
L0NGSENzajU3UUNNegpDUG1melhsckZ6eTdCWGJmUWpqc3lnK0dUWm1ZWmt3MlZieVlpc3lRbUl5
cFVEbkZyQ3czQ1g3dFJsRTVEUldYCkl1T0g0MzcyeHlIOG15SUhoK042aDVPSklsR25ka28zY01Y
SmJZTzBvSDErL2d4UkExYThGQlZ3Rit6NnJLOGoKVkwrUDc0QThyYWtWbkpiSzJzalZTMml5RXRx
RktxR2ExYVZRNXVDbzI1b01WQnVlQjRXU1hYNC9NSzdSZ3pGRApKTWtyVjZBQVVaWEtOL0ZVbDl3
b2NuMWF5UkU4RHN4TGhKb00rNXVjc01xODFsczkxZmFOVjZ1MXFkYnpsNHZpCmpydlI4SWU3RHRE
UHZHdEdaTHM4c1ZBYW01bzdFTytrMW55QjlzTm5RVFl6eUk5L1JrTlMwNWFXaEMvQThGM3gKQTRx
QitaVWVZZlpPMjdJQmZ3ejFFYnJPSVdSZ1BUZEtlK2RiTXBOZmFDekRodzdLakx1U3RnZ3UzSnZ3
OUJocwo4R3BDNFBPRUFnOWF6ekxVdWoySGZ2VkxYNEovaitZZERSUWF6QnZWV1NQU01EQi80YUVw
S0JKM0V4aUpOWitLCmxvZHNLRVNQCj1MU2RICi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============6459404871614668439==--

