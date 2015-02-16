Content-Type: multipart/mixed; boundary="===============5759142151896836002=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/deadline] kernel BUG at kernel/sched/deadline.c:805!
Date: Mon, 16 Feb 2015 15:44:12 +0100
Message-ID: <20150216144412.GS24151@twins.programming.kicks-ass.net>
In-Reply-To: <20150216130821.GB5029@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5759142151896836002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 02:08:21PM +0100, Peter Zijlstra wrote:
> On Mon, Feb 16, 2015 at 03:38:34PM +0300, Kirill Tkhai wrote:
> > We shouldn't enqueue migrating tasks. Please, try this one instead ;)
> =

> Ha, we should amend that task-rq-lock loop for that. See below.
> =

> I've not yet tested; going to try and reconstruct a .config that
> triggers the oops.

OK, I had to remove -enable-kvm from Wu's script, otherwise the test
would not hit the CBS limit, and then I had to remove the panic on
softlockup because well, qemu is so slow you're going to hit that :-)

But the good news is that I could reproduce and this patch does indeed
seem to solve it.

--===============5759142151896836002==--

