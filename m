Content-Type: multipart/mixed; boundary="===============6917554306164914988=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: lkp@lists.01.org
Subject: Re: [serial] 679193b7ba: BUG:spinlock_bad_magic_on_CPU
Date: Sun, 02 Aug 2020 14:16:52 +0300
Message-ID: <CAHp75VdAHGi3OtTe34TgpgBp_5=i0K6wa3vygaxHQv3OO=bA1Q@mail.gmail.com>
In-Reply-To: <20200802105808.GA164531@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6917554306164914988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2020 at 1:58 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sun, Aug 02, 2020 at 01:50:29PM +0300, Andy Shevchenko wrote:
> > On Sun, Aug 2, 2020 at 8:54 AM kernel test robot <lkp@intel.com> wrot=
e:

...

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > Thanks for the report. I didn't see it on real hardware though. Maybe
> > because of timing (race?) differences.
> >
> > Greg, I think the best is to revert the change until I will have better=
 one.
>
> Can you send me a revert patch with the reported-by: set up?

Done.


-- =

With Best Regards,
Andy Shevchenko
--===============6917554306164914988==--

