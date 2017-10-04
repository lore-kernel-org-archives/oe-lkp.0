Content-Type: multipart/mixed; boundary="===============5686479908468712561=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 12:31:19 +0200
Message-ID: <20171004103119.sedmwqcfwu3ze5od@gmail.com>
In-Reply-To: <20171004092052.ioixdexrsbbwvetr@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5686479908468712561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Oct 03, 2017 at 07:18:24PM +0200, Ingo Molnar wrote:
> > Yes, I'll do that tomorrow. I was always a bit unhappy about cross-rele=
ase,
> > because it breaks the 'owner task owns the lock' model.
> =

> Still, you can get real deadlocks with completions...
> =

> > Plus I don't think we found that many real bugs with it
> =

> Every bug found is one less bug. It did find a few.

Certainly, but the total work saved by finding bugs should be balanced agai=
nst the =

additional fragility of lockdep and the ongoing maintenance cost.

Thanks,

	Ingo

--===============5686479908468712561==--

