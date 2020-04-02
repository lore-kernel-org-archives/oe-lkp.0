Content-Type: multipart/mixed; boundary="===============7897621885142095086=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: de8f5e4f2d ("lockdep: Introduce wait-type checks"): [ 17.344674] EIP: default_idle
Date: Thu, 02 Apr 2020 11:40:52 +0200
Message-ID: <87h7y2ns2j.fsf@nanos.tec.linutronix.de>
In-Reply-To: <20200402081732.GM8179@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7897621885142095086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> writes:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit de8f5e4f2dc1f032b46afda0a78cab5456974f89
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Sat Mar 21 12:26:01 2020 +0100
> Commit:     Peter Zijlstra <peterz@infradead.org>
> CommitDate: Sat Mar 21 16:00:24 2020 +0100
>
>     lockdep: Introduce wait-type checks

Can you please avoid enabling

> CONFIG_PROVE_RAW_LOCK_NESTING=3Dy

for now?

As the changelog states, there are known issues and that's why the
config is default=3Dn.

Thanks,

        tglx
--===============7897621885142095086==--

