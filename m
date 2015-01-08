Content-Type: multipart/mixed; boundary="===============7313726521238458187=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [mm] c8c06efa8b5: -7.6% unixbench.score
Date: Wed, 07 Jan 2015 23:45:54 -0800
Message-ID: <1420703154.12346.10.camel@stgolabs.net>
In-Reply-To: <1420684064.6201.86.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7313726521238458187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-01-08 at 10:27 +0800, Huang Ying wrote:
Cc'ing Peter.

> FYI, we noticed the below changes on
> =

> commit c8c06efa8b552608493b7066c234cfa82c47fcea ("mm: convert i_mmap_mute=
x to rwsem")

Same exact everything, except for the lock type. No sharing going on.

> testbox/testcase/testparams: lituya/unixbench/performance-execl
> =

> 83cde9e8ba95d180  c8c06efa8b552608493b7066c2  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>     721721 =C2=B1  1%    +303.6%    2913110 =C2=B1  3%  unixbench.time.vo=
luntary_context_switches
>      11767 =C2=B1  0%      -7.6%      10867 =C2=B1  1%  unixbench.score

And this workload appears to be from execl, right? Make sense with some
of those numbers!!

>  2.323e+08 =C2=B1  0%      -7.2%  2.157e+08 =C2=B1  1%  unixbench.time.mi=
nor_page_faults
>        207 =C2=B1  0%      -7.0%        192 =C2=B1  1%  unixbench.time.us=
er_time
>    4923450 =C2=B1  0%      -5.7%    4641672 =C2=B1  0%  unixbench.time.in=
voluntary_context_switches
>        584 =C2=B1  0%      -5.2%        554 =C2=B1  0%  unixbench.time.pe=
rcent_of_cpu_this_job_got
>        948 =C2=B1  0%      -4.9%        902 =C2=B1  0%  unixbench.time.sy=
stem_time
>          0 =C2=B1  0%      +Inf%     672942 =C2=B1  2%  latency_stats.hit=
s.call_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fi=
xup.SyS_mprotect.system_call_fastpath

What does this "hits" thing mean exactly? Since I assume both before and
after runs have the same level of concurrency when pounding on mmap
operations, I doubt it means that its the amount of calls into the
slowpath... in addition the lock is obviously contended so we can forget
about anything in the fastpath.

So this is a call_rwsem_down_write_failed() vs __mutex_lock_common()
issue.


Thanks,
Davidlohr


--===============7313726521238458187==--

