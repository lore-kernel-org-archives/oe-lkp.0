Content-Type: multipart/mixed; boundary="===============8606434183797870437=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf] BUG: unable to handle kernel NULL pointer dereference at 00000085
Date: Tue, 07 Oct 2014 10:17:32 +0200
Message-ID: <20141007081732.GF19379@twins.programming.kicks-ass.net>
In-Reply-To: <20141007050348.GB17972@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8606434183797870437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 01:03:48PM +0800, Fengguang Wu wrote:
> > What is lacking is the actual .config.
> =

> Sorry, attached the .config. I expected the script to auto attach it,
> but obviously it's not yet perfect and failed to attach .config in
> this case.

Sure no problem, just figured I'd tell you.

> > Also the times above (~285 seconds) seem to suggest userspace needs to
> > do something ?
> =

> It's trinity. I'll try upgrade it, but it seems be valid for trinity
> to feed kernel with any parameters that it can accept -- unless the
> kernel completely rejects it one day.

OK, does it make sense to augment that script you have with a trinity
parameter? Maybe have that userspace read the kernel cmdline and also
run trinity when observed?

That way you can provide full reproduction environments, which it
appears you're striving towards.



--===============8606434183797870437==--

