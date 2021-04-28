Content-Type: multipart/mixed; boundary="===============3807787784525659060=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq] cbe16f35be: will-it-scale.per_thread_ops -5.2% regression
Date: Wed, 28 Apr 2021 18:56:29 +0200
Message-ID: <874kfqmjpe.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210428152339.GA2282261@pl-dbox>
List-Id: <oe-lkp.lists.linux.dev>

--===============3807787784525659060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Philip,

On Wed, Apr 28 2021 at 23:23, Philip Li wrote:
> On Wed, Apr 28, 2021 at 10:56:16AM +0200, Thomas Gleixner wrote:
>> On Wed, Apr 28 2021 at 16:08, Feng Tang wrote:
>> > On Wed, Apr 28, 2021 at 07:01:35AM +0000, Song Bao Hua (Barry Song) wr=
ote:
>> >
>> >> But it is still an irrelevant problem.
>> > Yes, the commit itself has no problem. And my personal thought
>> > is no further action is needed. =

>> =

>> The commit does not need any further action, but this testing stuff
> Sorry Thomas for confusion and trouble caused by this. We will take it
> seriously to refine the report process for this category (alignment or
> cache behavior) of performance change, to avoid meaningless ones.

Things go wrong every now and then. As long as we figure it out and
stuff gets fixed, no problem.

Thanks,

        tglx
--===============3807787784525659060==--

