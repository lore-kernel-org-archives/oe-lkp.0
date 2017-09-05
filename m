Content-Type: multipart/mixed; boundary="===============3388068616210089448=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: 915f3e3f76 ("mac80211_hwsim: Replace bogus hrtimer clockid"): BUG: kernel reboot-without-warning in test stage
Date: Tue, 05 Sep 2017 21:30:40 +0200
Message-ID: <alpine.DEB.2.20.1709052129510.2393@nanos>
In-Reply-To: <20170905164103.tkrhxzca4b5ulps2@breakpoint.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============3388068616210089448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Sep 2017, Sebastian Andrzej Siewior wrote:

> On 2017-09-05 09:12:40 [+0200], Thomas Gleixner wrote:
> > Sorry, no. That bisect is completely bogus. The commit in question meri=
ly
> > replaces the unsupported clockid with a valid one.
> =

> The bisect is correct. It just has problems to express itself properly. So
> the table says:
> =

> | WARNING:at_kernel/time/hrtimer.c:#hrtimer_init  | 7   |     |    |   | =
                                                                           =
    =

> | BUG:kernel_reboot-without-warning_in_test_stage | 0   | 12  | 6  | 6 | =
                                                                           =
    =

> =

> which means _before_ your commit it counted a warning in hrtimer_init()
> (an unsupported clock id was used). With your commit, the warning was
> gone and I *think* the userland then printed
> "BUG:kernel_reboot-without-warning_in_test_stage" because it had no
> warning.
> It seems that the bot learned to live with that warning which was around
> for more than three years. Now that you removed it, it seems to be a
> mistake to do so because nobody complained about it so far.

Thanks for the translation. I'll never learn to decode these reports.

       tglx

--===============3388068616210089448==--

