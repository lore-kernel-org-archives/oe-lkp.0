Content-Type: multipart/mixed; boundary="===============4175724320817235718=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [locking/lockdep] 383776fa75: INFO: trying to register non-static key.
Date: Sat, 25 Mar 2017 19:13:44 +0100
Message-ID: <20170325181344.46xj4k3xsuq4xxjy@pd.tnic>
In-Reply-To: <20170320114108.kbvcsuepem45j5cr@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4175724320817235718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 12:41:08PM +0100, Peter Zijlstra wrote:
> Subject: lockdep: Fix per-cpu static objects
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Mon Mar 20 12:26:55 CET 2017
> =

> Since commit:
> =

>   383776fa7527 ("locking/lockdep: Handle statically initialized PER_CPU l=
ocks properly")
> =

> we try to collapse per-cpu locks into a single class by giving them
> all the same key. For this key we choose the canonical address of the
> per-cpu object, which would be the offset into the per-cpu area.
> =

> This has two problems:
> =

>  - there is a case where we run !0 lock->key through static_obj() and
>    expect this to pass; it doesn't for canonical pointers.
> =

>  - 0 is a valid canonical address.
> =

> Cure both issues by redefining the canonical address as the address of
> the per-cpu variable on the boot CPU.
> =

> Since I didn't want to rely on CPU0 being the boot-cpu, or even
> existing at all, track the boot CPU in a variable.
> =

> Fixes: 383776fa7527 ("locking/lockdep: Handle statically initialized PER_=
CPU locks properly")
> Reported-by: kernel test robot <fengguang.wu@intel.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Tested-by: Borislav Petkov <bp@suse.de>

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============4175724320817235718==--

