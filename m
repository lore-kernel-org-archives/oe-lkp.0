Content-Type: multipart/mixed; boundary="===============3861125782653657561=="
MIME-Version: 1.0
From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
To: lkp@lists.01.org
Subject: Re: [x86] 339a3922f6: +4.3% aim7 jobs-per-min
Date: Thu, 20 Feb 2014 14:13:20 +0100
Message-ID: <5305FF70.2030406@canonical.com>
In-Reply-To: <20140220130646.GA22815@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============3861125782653657561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

op 20-02-14 14:06, Fengguang Wu schreef:
> Hi Maarten,
>
> We are glad to find that your commit 339a3922f68dcb7d93001f07b7e914d5cf6c=
066d
> ("decrease useless padding") increased aim disk_src performance by 4.3%:
>
> 74833276be6802b  339a3922f68dcb7d93001f07b
> ---------------  -------------------------
>      511685 ~ 0%      +4.3%     533571 ~ 0%  TOTAL aim7.2000.jobs-per-min
>       77.30 ~ 0%      -9.9%      69.66 ~ 0%  TOTAL time.system_time
>        1.95 ~ 2%      +7.0%       2.09 ~ 2%  TOTAL iostat.sda.rrqm/s
>       23.57 ~ 0%      -4.1%      22.60 ~ 0%  TOTAL time.elapsed_time
>         425 ~ 0%      -3.1%        412 ~ 0%  TOTAL time.percent_of_cpu_th=
is_job_got
>        7.59 ~ 0%      -2.9%       7.37 ~ 0%  TOTAL boottime.dhcp
>       15.24 ~ 0%      -1.9%      14.94 ~ 0%  TOTAL boottime.boot
>
Really? I just did it to get rid of the 15-byte nop sequences with tons of =
prefixes.
Interesting..

~Maarten


--===============3861125782653657561==--

