Content-Type: multipart/mixed; boundary="===============3240044621029432874=="
MIME-Version: 1.0
From: Alex Shi <alex.shi@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/balance] 18e6296b85e: -96.9% interrupts.RES
Date: Tue, 04 Mar 2014 23:32:19 +0800
Message-ID: <5315F203.80602@linaro.org>
In-Reply-To: <20140304130559.GA28781@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============3240044621029432874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks a lot for the testing result!

I know the problem I have. :)


On 03/04/2014 09:05 PM, Fengguang Wu wrote:
> Hi Alex,
>
> FYI, we noticed the below changes on
>
> https://github.com/alexshi/power-scheduling.git single-balance
> commit 18e6296b85ea72c81aa485653d442ad88296d475 ("sched/balance: central =
balance prototype")
>
> test case: snb-drag/crypto/tcrypt/2s-301-319
>
> 598143917dc5ecf  18e6296b85ea72c81aa485653
> ---------------  -------------------------
>      206307 ~ 0%     -96.9%       6337 ~ 4%  TOTAL interrupts.RES
>      506552 ~ 1%     -24.3%     383290 ~ 3%  TOTAL cpuidle.C6-SNB.usage
>       18.27 ~ 9%   +1063.5%     212.53 ~25%  TOTAL time.system_time
>           1 ~30%   +1262.5%         21 ~31%  TOTAL time.percent_of_cpu_th=
is_job_got
>         821 ~12%     -22.3%        638 ~19%  TOTAL vmstat.system.in
>
>
>
>                                   time.system_time
>
>     400 ++---------------------------------------------------------------=
----+
>         |                                                                =
    |
>     350 ++        O         O    O                                       =
    |
>     300 ++O  O                     O                                     =
    |
>         O      O         O    O       O O                                =
    |
>     250 ++          O                          O                         =
    |
>         |              O                          O                      =
    |
>     200 ++                                                               =
    |
>         |                                  O                             =
    |
>     150 ++                                   O                           =
    |
>     100 ++                                                               =
    |
>         |                                                                =
    |
>      50 ++                                                               =
    |
>         *.*..*.*..*.*..*.*..*.*..*.*..*.*..*.*.*..*.*..*.*..*.*..*.*..*.*=
..*.*
>       0 ++---------------------------------------------------------------=
----+
>
>
> Thanks,
> Fengguang


--===============3240044621029432874==--

