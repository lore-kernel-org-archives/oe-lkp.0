Content-Type: multipart/mixed; boundary="===============2832490086891191567=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 11:20:52 +0200
Message-ID: <20171004092052.ioixdexrsbbwvetr@hirez.programming.kicks-ass.net>
In-Reply-To: <20171003171824.te5cxms2hq634tvi@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2832490086891191567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 07:18:24PM +0200, Ingo Molnar wrote:
> Yes, I'll do that tomorrow. I was always a bit unhappy about cross-releas=
e,
> because it breaks the 'owner task owns the lock' model.

Still, you can get real deadlocks with completions...

> Plus I don't think we found that many real bugs with it

Every bug found is one less bug. It did find a few.


--===============2832490086891191567==--

