Content-Type: multipart/mixed; boundary="===============7241115839379542276=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 7bb39313cd: netperf.Throughput_tps -4.5% regression
Date: Wed, 20 Jan 2021 13:48:15 +0800
Message-ID: <20210120054815.GA83476@shbuild999.sh.intel.com>
In-Reply-To: <20210119153350.GM27433@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============7241115839379542276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:33:50PM +0100, Borislav Petkov wrote:
> On Tue, Jan 19, 2021 at 11:09:03PM +0800, Feng Tang wrote:
> > Yes, that can happen. I started a 4 tasks netperf on a 4C/8T KBL deskto=
p,
> > and also saw around 2% improvement. Both the kernel config and the
> > platform matters.
> =

> Oh great. ;-\
> =

> > For the performance changes I have checked, sometimes the change can be
> > reproduced on platforms of different generations (the exact delta number
> > may differs), sometimes it can only be reproduced on one specific platf=
orm,
> > like some old generation, or special one like Xeon Phi.
> =

> Probably because that Xeon Phi thing is not as powerful cache-wise as
> some newer ones which have bigger caches and smarter hw prefetchers,
> etc.

Yes, cache size/architecture/policy plays a critical role in these
benchmarking, which is our first thing to check for these strange
kernel performance changes.

Thanks,
Feng
--===============7241115839379542276==--

