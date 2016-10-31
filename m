Content-Type: multipart/mixed; boundary="===============5429216924045072755=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/platform/UV] 71854cb812: will-it-scale.per_thread_ops -2.3% regression
Date: Mon, 31 Oct 2016 12:19:16 -0600
Message-ID: <alpine.DEB.2.20.1610311216520.10522@nanos>
In-Reply-To: <20161031054101.b27mjyr46b3r2tbp@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5429216924045072755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Oct 2016, Fengguang Wu wrote:
> On Fri, Oct 28, 2016 at 12:37:45AM +0200, Thomas Gleixner wrote:
> > I have no explanation for this either, but you really should try to fig=
ure
> > out what's going on here.
> =

> Xiaolong, how about doing a small debug patch (a WARN_ONCE() line may
> be enough) to verify whether the code path is executed?
> =

> It'd also help to compare vmlinux according to Thomas' reasoning:
> =

> > The only difference between plain rc1 and rc + this patch is the result=
ing
> > text size and therefor some other unrelated stuff moving to different
> > places in memory which has some yet to figure out side effects.

So one other thing you might try is using rc3 as a base line and then
revert the patch in question on top of rc3 and see whether that weird
behaviour persists.
 =

> > From bisect POV, the below graphs show the user_time and system_time
> are clearly and consistently different before/after commit 71854cb812.
> So this commit must impacted something.

I agree. I just have no idea what happens.

Thanks,

	tglx

--===============5429216924045072755==--

