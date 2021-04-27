Content-Type: multipart/mixed; boundary="===============6714124718978703067=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq] cbe16f35be: will-it-scale.per_thread_ops -5.2% regression
Date: Tue, 27 Apr 2021 21:37:11 +0200
Message-ID: <87czufo6xk.ffs@nanos.tec.linutronix.de>
In-Reply-To: <87fszcnecr.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6714124718978703067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27 2021 at 13:42, Thomas Gleixner wrote:
> On Tue, Apr 27 2021 at 17:00, kernel test robot wrote:
>> FYI, we noticed a -5.2% regression of will-it-scale.per_thread_ops due t=
o commit:
>>
>> commit: cbe16f35bee6880becca6f20d2ebf6b457148552 ("genirq: Add IRQF_NO_A=
UTOEN for request_irq/nmi()")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> this is the second report in the last week which makes not a lot of sense.
> And this oneis makes absolutely no sense at all.
>
> This commit affects request_irq() and the related variants and has
> exactly ZERO influence on anything related to that test case simply
> because.
>
> I seriously have to ask the question whether this test infrastructure is
> actually measuring what it claims to measure.
>
> As this commit clearly _cannot_ have the 'measured' side effect, this
> points to some serious issue in the tests or the test infrastructure
> itself.

Just to illustrate the issue:

I ran the will-it-scale getppid1 test manually against plain v5.12 and
against v5.12 + cherrypicked cbe16f35be, i.e. the "offending" commit.

The result for a full run is just in the noise:

    average:    < 0.1%
    minimum:     -0.22%
    maximum:      0.29%

IOW very far away from -5.2%.

That's an order of magnitude off.

And no, I'm not going to run that lkp-test muck simply because it's
unusable and the test result of will-it-scale itself is clear enough.

Thanks,

        tglx

--===============6714124718978703067==--

