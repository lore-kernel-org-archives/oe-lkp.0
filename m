Content-Type: multipart/mixed; boundary="===============3940231921492302048=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Fri, 27 Oct 2017 21:24:17 +0200
Message-ID: <20171027192417.d2x4cy6ra7fghjzw@gmail.com>
In-Reply-To: <CAOJUGyfZxbhyMuh3zE77R3b30RF3Xi7jB4_mmSjhWtFQhVc5jQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3940231921492302048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Craig Bergstrom <craigb@google.com> wrote:

> Reverting seems like the right approach at the moment.  My apologies
> for the breakage so late the in the cycle.

Note that there's no need for you to apologize and you carry exactly zero a=
mount =

of blame for the late-cycle breakage: it was my decision to send it to Linu=
s so =

quickly, you never asked for it to be sent upstream on such a short notice.

( Classic "patch makes sense, looks good, other arches ar doing this too, a=
nd I =

  tested it myself too on multiple systems, so it must be obviously fine fo=
r =

  everyone" moment. )

Your change still makes sense from a robustness POV, so please send it agai=
n with =

the suggested fixes - and I'll be more careful with the upstream merge this=
 time.

Thanks,

	Ingo

--===============3940231921492302048==--

