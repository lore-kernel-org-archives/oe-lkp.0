Content-Type: multipart/mixed; boundary="===============8642998028069534759=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [delayed_fput] BUG: unable to handle kernel paging request at ffff8800122a0ad0
Date: Thu, 31 Jul 2014 10:40:14 +0800
Message-ID: <20140731024014.GA10184@localhost>
In-Reply-To: <CAADnVQ+OwgG-RJQ7QwfW2qrvpV9XYySckTbNmcacW7K0KxQqvA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8642998028069534759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 04:00:58PM -0700, Alexei Starovoitov wrote:
> On Wed, Jul 30, 2014 at 3:51 PM, David Rientjes <rientjes@google.com> w=
rote:
> > On Wed, 30 Jul 2014, Christoph Hellwig wrote:
> >
> >> On Wed, Jul 30, 2014 at 11:55:41AM +0800, Fengguang Wu wrote:
> >> > Greetings,
> >> >
> >> > 0day kernel testing robot got the below dmesg and the first bad comm=
it is
> >>
> >> How does this manage to trip over a 2 year old commit now?
> =

> may be because all kernels are built with gcc 4.8.2 ?
> Fengguang, did you recently switch to new compiler?
> I think all older builds were with 4.6.3

Alexei, I've been using gcc 4.8.2 for 4 months.

Maybe it's because I test new randconfigs every day. And the problem
may only show up with very specific kernel config?

Thanks,
Fengguang

> > I think there's something weird going on with the testing of CONFIG_SLO=
B,
> > same as http://permalink.gmane.org/gmane.linux.kernel/1759314 that
> > identified a harmless commit that only initializes a field of
> > struct mm_struct and then ended up exploded in slob freeing.
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
> > the body of a message to majordomo(a)vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/

--===============8642998028069534759==--

