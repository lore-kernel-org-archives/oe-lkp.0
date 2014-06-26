Content-Type: multipart/mixed; boundary="===============4060567697211308936=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [clockevents] d5a085970b0: -9.2% will-it-scale.per_thread_ops
Date: Thu, 26 Jun 2014 16:37:58 +0530
Message-ID: <CAKohpomYaDm+Gf=KpO7Fy=7=++O57WT75Ty88WnmWA9daZFCDw@mail.gmail.com>
In-Reply-To: <20140626014648.GC12239@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4060567697211308936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 26 June 2014 07:16, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Viresh,
>
> I'm not sure how the simple commit will impact will-it-scale/pwrite2
> throughput. Just in case you can see more clues.
>
> git://git.linaro.org/people/vireshk/linux tick/ONESHOT-STOPPED
> commit d5a085970b0b88b8c82303d2c45f09c9427fd02a ("clockevents: x86: add s=
upport for ONESHOT_STOPPED mode")
>
> test case: nhm4/will-it-scale/pwrite2
>
> f4f5df6f142f679  d5a085970b0b88b8c82303d2c
> ---------------  -------------------------
>     773859 ~ 0%      -9.2%     702704 ~ 0%  TOTAL will-it-scale.per_threa=
d_ops
>
> Legend:
>         ~XX%    - stddev percent
>         [+-]XX% - change percent
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.

Hi Fengguang,

Thanks for your link: https://github.com/antonblanchard/will-it-scale.git

You saw these changes because the simple commit you were talking about
changes behavior of code.

To be specific, we are stopping the clock-event devices now when they
aren't used. i.e. during idle periods or in full dynticks.

I still fail to understand why performance came down by 9.2%..
Adding Frederic in CC, in case he can throw some light. But he is currently
on vacations and I don't expect him to reply immediately :)

--===============4060567697211308936==--

