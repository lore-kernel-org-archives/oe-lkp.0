Content-Type: multipart/mixed; boundary="===============4141805330141417271=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf x86] b77491648e: will-it-scale.per_process_ops -2.1% regression
Date: Wed, 05 Feb 2020 12:47:06 -0800
Message-ID: <87tv44danp.fsf@linux.intel.com>
In-Reply-To: <20200205123110.GN12867@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4141805330141417271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> writes:

> Greeting,
>
> FYI, we noticed a -2.1% regression of will-it-scale.per_process_ops due t=
o commit:
>
>
> commit: b77491648e6eb2f26b6edf5eaea859adc17f4dcc ("perf x86: Infrastructu=
re for exposing an Uncore unit to PMON mapping")
> https://github.com/0day-ci/linux/commits/roman-sudarikov-linux-intel-com/=
perf-x86-Exposing-IO-stack-to-IO-PMON-mapping-through-sysfs/20200118-075508

Seems to be spurious bisect. I don't think that commit could change
anything performance related.

-Andi
--===============4141805330141417271==--

