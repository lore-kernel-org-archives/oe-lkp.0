Content-Type: multipart/mixed; boundary="===============3627700113682463487=="
MIME-Version: 1.0
From: Louis Langholtz <lou_langholtz@me.com>
To: lkp@lists.01.org
Subject: Re: [kernel] fc7f0dd3817: -2.1% will-it-scale.per_thread_ops
Date: Mon, 26 Jan 2015 12:36:22 -0700
Message-ID: <23E39399-135D-485B-8AF6-FB5D2B874A9A@me.com>
In-Reply-To: <1421894340.6126.55.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3627700113682463487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Huang (and others on the lkp(a)01.org mailing list),

Not sure how to interpret the numbers you provided. Is there a web page tha=
t you would suggest looking at that I might read up? It wouldn't surprise m=
e if the changes made resulted in slightly decreased performance - the numb=
er of commands shown in disassembly of the code not surprisingly increases.

Thank you.

Lou

On Jan 21, 2015, at 7:39 PM, Huang Ying <ying.huang@intel.com> wrote:

> FYI, we noticed the below changes on
> =

> commit fc7f0dd381720ea5ee5818645f7d0e9dece41cb0 ("kernel: avoid overflow =
in cmp_range")
> =

> =

> testbox/testcase/testparams: lituya/will-it-scale/powersave-mmap2
> =

> 7ad4b4ae5757b896  fc7f0dd381720ea5ee5818645f  =

> ----------------  --------------------------  =

>         %stddev     %change         %stddev
>             \          |                \  ...
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Huang, Ying
> =

> <job.yaml><reproduce.txt>_______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =



--===============3627700113682463487==--

