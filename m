Content-Type: multipart/mixed; boundary="===============3759616886383567967=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [kernel/sofirq] ffce8e6f93: BUG:using_smp_processor_id()in_preemptible
Date: Wed, 21 Feb 2018 11:50:08 +0100
Message-ID: <20180221105008.o4ooqw6hoe5hh4m7@linutronix.de>
In-Reply-To: <20180220174801.n6qexw4adb5hcd4m@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============3759616886383567967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2018-02-21 01:48:01 [+0800], kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: ffce8e6f936e3d879910a76cf8ce6293d78a51e6 ("kernel/sofirq: consoli=
date common code in __tasklet_schedule() + _hi_")
> url: https://github.com/0day-ci/linux/commits/Sebastian-Andrzej-Siewior/k=
ernel-sofirq-consolidate-common-code-in-__tasklet_schedule-_hi_/20180218-01=
0957

yes, and this patch was superseded by

  https://lkml.kernel.org/r/20180216170836.ex2uxcgkk7gniwqi(a)linutronix.de

Sebastian

--===============3759616886383567967==--

