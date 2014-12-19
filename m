Content-Type: multipart/mixed; boundary="===============8726296140374964495=="
MIME-Version: 1.0
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] tick/powerclamp: Remove tick_nohz_idle abuse
Date: Fri, 19 Dec 2014 10:39:00 -0800
Message-ID: <20141219103900.101f6c6d@jacob-VirtualBox>
In-Reply-To: <alpine.DEB.2.11.1412182209010.17382@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============8726296140374964495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Dec 2014 22:12:57 +0100 (CET)
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Thu, 18 Dec 2014, Jacob Pan wrote:
> > OK I agree, also as I mentioned earlier, Peter already has a patch
> > for consolidated idle loop and remove tick_nohz_idle_enter/exit
> > call from powerclamp driver. I have been working on a few tweaks to
> > maintain the functionality and efficiency with the consolidated
> > idle loop. We can apply the patches on top of yours.
> =

> No. This is equally wrong as I pointed out before. The 'unified' idle
> loop is still fake and just pretending to be idle.
> =

In terms of efficiency, the consolidated idle loop will allow turning
off sched tick during idle injection period. If we just take out the
tick_nohz_idle_xxx call, the effectiveness of powerclamp is going down
significantly. I am not arguing the design but from fixing regression
perspective or short term solution.
> If simple standard interfaces like cpu_idle() are not working from
> idle code anymore then this simply stinks. And that's what any fake
> idle thread will do.
> =

> The whole approach is wrong. Implement a sched fair throttler and you
> can avoid the whoile trainwreck.
>
I agree with you that fake idle always have dilemma. on one
side, idle injection threads are really busy injecting idle, so from
that standpoint it is not idle. But on the other side, we have to stop
tick to avoid being woken up all the time. So we can't just simply take
control of the cpu periodically and execute mwait.
I need to do some study here, thanks for the pointers,

Jacob

> > > 1. Queue a deferable periodic timer whose handler checks if idle
> > > needs to be injected. If so, it sets rq->need_throttle for the
> > > cpu. If its already in the fake idle period, it clears
> > > rq->need_throttle and sets need_resched.
> > > =

> > The key to powerclamp driver is to achieve package level idle
> > states, which implies synchronized idle injection. From
> > power/performance standpoint, only package level idle states is
> > worth injection.
> =

> Then use a synchronized non deferrable timer on all cpus. It's simple
> enough.
>  =

> Thanks,
> =

> 	tglx

[Jacob Pan]

--===============8726296140374964495==--

