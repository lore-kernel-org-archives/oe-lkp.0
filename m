Content-Type: multipart/mixed; boundary="===============2303705236507128560=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86/RAPL] BUG: unable to handle kernel NULL pointer dereference at 00000028
Date: Fri, 01 Aug 2014 07:59:42 +0800
Message-ID: <20140731235942.GA5635@localhost>
In-Reply-To: <CABPqkBQ5WagvWLa4ojLAZB2fgBUa53YstBsmLS6JqVzjZ2aEaQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2303705236507128560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 07:57:25PM +0200, Stephane Eranian wrote:
> On Thu, Jul 31, 2014 at 4:32 AM, Fengguang Wu <fengguang.wu@intel.com> =
wrote:
> > Hi Stephane,
> >
> > On Wed, Jul 30, 2014 at 07:56:11PM +0200, Stephane Eranian wrote:
> >> On Wed, Jul 30, 2014 at 7:53 AM, Fengguang Wu <fengguang.wu@intel.co=
m> wrote:
> >> > On Wed, Jul 30, 2014 at 06:45:58AM +0200, Stephane Eranian wrote:
> >> >> On Wed, Jul 30, 2014 at 6:00 AM, Fengguang Wu <fengguang.wu@intel=
.com> wrote:
> >> >> > Greetings,
> >> >> >
> >> >> > 0day kernel testing robot got the below dmesg and the first bad c=
ommit is
> >> >> >
> >> >> Is this booting a guest kernel or native?
> >> >
> >> > It's a guest kernel.
> >> >
> >> >> What is the  host CPU?
> >> >
> >> > The host CPU is E5-2680, Sandy Bridge-EP.
> >> >
> >> I thought this problem had already be mentioned a while back.
> >>
> >> See https://lkml.org/lkml/2014/3/6/685
> >> And https://lkml.org/lkml/2014/4/23/512
> >>
> >> So what you are telling here is that those two fixes never made it or
> >> that you are
> >> running an older kernel.
> >
> > I just checked linux-next and find that the bug in rapl_pmu_init() has
> > been fixed. linux-next happen to have the same "BUG: unable to handle
> > kernel NULL pointer dereference" message but at another function
> > validate_chain().. Attached is the dmesg in linux-next.
> >
> > Sorry for the noise!
> >
> Is it fixed with the two patches I referred you to?

Yes.

Thanks,
Fengguang


--===============2303705236507128560==--

