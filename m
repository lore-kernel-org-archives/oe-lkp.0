Content-Type: multipart/mixed; boundary="===============6854495334646440144=="
MIME-Version: 1.0
From: Jiri Kosina <jkosina@suse.cz>
To: lkp@lists.01.org
Subject: Re: [workqueue] WARNING: CPU: 0 PID: 76 at drivers/block/floppy.c:968 schedule_bh()
Date: Tue, 08 Jul 2014 16:56:57 +0200
Message-ID: <alpine.LNX.2.00.1407081656290.1655@pobox.suse.cz>
In-Reply-To: <20140708144632.GF4979@htj.dyndns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6854495334646440144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2014, Tejun Heo wrote:

> > Hmmm... this is schedule_bh() in floppy.c complaining that the work
> > item is already pending.  The cond_resched() addition by b22ce2785d97
> > doesn't change the semantics around work item execution although it
> > could have exposed an existing problem in the floppy driver.  I'll
> > look into how this could happen.
> =

> It doesn't reproduce here and nothing really stands out to me.  It
> probably involves floppy_work requeueing itself and something else
> getting executed inbetween which wouldn't have happend before, but I
> can't figure out what that could be and either can I follow the
> control flow the driver. :)
>
> =

> Jiri, any ideas?

I will take a look. Could this be a bad bisect though due to this actually =

being a race condition perhaps?

-- =

Jiri Kosina
SUSE Labs

--===============6854495334646440144==--

