Content-Type: multipart/mixed; boundary="===============2427834991090818202=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Thu, 01 Dec 2016 08:21:58 +0100
Message-ID: <20161201072158.GF3124@twins.programming.kicks-ass.net>
In-Reply-To: <20161130231758.GB18574@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2427834991090818202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2016 at 07:17:58AM +0800, Ye Xiaolong wrote:
> On 12/01, Peter Zijlstra wrote:
> >On Thu, Dec 01, 2016 at 02:07:29AM +0800, kernel test robot wrote:
> >> =

> >> Greeting,
> >> =

> >> FYI, we noticed a -26.1% regression of aim7.jobs-per-min due to commit:
> >> =

> >> =

> >> commit: fd6f48529f4067c6bfbead88d3d7d117d51150f6 ("x86,paravirt: Optim=
ize native pv_lock_ops.vcpu_is_preempted")
> >> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locki=
ng/core
> >> =

> >
> >> =

> >> 8ba24710fb279053  fd6f48529f4067c6bfbead88d3  =

> >
> >So that really is against its parent..
> >
> >Does something like so fix it?
> =

> I'll queue the test job for below patch and provide the result later.

Much appreciated!

--===============2427834991090818202==--

