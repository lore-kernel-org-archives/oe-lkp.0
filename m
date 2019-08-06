Content-Type: multipart/mixed; boundary="===============1616995608061073443=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 755d6edc1a: will-it-scale.per_process_ops -4.1% regression
Date: Tue, 06 Aug 2019 10:04:15 +0200
Message-ID: <20190806080415.GG11812@dhcp22.suse.cz>
In-Reply-To: <20190806070547.GA10123@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1616995608061073443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 06-08-19 15:05:47, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -4.1% regression of will-it-scale.per_process_ops due t=
o commit:

I have to confess I cannot make much sense from numbers because they
seem to be too volatile and the main contributor doesn't stand up for
me. Anyway, regressions on microbenchmarks like this are not all that
surprising when a locking is slightly changed and the critical section
made shorter. I have seen that in the past already.

That being said I would still love to get to bottom of this bug rather
than play with the lock duration by a magic. In other words
http://lkml.kernel.org/r/20190730125751.GS9330(a)dhcp22.suse.cz
-- =

Michal Hocko
SUSE Labs

--===============1616995608061073443==--

