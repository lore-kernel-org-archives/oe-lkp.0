Content-Type: multipart/mixed; boundary="===============8526076739015394144=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [net] a6211caa63: dmesg.UBSAN:signed-integer-overflow_in_arch/x86/include/asm/atomic.h
Date: Fri, 05 Jun 2020 16:05:21 +0200
Message-ID: <20200605140521.GD4117@hirez.programming.kicks-ass.net>
In-Reply-To: <CANn89iK1EfAqw-SkXyQR=88fKnBpXCcR_FaiFkVDUNazNgAX1g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8526076739015394144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2020 at 06:17:51AM -0700, Eric Dumazet wrote:
> On Fri, Jun 5, 2020 at 1:10 AM kernel test robot <rong.a.chen@intel.com=
> wrote:

> There you go.
> =

> We decided this was a bogus report, and that UBSAN requires sane compiler=
s.
> =

> Please read the fine comment that was added in this commit and update
> your compiler or do not mess with compiler flags.
> =

> +       /* If UBSAN reports an error there, please make sure your compiler
> +        * supports -fno-strict-overflow before reporting it that was a b=
ug
> +        * in UBSAN, and it has been fixed in GCC-8.
> +        */
> +       return atomic_add_return(segs + delta, p_id) - segs;

> >         make HOSTCC=3Dgcc-4.9 CC=3Dgcc-4.9 ARCH=3Di386 olddefconfig pre=
pare modules_prepare bzImage

Rong, can you make sure to exclude gcc<8 for UBSAN reports ?
--===============8526076739015394144==--

