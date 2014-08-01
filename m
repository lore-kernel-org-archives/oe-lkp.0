Content-Type: multipart/mixed; boundary="===============0105852969735258822=="
MIME-Version: 1.0
From: Davidlohr Bueso <davidlohr@hp.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Fri, 01 Aug 2014 13:48:51 -0700
Message-ID: <1406926131.16021.7.camel@buesod1.americas.hpqcorp.net>
In-Reply-To: <1406926000.16021.6.camel@buesod1.americas.hpqcorp.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0105852969735258822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-08-01 at 13:46 -0700, Davidlohr Bueso wrote:
> So both these are pretty similar, however, when reverting, on avg we
> increase the amount of bops a mere ~4%:
> =

> tip/master + reverted:

Just to be clear, this is reverting a43455a1d57.


--===============0105852969735258822==--

