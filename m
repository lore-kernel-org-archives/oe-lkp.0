Content-Type: multipart/mixed; boundary="===============7124113542200324184=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/cpufeature] 7b5e74e637: BUG: unable to handle kernel paging request at 6b636170
Date: Wed, 25 May 2016 08:28:15 +0200
Message-ID: <20160525062815.GA31368@gmail.com>
In-Reply-To: <20160524200709.GA9079@codemonkey.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7124113542200324184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Dave Jones <davej@codemonkey.org.uk> wrote:

> On Wed, May 25, 2016 at 03:58:10AM +0800, kernel test robot wrote:
>  =

>  > 0day kernel testing robot got the below dmesg and the first bad commit=
 is
>  > =

>  > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mas=
ter
>  > =

>  > commit 7b5e74e637e4a977c7cf40fd7de332f60b68180e
>  > Author:     Borislav Petkov <bp@suse.de>
>  > AuthorDate: Tue Mar 29 17:41:54 2016 +0200
>  > Commit:     Ingo Molnar <mingo@kernel.org>
>  > CommitDate: Thu Mar 31 13:33:17 2016 +0200
>  > =

>  >     x86/cpufeature: Remove cpu_has_arch_perfmon
>  >     =

>  >     Use boot_cpu_has() instead.
> =

> This seem an unlikely candidate given...
> =

>  > [    1.914984] random: trinity urandom read with 25 bits of entropy av=
ailable
>  > [    8.542178] random: nonblocking pool is initialized
>  > [   11.939833] sock: process `trinity-main' is using obsolete setsocko=
pt SO_BSDCOMPAT
>  > [   12.349890] BUG: unable to handle kernel paging request at 6b636170
>  > [   12.349895] IP: [<c108154b>] perf_prepare_sample+0x7d/0x263
> =

> The trace is more related to perf.

Also, 7b5e74e637e4a appears to be pretty much a provable NOP, it should not=
 change =

a single byte in the kernel image, as it replaces a macro use:

-#define cpu_has_arch_perfmon   boot_cpu_has(X86_FEATURE_ARCH_PERFMON)

... with open-coded expressions of the same.

Thanks,

	Ingo

--===============7124113542200324184==--

