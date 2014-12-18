Content-Type: multipart/mixed; boundary="===============2098620442853300511=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] tick/powerclamp: Remove tick_nohz_idle abuse
Date: Thu, 18 Dec 2014 22:12:57 +0100
Message-ID: <alpine.DEB.2.11.1412182209010.17382@nanos>
In-Reply-To: <20141218115239.53d17e39@jacob-VirtualBox>
List-Id: <oe-lkp.lists.linux.dev>

--===============2098620442853300511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Dec 2014, Jacob Pan wrote:
> OK I agree, also as I mentioned earlier, Peter already has a patch for
> consolidated idle loop and remove tick_nohz_idle_enter/exit call from
> powerclamp driver. I have been working on a few tweaks to maintain the
> functionality and efficiency with the consolidated idle loop.
> We can apply the patches on top of yours.

No. This is equally wrong as I pointed out before. The 'unified' idle
loop is still fake and just pretending to be idle.

If simple standard interfaces like cpu_idle() are not working from
idle code anymore then this simply stinks. And that's what any fake
idle thread will do.

The whole approach is wrong. Implement a sched fair throttler and you
can avoid the whoile trainwreck.
 =

> > 1. Queue a deferable periodic timer whose handler checks if idle
> > needs to be injected. If so, it sets rq->need_throttle for the cpu.
> > If its already in the fake idle period, it clears rq->need_throttle
> > and sets need_resched.
> > =

> The key to powerclamp driver is to achieve package level idle
> states, which implies synchronized idle injection. From
> power/performance standpoint, only package level idle states is worth
> injection.

Then use a synchronized non deferrable timer on all cpus. It's simple
enough.
 =

Thanks,

	tglx

--===============2098620442853300511==--

