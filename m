Content-Type: multipart/mixed; boundary="===============4271925049616114247=="
MIME-Version: 1.0
From: Juri Lelli <juri.lelli@redhat.com>
To: lkp@lists.01.org
Subject: Re: [LTP] [lkp-robot] [sched/deadline] e0367b1267: WARNING:at_kernel/sched/sched.h:#assert_clock_updated
Date: Thu, 25 Jan 2018 14:29:06 +0100
Message-ID: <20180125132906.GA10968@localhost.localdomain>
In-Reply-To: <20180125122458.GB3420@rei>
List-Id: <oe-lkp.lists.linux.dev>

--===============4271925049616114247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 25/01/18 13:24, Cyril Hrubis wrote:
> Hi!
> > Hummm, wondering how LTP sched tests could trigger this, since a quick
> > grep into ltp didn't show DEADLINE usage.
> =

> See kernel/syscalls/sched_setattr/sched_setattr01.c

Right, saw that. I was still thinking though why the report seemed to
point to sched, and not syscalls, tests.

Thanks for pointing this out.

Best,

- Juri

--===============4271925049616114247==--

