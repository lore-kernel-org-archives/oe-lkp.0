Content-Type: multipart/mixed; boundary="===============5664250140687489538=="
MIME-Version: 1.0
From: Jiri Kosina <jkosina@suse.cz>
To: lkp@lists.01.org
Subject: Re: [workqueue] WARNING: CPU: 0 PID: 76 at drivers/block/floppy.c:968 schedule_bh()
Date: Fri, 11 Jul 2014 15:27:34 +0200
Message-ID: <alpine.LNX.2.00.1407111526430.8779@pobox.suse.cz>
In-Reply-To: <alpine.LNX.2.00.1407081656290.1655@pobox.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5664250140687489538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2014, Jiri Kosina wrote:

> > > Hmmm... this is schedule_bh() in floppy.c complaining that the work
> > > item is already pending.  The cond_resched() addition by b22ce2785d97
> > > doesn't change the semantics around work item execution although it
> > > could have exposed an existing problem in the floppy driver.  I'll
> > > look into how this could happen.
> > =

> > It doesn't reproduce here and nothing really stands out to me.  It
> > probably involves floppy_work requeueing itself and something else
> > getting executed inbetween which wouldn't have happend before, but I
> > can't figure out what that could be and either can I follow the
> > control flow the driver. :)
> >
> > =

> > Jiri, any ideas?
> =

> I will take a look. Could this be a bad bisect though due to this actuall=
y =

> being a race condition perhaps?

Fengguang, is it possible for you to confirm the bisection result (i.e. =

revert the patch and check)?

I am having hard time seeing how it could cause this (and I am not able to =

reproduce the problem myself).

Thanks,

-- =

Jiri Kosina
SUSE Labs

--===============5664250140687489538==--

