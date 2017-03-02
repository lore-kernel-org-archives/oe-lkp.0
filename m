Content-Type: multipart/mixed; boundary="===============1500125110015693538=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 02 Mar 2017 21:40:51 +0100
Message-ID: <58B88353.2010508@iogearbox.net>
In-Reply-To: <20170302202338.ci6wwb3yzjmdy4n2@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1500125110015693538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/02/2017 09:23 PM, Fengguang Wu wrote:
[...]
> I confirm that the below patch provided by Daniel fixes the above
> issues on mainline kernel, too. Where should this patch be sent to?

If nobody objects, I could send it to -net tree via Dave due to being
BPF related, but I don't mind sending it elsewhere too (f.e. Linus
directly?) in order to stop your bot from continuing to send such mails.

The issue seems only related to i386 and doesn't trigger each time with
Fengguang's kernel config and qemu image when I try to reproduce it.
set_memory_ro()/set_memory_rw() on i386 seems to work in general, but
when it's used/reproduced, from time to time (perhaps some corner-case?)
it looks like that memory area can have issues much later on after being
fed back to the allocator which then causes a GPF from random locations.
Gut feeling, it might be an issue in set_memory_*() that my commit
uncovered. Still looking into it, but mean-time I could just send the
below, sure.

Thanks,
Daniel

> It'd be very noisy if all these Oops hit the upcoming RC1 kernel.
>
> Daniel thinks there may be deeper problem in i386 set_memory_rw().
> However that could take much longer time to debug.
>
> Thanks,
> Fengguang
> ---
>
> Re: [bpf] 9d876e79df:  BUG: unable to handle kernel paging request at 653=
a8346
>
>> On Tue, Feb 28, 2017 at 04:39:36PM +0100, Daniel Borkmann wrote:
>
> I have a rough feeling what it is, but I didn't have cycles to work on
> it yet (due to travel, sorry about that). The issue is likely shut down
> by just doing:
>
> ---
> arch/x86/Kconfig |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux.orig/arch/x86/Kconfig    2017-03-03 03:44:35.962022996 +0800
> +++ linux/arch/x86/Kconfig    2017-03-03 03:44:35.962022996 +0800
> @@ -54,7 +54,7 @@ config X86
>      select ARCH_HAS_KCOV            if X86_64
>      select ARCH_HAS_MMIO_FLUSH
>      select ARCH_HAS_PMEM_API        if X86_64
> -    select ARCH_HAS_SET_MEMORY
> +    select ARCH_HAS_SET_MEMORY        if X86_64
>      select ARCH_HAS_SG_CHAIN
>      select ARCH_HAS_STRICT_KERNEL_RWX
>      select ARCH_HAS_STRICT_MODULE_RWX


--===============1500125110015693538==--

