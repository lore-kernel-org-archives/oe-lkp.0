Content-Type: multipart/mixed; boundary="===============8424316593997403914=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 9c5743dff4: WARNING:at_arch/x86/mm/extable.c:#ex_handler_fprestore
Date: Sun, 15 May 2022 16:54:47 +0200
Message-ID: <87pmkerglk.ffs@tglx>
In-Reply-To: <8735hbryn6.ffs@tglx>
List-Id: <oe-lkp.lists.linux.dev>

--===============8424316593997403914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 15 2022 at 10:25, Thomas Gleixner wrote:
> On Fri, May 13 2022 at 09:52, Linus Torvalds wrote:
> The code which copies the ptrace supplied state has a pile of sanity
> checks to catch invalid state, but I wouldn't bet my hat on it that it's
> 100% complete. We can be more defensive here, but I would be surprised.
>
> Something like the untested below. I'll expose it to some testing to see
> what explodes.

I was not able to get something broken past the existing sanity checks
which was caught by the trial restore. I seems the FPU units are pretty
resilent against random nonsense except for the XSTATE header and the
MXCRS content. Though I ponder to just add that trial restore due to
paranoia.

Thanks,

        tglx
--===============8424316593997403914==--

