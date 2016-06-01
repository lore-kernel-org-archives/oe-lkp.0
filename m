Content-Type: multipart/mixed; boundary="===============7080786886599883037=="
MIME-Version: 1.0
From: Mike Galbraith <umgwanakikbuti@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 53d3bc773e: hackbench.throughput -32.9% regression
Date: Wed, 01 Jun 2016 11:48:33 +0200
Message-ID: <1464774513.4023.78.camel@gmail.com>
In-Reply-To: <87inxtjnnb.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7080786886599883037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-01 at 16:53 +0800, Huang, Ying wrote:

> You mean the commit is a functionality fix?

Yup.

These kind of things can be a bit annoying.  The fix to not subtract
load that we never added in the first place also pushed hackbench
around a bit.  Do anything at all with load_avg, you're gonna push
this/that benchmark around a bit, and folks who watch numbers closely
can end up chasing meaningless deltas.

	-Mike

--===============7080786886599883037==--

