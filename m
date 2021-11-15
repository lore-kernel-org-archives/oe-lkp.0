Content-Type: multipart/mixed; boundary="===============7904822388460148888=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86/asm] 0507503671: will-it-scale.per_process_ops -4.9% regression
Date: Mon, 15 Nov 2021 21:39:52 +0100
Message-ID: <20211115203952.GO174703@worktop.programming.kicks-ass.net>
In-Reply-To: <7ec02a06-fc3b-0858-cb13-04d25f325795@zytor.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7904822388460148888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 11:20:07AM -0800, H. Peter Anvin wrote:
> [Cc: Peter Z.]
> =

> This seems totally bizarre... that is an *enormous* change, and if I'm
> reading it right it seems like this somehow related to the performance
> monitoring framework itself?
> =

> The lower-performance init code is all pushed into the pre-boot path, unl=
ess
> for some strange reason not all code gets patched e.g. at module loading
> time.
> =

> A quick peek around made me notice a few minor possibilities, but none of
> them look particularly sane:
> =

> 1. We don't use "asm inline" in asm_volatile_goto, and we probably
>    should; otherwise gcc might get the idea this is a more heavyweight
>    operation than it actually is.
> 2. There is a workaround in asm_volatile_goto for a bug which apparently
>    was fixed in gcc 4.8.x that might mislead gcc's code generator into
>    generating worse code.
> =

> Did you see any functions for which the code got *bigger*?

Urgh, that code uses _4_ static_cpu_has(X86_FEATURE_ARCH_LBR) which,
IIRC, GCC can't CSE. I've been asking for CSE on jump-labels for a
while, but that's not actually got me anywhere.

https://lore.kernel.org/all/YG80wg/2iZjXfCDJ(a)hirez.programming.kicks-ass.=
net/?q=3Dstatic_branch%2Fjump_label+vs+branch+merging

Let me see if I can't re-arrange that code differently.
--===============7904822388460148888==--

