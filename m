Content-Type: multipart/mixed; boundary="===============7008980227350618615=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [clockevents] WARNING: CPU: 0 PID: 0 at kernel/time/tick-oneshot.c:32 tick_stop_event()
Date: Mon, 23 Jun 2014 14:02:25 +0530
Message-ID: <CAKohpomtHuXP0Q9QnWvJj1d2O=AewMR+nVNE3N_KFJkMpcCHYA@mail.gmail.com>
In-Reply-To: <53A7E357.5040800@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7008980227350618615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 23 June 2014 13:50, Jet Chen <jet.chen@intel.com> wrote:
> Hi Viresh,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.linaro.org/people/vireshk/linux tick/ONESHOT-STOPPED

Hi Jet/Fengguang,

Why did your scripts Cc'd LKML for this report? It never used to
happen for my trees Atleast.

These patches haven't been posted to LKML yet and sending
reports there for these wouldn't be good for their fate :)

Anyway, will look at what broke. Thanks.

--
viresh

--===============7008980227350618615==--

