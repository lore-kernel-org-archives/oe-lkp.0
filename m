Content-Type: multipart/mixed; boundary="===============4767262460127412374=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/vunmap] e47110e905: WARNING:at_mm/vmalloc.c:#__vunmap
Date: Sat, 24 Apr 2021 19:04:00 -0700
Message-ID: <CAHk-=wiW7xdHZTBgVOpVFM_7bek0HGvioQvCCyDXCbRa2fWdXQ@mail.gmail.com>
In-Reply-To: <20210425014816.GB5251@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4767262460127412374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 6:31 PM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > Oliver - how reliable is that bisection?
>
> we will check further if any issue in our test env.
>
> by bot auto tests, we saw 12 issue instances out of 74 runs. but not happ=
en
> out of 100 runs of parent.

Oh, that's interesting. So only 12 out of 74 runs saw that __vunmap
warning, but if I understand your table correctly, there were some
_other_ issues in there?

Are those also for that same commit? (ie those RIP:kfree /
RIP:kobject_add_internal / etc)?

I'm not sure how to read that table of yours - if I understand it
correctly, it looks like the parent commit had some different ones
that the child did not (eg 2 cases of BUG_at_mm/usercopy.c?)

So it feels to me like there's some memory corruption somewhere, and
that commit that it bisected to likely just changed the failure case
(due to timing differences or allocation ordering changes).

IOW, there seem to be other panics even in the parent.

Yes/No?

             Linus
--===============4767262460127412374==--

