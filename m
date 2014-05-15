Content-Type: multipart/mixed; boundary="===============8752935538283140530=="
MIME-Version: 1.0
From: Mike Galbraith <umgwanakikbuti@gmail.com>
To: lkp@lists.01.org
Subject: Re: [cgroup] a0f9ec1f181: -4.3% will-it-scale.per_thread_ops
Date: Thu, 15 May 2014 09:11:17 +0200
Message-ID: <1400137877.5175.147.camel@marge.simpson.net>
In-Reply-To: <20140515061422.GC5539@mtj.dyndns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8752935538283140530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2014-05-15 at 02:14 -0400, Tejun Heo wrote:

> Hmmm... I'm completely stumped.  The commit in question has nothing to
> do with tmpfs.  It only affects three cgroup files - "tasks",
> "cgroup.procs" and "release_agent".  It can't possibly have any effect
> on tmpfs operation.  Maybe random effect through code alignment?  Even
> that is highly unlikely.

Unlikely, but it happens.  I bisected a tbench regression down to a
completely unrelated driver change, and watched it repeatably drop
throughput 5% despite skeptical "No way, show me that trick again".

-Mike


--===============8752935538283140530==--

