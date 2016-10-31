Content-Type: multipart/mixed; boundary="===============1372911061403378787=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: Adding Thermal SoC tree into 0-Day testing
Date: Mon, 31 Oct 2016 13:01:57 +0800
Message-ID: <20161031050157.GA12163@intel.com>
In-Reply-To: <CAC-25o8_1br7DqOicViQH6s5hDpScy=6mVcf-1HYMbwBzyge1Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1372911061403378787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2016 at 08:19:22AM -0700, edubezval(a)gmail.com wrote:
> Hey Philip,
> =

> On Fri, Oct 28, 2016 at 7:43 AM, Philip Li <philip.li@intel.com> wrote:
> >> I saw that you do a simple read of thermal zone temperatures, and
> >> cooling devices actions, which is great for me. If I want to extend
> >> thermal tests, how do I do it?
below are some info for initial steps
- check https://01.org/lkp/get--involved, to clone lkp-tests repo from http=
s://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/
- doc at lkp-tests/doc/lkp-howto.md has basic information regarding how to =
write/update tests, then can submit patch to lkp mail list

> >>
> >> And finally, which archs and devices do you test?
> > For thermal related questions, let me consult more members and back to =
you later.
> =

> OK Great. No rush here.
> =

> It would be nice to know which board/devices you have in the farm for
> boot/testing.
We currently run testing on x86 desktops/2P and 4P servers.

> =

> BR,
> =

> =

> >
> >>
> >> BR,
> >>
> >> >>
> >> >> BR,
> >> >>
> >> >> --
> >> >> Eduardo Bezerra Valentin
> >> >> _______________________________________________
> >> >> LKP mailing list
> >> >> LKP(a)lists.01.org
> >> >> https://lists.01.org/mailman/listinfo/lkp
> >>
> >>
> >>
> >> --
> >> Eduardo Bezerra Valentin
> =

> =

> =

> -- =

> Eduardo Bezerra Valentin

--===============1372911061403378787==--

