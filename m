Content-Type: multipart/mixed; boundary="===============8597529946291143751=="
MIME-Version: 1.0
From: Will Deacon <will@kernel.org>
To: lkp@lists.01.org
Subject: Re: [kernel] 247f5d7caa: will-it-scale.per_process_ops 9.6% improvement
Date: Fri, 21 Feb 2020 16:00:54 +0000
Message-ID: <20200221160053.GA19330@willie-the-truck>
In-Reply-To: <CAG48ez0N9rTEtrA1TrL07r5Om_yK-10XO2XtsWOn3Nde0PXsZA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8597529946291143751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 04:55:42PM +0100, Jann Horn wrote:
> On Fri, Feb 21, 2020 at 12:56 PM kernel test robot
> <rong.a.chen@intel.com> wrote:
> > FYI, we noticed a 9.6% improvement of will-it-scale.per_process_ops due=
 to commit:
> >
> >
> > commit: 247f5d7caa443d0ea5f1992aeda875e679e9bd35 ("kernel-hacking: Make=
 DEBUG_{LIST,PLIST,SG,NOTIFIERS} non-debug options")
> > https://git.kernel.org/cgit/linux/kernel/git/will/linux.git debug-list
> =

> I'm guessing this might mean that the test bot had the DEBUG_LIST
> stuff enabled in its Kconfig, whereas after the rename, the default is
> used, which is off?

I thought that at first, but scrolling down in the logs of the report
I got totally confused by the softirqs and interrupts stuff.

> This seems a bit problematic if people had DEBUG_LIST enabled in their
> old kernel config and then try to reuse that config for a new kernel.
> I wonder whether it'd be acceptable to keep the options under their
> old names and let them "select" the new ones, or whether we have to
> choose between "keep the old bad name" and "discard people's old
> config flags".

I can keep DEBUG_LIST kicking around and have the options default to that.
Once I've finished updated lkdtm, I'll post this all out to the list.

Will
--===============8597529946291143751==--

