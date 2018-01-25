Content-Type: multipart/mixed; boundary="===============4635374955376759269=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp-robot] [sched/deadline] e0367b1267: WARNING:at_kernel/sched/sched.h:#assert_clock_updated
Date: Thu, 25 Jan 2018 14:35:51 +0100
Message-ID: <20180125133551.GB19878@rei.lan>
In-Reply-To: <20180125132906.GA10968@localhost.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============4635374955376759269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> > > Hummm, wondering how LTP sched tests could trigger this, since a quick
> > > grep into ltp didn't show DEADLINE usage.
> > =

> > See kernel/syscalls/sched_setattr/sched_setattr01.c
> =

> Right, saw that. I was still thinking though why the report seemed to
> point to sched, and not syscalls, tests.

These collections of tests have sometimes non empty intersections. In
this case the particular test is both part of the sched and syscall
testruns (grep sched_setattr01 runtest/*). So I suppose that the test
fails both in the sched and syscall run but the sched one was simply
picked first here.

> Thanks for pointing this out.

Glad to help :-).

-- =

Cyril Hrubis
chrubis(a)suse.cz

--===============4635374955376759269==--

