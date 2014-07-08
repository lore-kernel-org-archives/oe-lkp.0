Content-Type: multipart/mixed; boundary="===============8689162832264475199=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [workqueue] WARNING: CPU: 0 PID: 76 at drivers/block/floppy.c:968 schedule_bh()
Date: Tue, 08 Jul 2014 10:46:32 -0400
Message-ID: <20140708144632.GF4979@htj.dyndns.org>
In-Reply-To: <20140708140430.GE4979@htj.dyndns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8689162832264475199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 10:04:30AM -0400, Tejun Heo wrote:
...
> Hmmm... this is schedule_bh() in floppy.c complaining that the work
> item is already pending.  The cond_resched() addition by b22ce2785d97
> doesn't change the semantics around work item execution although it
> could have exposed an existing problem in the floppy driver.  I'll
> look into how this could happen.

It doesn't reproduce here and nothing really stands out to me.  It
probably involves floppy_work requeueing itself and something else
getting executed inbetween which wouldn't have happend before, but I
can't figure out what that could be and either can I follow the
control flow the driver. :)

Jiri, any ideas?

Thanks.

-- =

tejun

--===============8689162832264475199==--

