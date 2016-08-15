Content-Type: multipart/mixed; boundary="===============4995178171928607085=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 19:53:40 -0700
Message-ID: <CA+55aFxbLsD_btd0qXpuxTqAB5OQF1O+v7-OMgj8ftBE4Qd7WA@mail.gmail.com>
In-Reply-To: <20160815022808.GX19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============4995178171928607085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 7:28 PM, Dave Chinner <david@fromorbit.com> wrote:
>>
>> Maybe your symbol table came from a old kernel, and functions moved
>> around enough that the profile attributions ended up bogus.
>
> No, I don't think so. I don't install symbol tables on my test VMs,
> I let /proc/kallsyms do that work for me. From an strace of 'perf
> top -U -g":

Ok. But something is definitely wrong with your profile.

What does it say if you annotate that _raw_spin_unlock_irqrestore() functio=
n?

I guarantee you that no, it's not spending 41% of time in
spin_unlock_irqrestore. That just isn't a valid profile. There's
something seriously wrong somewhere.

The fact that you then get the same profile when you turn _off_
CONFIG_DEBUG_SPINLOCK only proves there is something going on that is
pure garbage.

I suspect that what you did was to edit the .config file, remove
DEBUG_SPINLOCK, and then do "make oldconfig" again.

And it got turned on again, because you have one of the lock debugging
options on that force spinlock debuggin on again:

 - DEBUG_WW_MUTEX_SLOWPATH
 - DEBUG_LOCK_ALLOC
 - PROVE_LOCKING

all of which would make any profiles entirely pointless.

[ Light goes on ]

Oh, no, I can see another possibility: you're not doing proper CPU
profiles, you're doing some timer-irq profile, and the reason you get
41% on spin_unlock_irq_restore() is that that is where the interrupts
are enabled again.

Timer-interrupt based profiles are not useful either.

Make sure you actually use "perf record -e cycles:pp" or something
that uses PEBS to get real profiles using CPU performance counters.

Because right now the profile data is worthless.

            Linus

--===============4995178171928607085==--

