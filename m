Content-Type: multipart/mixed; boundary="===============1863451069795245828=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: 80f8d3dbca ("tcp: fix zerocopy and notsent_lowat issues"): WARNING: CPU: 0 PID: 709 at net/core/stream.c:205 sk_stream_kill_queues
Date: Tue, 26 Mar 2019 11:46:56 -0700
Message-ID: <CANn89i+dbipvHnDtcBKq+AoLYfARa_WojhCTBqhfQHur2kjBiw@mail.gmail.com>
In-Reply-To: <5c9a7180.PuAvSvcpqs4zVyfn%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1863451069795245828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 11:38 AM kernel test robot <lkp@intel.com> wrote:
>
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux/commits/Eric-Dumazet/tcp-fix-zerocopy-an=
d-notsent_lowat-issues/20190326-215818
>
> commit 80f8d3dbcab4d3e5020927d909a41a2410163301
> Author:     Eric Dumazet <edumazet@google.com>
> AuthorDate: Mon Mar 25 13:44:34 2019 -0700
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Tue Mar 26 21:58:19 2019 +0800
>

This has been fixed in v2 of this patch, thanks.

--===============1863451069795245828==--

