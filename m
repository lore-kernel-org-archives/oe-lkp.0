Content-Type: multipart/mixed; boundary="===============7046275513342569962=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [do_execve] attempted to set unsupported pgprot
Date: Wed, 18 Apr 2018 12:59:16 -0700
Message-ID: <20180418125916.a8be1fac1ac017f41a10f0fb@linux-foundation.org>
In-Reply-To: <20180418135933.t3dyszi2phhsvaah@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7046275513342569962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Apr 2018 21:59:33 +0800 Fengguang Wu <fengguang.wu@intel.com> =
wrote:

> Hello,
> =

> FYI this happens in mainline kernel 4.17.0-rc1.
> It looks like a new regression.
> =

> It occurs in 4 out of 4 boots.
> =

> [   12.345562] Write protecting the kernel text: 14376k
> [   12.346649] Write protecting the kernel read-only data: 4740k
> [   12.347584] rodata_test: all tests were successful
> [   12.348499] ------------[ cut here ]------------
> [   12.349193] attempted to set unsupported pgprot: 8000000000000025 bits=
: 8000000000000000 supported: 7fffffffffffffff
> [   12.350792] WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/pgtable.h:5=
40 handle_mm_fault+0xfc1/0xfe0:
> 						check_pgprot at arch/x86/include/asm/pgtable.h:535
> 						 (inlined by) pfn_pte at arch/x86/include/asm/pgtable.h:549
> 						 (inlined by) do_anonymous_page at mm/memory.c:3169
> 						 (inlined by) handle_pte_fault at mm/memory.c:3961
> 						 (inlined by) __handle_mm_fault at mm/memory.c:4087
> 						 (inlined by) handle_mm_fault at mm/memory.c:4124
> [   12.352294] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.17.0-rc1 #172
> [   12.353357] EIP: handle_mm_fault+0xfc1/0xfe0:
> 						check_pgprot at arch/x86/include/asm/pgtable.h:535
> 						 (inlined by) pfn_pte at arch/x86/include/asm/pgtable.h:549
> 						 (inlined by) do_anonymous_page at mm/memory.c:3169
> 						 (inlined by) handle_pte_fault at mm/memory.c:3961
> 						 (inlined by) __handle_mm_fault at mm/memory.c:4087
> 						 (inlined by) handle_mm_fault at mm/memory.c:4124

Dave, fb43d6cb91ef57 ("x86/mm: Do not auto-massage page protections")
looks like a culprit?


--===============7046275513342569962==--

