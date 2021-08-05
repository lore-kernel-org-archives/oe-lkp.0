Content-Type: multipart/mixed; boundary="===============7027858204023970374=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Wed, 04 Aug 2021 21:34:13 -0700
Message-ID: <a8d99be8-da3f-6c8e-cdbb-efd239ff3f14@linux.intel.com>
In-Reply-To: <20210805040349.GD4397@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============7027858204023970374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> My current thought is that if more than (say) 100 consecutive attempts
> to read the clocksource get hit with excessive delays, it is time to at
> least do a WARN_ON(), and maybe also time to disable the clocksource
> due to skew.  The reason is that if reading the clocksource -always-
> sees excessive delays, perhaps the clock driver or hardware is to blame.
>
> Thoughts?

On TDX this would be fatal because we don't have a usable fallback source

(just jiffies). Better try as hard as possible.


-Andi

>
> 		=09
--===============7027858204023970374==--

