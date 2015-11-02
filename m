Content-Type: multipart/mixed; boundary="===============6726534406071272155=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/context_tracking] db23da8b95: inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
Date: Mon, 02 Nov 2015 20:25:47 +0800
Message-ID: <20151102122547.GA11302@wfg-t540p.sh.intel.com>
In-Reply-To: <563754C8.5060202@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6726534406071272155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

Never mind, it just takes 2 minutes for me. :)

Thanks,
Fengguang

On Mon, Nov 02, 2015 at 01:19:20PM +0100, Paolo Bonzini wrote:
> Hi Fengguang,
> =

> this patch is not ready, and is left for 4.5; see Andy's comment at
> http://permalink.gmane.org/gmane.linux.kernel/2072877.  Only the other
> two are.
> =

> I'm sorry for the inconvenience.
> =

> Thanks,
> =

> Paolo
> =

> On 02/11/2015 13:11, Fengguang Wu wrote:
> > Hi Paolo,
> > =

> > FYI, here is another bisect result.
> > =

> > https://github.com/0day-ci/linux Paolo-Bonzini/context_tracking-remove-=
duplicate-enabled-check/20151028-094317
> > =

> > commit db23da8b95ece9b57d4cfd63f5ee10502f1af0c8
> > Author:     Paolo Bonzini <pbonzini@redhat.com>
> > AuthorDate: Wed Oct 28 02:39:57 2015 +0100
> > Commit:     0day robot <fengguang.wu@intel.com>
> > CommitDate: Wed Oct 28 09:43:20 2015 +0800
> > =

> >     x86: context_tracking: avoid irq_save/irq_restore on kernel entry a=
nd exit
> >     =

> >     x86 always calls user_enter and user_exit with interrupt disabled.
> >     Therefore, it is not necessary to check for exceptions, nor to
> >     save/restore the IRQ state, when context tracking functions are
> >     called by guest_enter and guest_exit.
> >     =

> >     Use the previously introduced __context_tracking_entry and
> >     __context_tracking_exit.
> >     =

> >     Cc: Andy Lutomirski <luto@kernel.org>
> >     Cc: Frederic Weisbecker <fweisbec@gmail.com>
> >     Cc: Rik van Riel <riel@redhat.com>
> >     Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>
> >     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============6726534406071272155==--

