Content-Type: multipart/mixed; boundary="===============4454274515412010361=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage - clang KCOV?
Date: Tue, 21 Dec 2021 22:31:54 +0800
Message-ID: <20211221143153.GA4676@linux.intel.com>
In-Reply-To: <YbyIJYzqtHPKRMFt@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============4454274515412010361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Fri, Dec 17, 2021 at 08:52:53PM +0800, Borislav Petkov wrote:
> ---
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 0083464de5e3..79b3d67addcc 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -384,7 +384,7 @@ void native_write_cr0(unsigned long val)
>  }
>  EXPORT_SYMBOL(native_write_cr0);
>  =

> -void native_write_cr4(unsigned long val)
> +void __no_profile native_write_cr4(unsigned long val)
>  {
>  	unsigned long bits_changed =3D 0;
>  =

> diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
> index 75acb6027a87..68d2b7f9a913 100644
> --- a/arch/x86/kernel/head64.c
> +++ b/arch/x86/kernel/head64.c
> @@ -483,7 +483,7 @@ asmlinkage __visible void __init x86_64_start_kernel(=
char * real_mode_data)
>  	/* Kill off the identity-map trampoline */
>  	reset_early_page_tables();
>  =

> -	__native_tlb_flush_global(native_read_cr4());
> +	__native_tlb_flush_global(this_cpu_read(cpu_tlbstate.cr4));
>  =

>  	clear_bss();
>  =


We tested your patch, it can fix the issue, thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  clang-14/x86_64-randconfig-a013-20211207/debian-10.4-x86_64-20200603.cgz/=
1/vm-snb/boot

commit: =

  9de4999050 ("x86/realmode: Add comment for Global bit usage in trampoline=
_pgd")
  f154f29085 ("x86/mm/64: Flush global TLB on boot and AP bringup") =

  d12ddfe498 ("fixup-for-f154f29085")

9de4999050b5f2e8 f154f290855b070cc94dd44ad25 d12ddfe498329a0967c008d8183 =

---------------- --------------------------- --------------------------- =

       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |    =

           :27         100%          27:27           0%            :27    d=
mesg.BUG:kernel_reboot-without-warning_in_boot_stage
--===============4454274515412010361==--

