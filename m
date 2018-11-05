Content-Type: multipart/mixed; boundary="===============3737518341345367340=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 9bc8039e71: will-it-scale.per_thread_ops -64.1% regression
Date: Mon, 05 Nov 2018 09:50:09 -0800
Message-ID: <CAHk-=wi8BNNTp+Xt4ROz1TqGgFT-c6-Hmmc9yW0B6p2FTFwJTg@mail.gmail.com>
In-Reply-To: <20181105050813.GP24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3737518341345367340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 4, 2018 at 9:08 PM kernel test robot <rong.a.chen@intel.com> =
wrote:
>
> FYI, we noticed a -64.1% regression of will-it-scale.per_thread_ops
> due to commit 9bc8039e715d ("mm: brk: downgrade mmap_sem to read when
> shrinking")

Ugh. That looks pretty bad.

> in testcase: will-it-scale
> on test machine: 8 threads Ivy Bridge with 16G memory
> with following parameters:
>
>         nr_task: 100%
>         mode: thread
>         test: brk1
>         ucode: 0x20
>         cpufreq_governor: performance

The reason seems to be way more scheduler time due to lots more
context switches:

>   34925294 =C2=B1 18%    +270.3%  1.293e+08 =C2=B1  4%  will-it-scale.tim=
e.voluntary_context_switches

Yang Shi, would you mind taking a look at what's going on?

              Linus

--===============3737518341345367340==--

