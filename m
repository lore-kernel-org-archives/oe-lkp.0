Content-Type: multipart/mixed; boundary="===============9196355560915601127=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf] BUG: unable to handle kernel NULL pointer dereference at 00000085
Date: Tue, 07 Oct 2014 16:40:44 +0800
Message-ID: <20141007084044.GA12300@wfg-t540p.sh.intel.com>
In-Reply-To: <20141007081732.GF19379@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============9196355560915601127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 10:17:32AM +0200, Peter Zijlstra wrote:
> On Tue, Oct 07, 2014 at 01:03:48PM +0800, Fengguang Wu wrote:
> > > What is lacking is the actual .config.
> > =

> > Sorry, attached the .config. I expected the script to auto attach it,
> > but obviously it's not yet perfect and failed to attach .config in
> > this case.
> =

> Sure no problem, just figured I'd tell you.
> =

> > > Also the times above (~285 seconds) seem to suggest userspace needs to
> > > do something ?
> > =

> > It's trinity. I'll try upgrade it, but it seems be valid for trinity
> > to feed kernel with any parameters that it can accept -- unless the
> > kernel completely rejects it one day.
> =

> OK, does it make sense to augment that script you have with a trinity
> parameter? Maybe have that userspace read the kernel cmdline and also
> run trinity when observed?  That way you can provide full
> reproduction environments, which it appears you're striving towards.

The trinity binary is included in the initrd image that it downloads,
and will auto run after boot up. I also plan to add trinity as a LKP
test case. :)

Thanks,
Fengguang

--===============9196355560915601127==--

