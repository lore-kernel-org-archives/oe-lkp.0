Content-Type: multipart/mixed; boundary="===============2508690915154929106=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [mm/swap] d884021f52: will-it-scale.per_process_ops -2.4% regression
Date: Sun, 30 Sep 2018 10:17:04 +0200
Message-ID: <20180930081704.ncajd6rv23qnv237@linutronix.de>
In-Reply-To: <20180930031640.GG15893@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2508690915154929106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2018-09-30 11:16:41 [+0800], kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -2.4% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> =

> commit: d884021f52609407c7943705b3e54b1642fa10cb ("[PATCH 1/2] mm/swap: A=
dd pagevec locking")

-2.4% regression reads to me like an improvement of 2.4%. Which is odd
because I wouldn't expect a change in behaviour from 1/2. 2/2 yes, under
certain workloads but not from 1/2.

Sebastian

--===============2508690915154929106==--

