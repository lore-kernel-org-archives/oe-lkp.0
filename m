Content-Type: multipart/mixed; boundary="===============2452857689939647949=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Mon, 24 Aug 2020 17:14:25 +0200
Message-ID: <20200824151425.GF4794@zn.tnic>
In-Reply-To: <20200821020259.GA90000@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2452857689939647949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 10:02:59AM +0800, Feng Tang wrote:
>   1de08dccd383 x86/mce: Add a struct mce.kflags field
>   9554bfe403bd x86/mce: Convert the CEC to use the MCE notifier
> =

> And strange thing is after using gcc9 and debian10 rootfs, with same comm=
its
> the regression turns to a improvement,

How so?

> though the trend keeps, that if we
> changes the kflags from __u64 to __u32, the performance will be no change.
> =

> Following is the comparing of regression, I also attached the perf-profile
> for old and new commit (let me know if you need more data)
> =

> =

> 9554bfe403bdfc08 1de08dccd383482a3e88845d355 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     192362           -15.1%     163343        will-it-scale.287.processes
>       0.91            +0.2%       0.92        will-it-scale.287.processes=
_idle
>     669.67           -15.1%     568.50        will-it-scale.per_process_o=
ps

This is the data from your previous measurement:

9554bfe403bdfc08 1de08dccd383482a3e88845d355
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
    668.00           -14.1%     573.75        will-it-scale.per_process_ops

If I'm reading it correctly, commit

1de08dccd383 ("x86/mce: Add a struct mce.kflags field")

is still the slower one vs

9554bfe403bd ("x86/mce: Convert the CEC to use the MCE notifier")

Or am I misreading it?

In any case, this really looks like what Tony said: this enlargement of
struct mce pushes some variable into a cacheline-misaligned placement,
causing it to bounce.

The $ 10^6 question is, which variable is that...

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 36809=
, AG N=C3=BCrnberg
--===============2452857689939647949==--

