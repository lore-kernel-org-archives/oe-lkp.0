Content-Type: multipart/mixed; boundary="===============6060460309651897603=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq] cbe16f35be: will-it-scale.per_thread_ops -5.2% regression
Date: Tue, 27 Apr 2021 13:42:12 +0200
Message-ID: <87fszcnecr.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210427090013.GG32408@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6060460309651897603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

On Tue, Apr 27 2021 at 17:00, kernel test robot wrote:

> Greeting,
>
> FYI, we noticed a -5.2% regression of will-it-scale.per_thread_ops due to=
 commit:
>
> commit: cbe16f35bee6880becca6f20d2ebf6b457148552 ("genirq: Add IRQF_NO_AU=
TOEN for request_irq/nmi()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

this is the second report in the last week which makes not a lot of sense.
And this oneis makes absolutely no sense at all.

This commit affects request_irq() and the related variants and has
exactly ZERO influence on anything related to that test case simply
because.

I seriously have to ask the question whether this test infrastructure is
actually measuring what it claims to measure.

As this commit clearly _cannot_ have the 'measured' side effect, this
points to some serious issue in the tests or the test infrastructure
itself.

Thanks,

        tglx
--===============6060460309651897603==--

