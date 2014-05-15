Content-Type: multipart/mixed; boundary="===============6778693629837923333=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing] b1169cc69ba: +10060.4% proc-vmstat.numa_pte_updates
Date: Thu, 15 May 2014 11:08:55 -0400
Message-ID: <20140515110855.72d04020@gandalf.local.home>
In-Reply-To: <53743D42.3070309@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6778693629837923333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 15 May 2014 12:06:26 +0800
Jet Chen <jet.chen@intel.com> wrote:

> Hi Steven,
> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ftr=
ace/core
> commit b1169cc69ba96b124df820904a6d3eb775491d7f ("tracing: Remove mock up=
 poll wait function")

I have to apologize as I'm not familiar with this benchmark.

> =

> f4874261049e3ab  b1169cc69ba96b124df820904
> ---------------  -------------------------
>        191 ~15%  +10060.4%      19487 ~ 8%  lkp-ne04/dd-write/1HDD-ext4-2=
dd.4k
>        191 ~15%  +10060.4%      19487 ~ 8%  TOTAL proc-vmstat.numa_pte_up=
dates
> =

> f4874261049e3ab  b1169cc69ba96b124df820904
> ---------------  -------------------------
>    2419721 ~ 0%     +88.0%    4549654 ~ 2%  lkp-ws02/dd-write/11HDD-JBOD-=
cfq-xfs-1dd
>    2419721 ~ 0%     +88.0%    4549654 ~ 2%  TOTAL perf-stat.context-switc=
hes
> =

> f4874261049e3ab  b1169cc69ba96b124df820904
> ---------------  -------------------------
>        954 ~ 0%     +52.7%       1457 ~ 0%  lkp-ne04/dd-write/1HDD-ext4-2=
dd.4k
>       3932 ~ 0%     +89.1%       7438 ~ 2%  lkp-ws02/dd-write/11HDD-JBOD-=
cfq-xfs-1dd
>       4887 ~ 0%     +82.0%       8895 ~ 2%  TOTAL vmstat.system.cs
> =

> f4874261049e3ab  b1169cc69ba96b124df820904
> ---------------  -------------------------
>     163477 ~ 0%     +60.1%     261769 ~ 0%  lkp-ws02/dd-write/11HDD-JBOD-=
cfq-xfs-1dd
>     163477 ~ 0%     +60.1%     261769 ~ 0%  TOTAL perf-stat.cpu-migrations
> =

> f4874261049e3ab  b1169cc69ba96b124df820904
> ---------------  -------------------------
>      28742 ~ 0%      +6.4%      30574 ~ 0%  lkp-ws02/dd-write/11HDD-JBOD-=
cfq-xfs-1dd
>      28742 ~ 0%      +6.4%      30574 ~ 0%  TOTAL vmstat.system.in

What exactly is being measured here? What tool is running?

The change removed a brain dead way of blocking on the ring buffer,
which, if there was no data, it would sleep for 100ms and try again,
even if no event happened.

The new way is to act more like a real pipe. That is, if there's no
data, you will block but as soon as data comes in, you are woken and
can read the data. If data is coming in at a steady pace, every read
will wake up more often to get that data. More will happen which is a
good thing as the old way was to wait 100ms and by then, the tracing
could easily overflow the ring buffer.

Perhaps we could add water marks, that is, only wake up if the ring
buffer is partially full.

-- Steve


> =

> =

> Legend:
> 	~XX%    - stddev percent
> 	[+-]XX% - change percent
> =

> 	=

> Thanks,
> Jet
> =

> =



--===============6778693629837923333==--

