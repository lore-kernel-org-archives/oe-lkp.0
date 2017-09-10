Content-Type: multipart/mixed; boundary="===============1497527258851193450=="
MIME-Version: 1.0
From: Joel Fernandes <joelaf@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] 6d46bd3d97: netperf.Throughput_tps -11.3% regression
Date: Sun, 10 Sep 2017 09:53:14 -0700
Message-ID: <CAJWu+orbYLs514mfgZuYNMZ=CDUaYBBr2byAJLvAL=YB5fcVMQ@mail.gmail.com>
In-Reply-To: <20170910134021.GB29265@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1497527258851193450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 10, 2017 at 6:40 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed a -11.3% regression of netperf.Throughput_tps due to comm=
it:
>
>
> commit: 6d46bd3d9705555382b83554b56a34f231d5d1dd ("sched/fair: Improve th=
e behavior of sync flag")
> url: https://github.com/0day-ci/linux/commits/Joel-Fernandes/sched-fair-I=
mprove-the-behavior-of-sync-flag/20170829-191129
>

Glad to see the bot tested this RFC/RFT patch. Anyone know what in the
netperf test triggers use of the sync flag?

thanks,

-Joel


[..]

--===============1497527258851193450==--

