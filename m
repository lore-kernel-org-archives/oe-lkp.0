Content-Type: multipart/mixed; boundary="===============3790473751426146285=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 53d3bc773e: hackbench.throughput -32.9% regression
Date: Thu, 02 Jun 2016 08:28:14 +0800
Message-ID: <87pos0igdd.fsf@yhuang-dev.intel.com>
In-Reply-To: <1464774513.4023.78.camel@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3790473751426146285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mike Galbraith <umgwanakikbuti@gmail.com> writes:

> On Wed, 2016-06-01 at 16:53 +0800, Huang, Ying wrote:
>
>> You mean the commit is a functionality fix?
>
> Yup.
>
> These kind of things can be a bit annoying.  The fix to not subtract
> load that we never added in the first place also pushed hackbench
> around a bit.  Do anything at all with load_avg, you're gonna push
> this/that benchmark around a bit, and folks who watch numbers closely
> can end up chasing meaningless deltas.

If this report annoyed you, I am sorry about that.  We just want to be
helpful via providing some information.  Now I know hackbench is
sensitive to load_avg changes, thanks a lot for the information.

Best Regards,
Huang, Ying

--===============3790473751426146285==--

