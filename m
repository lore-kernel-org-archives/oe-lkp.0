Content-Type: multipart/mixed; boundary="===============8941541348273175194=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 2a0c112828 WARNING: CPU: 0 PID: 18 at kernel/locking/mutex.c:305 __ww_mutex_wakeup_for_backoff
Date: Wed, 01 Mar 2017 16:11:48 +0000
Message-ID: <20170301161148.GD4740@nuc-i3427.alporthouse.com>
In-Reply-To: <20170301155414.GN6515@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8941541348273175194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 04:54:14PM +0100, Peter Zijlstra wrote:
> On Wed, Mar 01, 2017 at 11:40:43PM +0800, Fengguang Wu wrote:
> > Thanks for the patch! I applied the patch on top of "locking/ww_mutex:
> > Add kselftests for ww_mutex stress", and find no "bad unlock balance
> > detected" but this warning. Attached is the new dmesg which is a bit
> > large due to lots of repeated errors.
> =

> So with all the various patches it works for me.
> =

> I also have the following on top; which I did when I was looking through
> this code trying to figure out wth was happening.
> =

> Chris, does this make sense to you?
> =

> It makes each loop a fully new 'instance', otherwise we'll never update
> the ww_class->stamp and the threads will aways have the same order.

Sounds ok, I just thought the stamp order of the threads was
immaterial - with each test doing a different sequence of locks and each
being identical in behaviour, it would not matter which had priority,
there would have be some shuffling no matter waht. However, for the
purpose of testing, having each iteration be a new locking instance does
make it behaviour more like a typical user.
-Chris

-- =

Chris Wilson, Intel Open Source Technology Centre

--===============8941541348273175194==--

