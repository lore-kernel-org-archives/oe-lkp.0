Content-Type: multipart/mixed; boundary="===============2380354605580507456=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [Revert "ppdev] 1701f68040: genirq: Flags mismatch irq 4. 00000000 (serial) vs. 00000080 (goldfish_pdev_bus)
Date: Mon, 30 May 2016 03:23:29 +0800
Message-ID: <20160529192329.GA29119@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+55aFyvxUJV+uSKVbfhf_BFmDoBwth=HXqC+oZ-V0j7A2xACA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2380354605580507456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2016 at 09:25:28AM -0700, Linus Torvalds wrote:
> On Sun, May 29, 2016 at 8:28 AM, kernel test robot
> <fengguang.wu@intel.com> wrote:
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> =

> This bisection seems unlikely.
> =

> I *think* what is going on is that the previous kernels ended up with
> boot failures:
> =

> > +------------------------------------------------------------+---------=
---+------------+-------------+
> > |                                                            | 3b3b3bd9=
77 | 1701f68040 | v4.6_052910 |
> > +------------------------------------------------------------+---------=
---+------------+-------------+
> > | kernel_BUG_at_drivers/base/driver.c                        | 92      =
   |            |             |
> =

> and then when that went away (thanks to the commit you bisected to),
> the "genirq: Flags mismatch" warning showed up because it now got past
> that original bug.

That's right. It's a bug fix that discloses a less serious warning.

> I'm not sure what the fix to the 0day bisection should be. Maybe add
> some test that the last "good" kernel actually booted?

Yes, we do have tests on whether the parent boots fine or has more
serious boot errors, however they are wrongly bypassed when we
recently try to add a new test to report out errors which look
relevant to the code change.

I'll fix it up, sorry for the noise!

Boot tests are pretty noisy and often a commit and its parent commit
both have error/warnings. A better long term solution would be to
compare their time stamps to get the clue whether it's a bug fix that
makes the kernel live longer to produce another warning.

Thanks,
Fengguang

--===============2380354605580507456==--

