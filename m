Content-Type: multipart/mixed; boundary="===============3631598234912160065=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86, vdso] cfda7bb9ecb: +14.7% will-it-scale.per_thread_ops
Date: Wed, 21 May 2014 15:46:58 -0700
Message-ID: <CALCETrVFbo1yb7FyCH1Y=pHb89VPt9ycx0C-wv2A7h=CzwwdGA@mail.gmail.com>
In-Reply-To: <537AEF2D.9040207@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3631598234912160065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2014 at 10:59 PM, Jet Chen <jet.chen@intel.com> wrote:
> Hi Andy,
>
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/vdso
> commit cfda7bb9ecbf9d96264bb5bade33a842966d1062 ("x86, vdso: Move syscall
> and sysenter setup into kernel/cpu/common.c")

This is really strange.  That change shouldn't have any effect except
that some kernels might boot a cycle or two faster.

>
> test case: nhm4/will-it-scale/sched_yield
>
> 3d7ee969bffcc98  cfda7bb9ecbf9d96264bb5bad
> ---------------  -------------------------
>     5497021 ~ 0%     +14.7%    6303424 ~ 0%  TOTAL
> will-it-scale.per_thread_ops
>        0.54 ~ 0%      +5.6%       0.57 ~ 0%  TOTAL will-it-scale.scalabil=
ity
>     6209483 ~ 0%      +1.6%    6305917 ~ 0%  TOTAL
> will-it-scale.per_process_ops
>        2455 ~ 5%     +16.9%       2870 ~ 5%  TOTAL cpuidle.C1-NHM.usage
>        8829 ~ 7%     +15.2%      10169 ~10%  TOTAL
> slabinfo.kmalloc-64.active_objs
>       24.13 ~12%     +48.9%      35.93 ~14%  TOTAL time.user_time
>         393 ~ 0%      -3.0%        382 ~ 1%  TOTAL time.system_time
>

Is this a speedup or a slowdown?

--Andy

--===============3631598234912160065==--

