Content-Type: multipart/mixed; boundary="===============4391027862598281948=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Fri, 09 Dec 2016 06:36:32 +0100
Message-ID: <20161209053632.GE3061@worktop.programming.kicks-ass.net>
In-Reply-To: <87d1h13k1v.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4391027862598281948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2016 at 10:36:44AM +0800, Huang, Ying wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> =

> > On Thu, Dec 08, 2016 at 04:39:10PM +0800, Huang, Ying wrote:
> >
> >> >> in testcase: aim7
> >> >> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 4 -m=
 5G
> >
> > One more question, what does the host system look like? Does that have 4
> > CPUs as well?
> =

> Yes.  The host system have 4 CPUs.

Thanks!

Ok, I eventually managed to reproduce and posted patches here:

  https://lkml.kernel.org/r/20161208154213.952687487(a)infradead.org

There were a bunch of factors that made it very hard for me to reproduce
this particular bug; the first being that I suck at virt stuff and I
couldn't get KVM to work on my usually dev box _at_all_.

I eventually managed to get KVM running on a HSW-EX :-)

Now, I also assumed (never assume) that it was the overloaded vcpu
scenario that was affected, because, well that's what the patches
attempt to 'fix'.

Playing with various setups of overload didn't in fact show regressions.

I also tried non-overloaded scenarios, but those didn't show the
regression! Until I ensured that all vCPUs were confined to a single
node -- so much for running things on a 4 node, 144 cpu system :-)


In any case, thanks for all the effort!

--===============4391027862598281948==--

