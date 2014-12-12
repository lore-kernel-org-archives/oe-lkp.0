Content-Type: multipart/mixed; boundary="===============8474807194040856514=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Fri, 12 Dec 2014 17:27:56 +0530
Message-ID: <CAKohpokEw6f5+u8J_AoV76sOAQO=J8dGhX1eZb=QZOuE+Jhq_A@mail.gmail.com>
In-Reply-To: <20141211194204.GA19083@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8474807194040856514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Cc'ing Thomas as well..

On 12 December 2014 at 01:12, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Viresh,
>
> We noticed the below lockup regression on commit 2a16fc93d2c ("nohz:
> Avoid tick's double reprogramming in highres mode").
>
> testbox/testcase/testparams: ivb42/idle-inject/60s-200%-10cp
>
> b5e995e671d8e4d7  2a16fc93d2c9568e16d45db77c
> ----------------  --------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :5          100%           1:1     last_state.is_incomplete_run
>            :5          100%           1:1     last_state.running
>
> testbox/testcase/testparams: lkp-sb03/idle-inject/60s-200%-10cp
>
> b5e995e671d8e4d7  2a16fc93d2c9568e16d45db77c
> ----------------  --------------------------
>            :7          100%           1:1     last_state.is_incomplete_run
>            :7          100%           1:1     last_state.running
>
> Where test box ivb42 is Ivy Bridge-EP and lkp-sb03 is Sandy Bridge-EP.
>
> To reproduce:
>
>         apt-get install ruby ruby-oj
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/setup-local job.yaml # the job file attached in this email
>         bin/run-local   job.yaml
>
> Basically what the test case does is to
>
> - find a Sandy Bridge or newer machine
> - look for a cooling device with type =E2=80=9Cintel_powerclamp=E2=80=9D
> - set cur_state to 10
> - run any CPU extensive workload
>
> Then expect soft lockup. It's very reproducible.

Thanks Fengguang. Yes I am able to reproduce it, but don't know yet what
went wrong..

--
viresh

--===============8474807194040856514==--

