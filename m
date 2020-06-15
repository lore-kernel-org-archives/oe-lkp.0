Content-Type: multipart/mixed; boundary="===============4745559583361698789=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [gup] 17839856fd: stress-ng.vm-splice.ops_per_sec 2158.6% improvement
Date: Mon, 15 Jun 2020 16:33:59 +0800
Message-ID: <20200615083359.GC57549@shbuild999.sh.intel.com>
In-Reply-To: <CAG48ez1v1b4X5LgFya6nvi33-TWwqna_dc5jGFVosqQhdn_Nkg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4745559583361698789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 09:32:41AM +0200, Jann Horn wrote:
> On Thu, Jun 11, 2020 at 10:24 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, Jun 10, 2020 at 9:05 PM kernel test robot <rong.a.chen@intel.=
com> wrote:
> > >
> > > FYI, we noticed a 2158.6% improvement of stress-ng.vm-splice.ops_per_=
sec due to commit:
> > >
> > > commit: 17839856fd588f4ab6b789f482ed3ffd7c403e1f ("gup: document and =
work around "COW can break either way" issue")
> >
> > Well, that is amusing, and seeing improvements is always nice, but
> > somehow I think the test is broken.
> >
> > I can't see why you'd ever see an improvement from that commit, and if
> > you do see one, not one by a factor of 20x.
> =

> FWIW, if this is the testcase:
> <https://kernel.ubuntu.com/git/cking/stress-ng.git/tree/stress-vm-splice.=
c>

Yes, functionally this is the same file as what is used by 0day, though 0day
use a stable release tar ball.

Thanks,
Feng
 =

> then that testcase is essentially testing how fast vmsplice() is when
> called in a loop on an uninitialized mmap() mapping. So before that
> commit, I think it will create zeropage PTEs in the first iteration
> (and zeropage PTEs are _PAGE_SPECIAL, see do_anonymous_page()). And
> get_user_pages_fast() bails out in gup_pte_range() if pte_special().
> So that testcase was always hitting the GUP slowpath.
> But now the first iteration will force the creation of a normal RW
> PTE, so all following iterations can go through the GUP fastpath.
> =

> So in summary I guess the test was just really slow up until now
> because it was hitting a slowpath that you wouldn't hit during normal
> usage? At least for vmsplice(), writing uninitialized pages doesn't
> really make a whole lot of sense...
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============4745559583361698789==--

