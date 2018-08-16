Content-Type: multipart/mixed; boundary="===============7079591328240257571=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: a13c600e15 ("x86/mm/pti: Move user W+X check into .."): WARNING: CPU: 0 PID: 1 at arch/x86/mm/dump_pagetables.c:283 note_page
Date: Thu, 16 Aug 2018 11:08:59 +0800
Message-ID: <f867895e-24c8-7c4d-869c-8cdfb1e0e82d@intel.com>
In-Reply-To: <20180810083504.55pljlr733lctz5k@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7079591328240257571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 08/10/2018 04:35 PM, Joerg Roedel wrote:
> On Fri, Aug 10, 2018 at 06:33:42AM +0800, kernel test robot wrote:
>> commit a13c600e15de44ccf03df28d3311ef3cb754ed9b
>> Author:     Joerg Roedel <jroedel@suse.de>
>> AuthorDate: Wed Aug 8 13:16:40 2018 +0200
>> Commit:     Thomas Gleixner <tglx@linutronix.de>
>> CommitDate: Thu Aug 9 20:42:07 2018 +0200
>>
>>      x86/mm/pti: Move user W+X check into pti_finalize()
> Okay, I found the problem and the diff below fixes it.
The patch works well.
Tested-by: kernel test robot <rong.a.chen@intel.com>

>
> Ingo, Thomas, can you fold that diff into above commit or do you prefer
> a separate patch?
>
> Thanks and sorry for the hassle,
>
>
>         Joerg
>
> diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
> index 026a89aa16d7..d1435c78ae4f 100644
> --- a/arch/x86/mm/pti.c
> +++ b/arch/x86/mm/pti.c
> @@ -629,5 +629,6 @@ void pti_finalize(void)
>   	pti_clone_entry_text();
>   	pti_clone_kernel_text();
>   =

> -	debug_checkwx_user();
> +	if (__supported_pte_mask & _PAGE_NX)
> +		debug_checkwx_user();
>   }
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============7079591328240257571==--

