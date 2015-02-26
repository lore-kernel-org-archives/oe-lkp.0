Content-Type: multipart/mixed; boundary="===============8086513988936762289=="
MIME-Version: 1.0
From: Catalin Marinas <catalin.marinas@arm.com>
To: lkp@lists.01.org
Subject: Re: [futex] 76835b0ebf8: -8.1% will-it-scale.per_thread_ops
Date: Thu, 26 Feb 2015 09:58:13 +0000
Message-ID: <20150226095812.GA32538@localhost>
In-Reply-To: <1424927813.10337.19.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8086513988936762289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2015 at 05:16:53AM +0000, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 76835b0ebf8a7fe85beb03c75121419a7dec52f0 ("futex: Ensure get_futex=
_key_refs() always implies a barrier")
> =

> =

> testbox/testcase/testparams: lkp-wsx01/will-it-scale/performance-futex4
> =

> 0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751
> ----------------  --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>    6314259 =C2=B1  0%      -8.1%    5800079 =C2=B1  0%  will-it-scale.per=
_thread_ops
>    6274871 =C2=B1  0%      -8.1%    5768747 =C2=B1  0%  will-it-scale.per=
_process_ops

This was raised before but I'm not sure we can do much about it:

https://lkml.org/lkml/2014/10/26/189

It would be interesting to know the difference in performance with the
code prior to commits b0c29f79ecea and 11d4616bd07f which optimised the
futex code but missed a barrier.

-- =

Catalin

--===============8086513988936762289==--

