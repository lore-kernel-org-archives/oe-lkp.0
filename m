Content-Type: multipart/mixed; boundary="===============5889408779757994936=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [iov_iter] 9bd0e337c6: will-it-scale.per_process_ops -4.8% regression
Date: Thu, 03 Dec 2020 09:47:04 -0800
Message-ID: <CAHk-=wif1iGLiqcsx1YdLS4tN01JuH-MV_oem0duHqskhDTY9A@mail.gmail.com>
In-Reply-To: <20201203064536.GE27350@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5889408779757994936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 10:31 PM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
> FYI, we noticed a -4.8% regression of will-it-scale.per_process_ops due t=
o commit:

Ok, I guess that's bigger than expected, but the profile data does
show how bad the indirect branches are.

There's both a "direct" cost of them:

>       0.55 =C4=85 14%      +0.3        0.87 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.__x86_retpoline_rax
>       0.12 =C4=85 14%      +0.1        0.19 =C4=85 14%  perf-profile.self=
.cycles-pp.__x86_indirect_thunk_rax
>       0.43 =C4=85 14%      +0.3        0.68 =C4=85 15%  perf-profile.self=
.cycles-pp.__x86_retpoline_rax

The actual retpoline profile costs themselves do not add up to 4%, but
I think that's because the indirect costs are higher, because the
branch mis-predicts will basically make everything run slower for a
while as the OoO engine needs to restart.

So the global cost then shows up in CPU and branch miss stats, where
the IPC goes down (which is the same thing as saying that CPI goes
up):

>  1.741e+08           +42.3%  2.476e+08        perf-stat.i.branch-misses
>       0.74            -3.9%       0.71        perf-stat.overall.ipc
>       1.35            +4.1%       1.41        perf-stat.overall.cpi

which is why it ends up being so costly even if the retpoline overhead
itself is "only" just under 1%.

           Linus
--===============5889408779757994936==--

