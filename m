Content-Type: multipart/mixed; boundary="===============1355181912582071929=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 27 May 2021 12:01:23 -0700
Message-ID: <138f81df-08e1-f96e-1915-c58b44f96a41@linux.intel.com>
In-Reply-To: <20210527182959.GA437082@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============1355181912582071929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>      =

>      Nevertheless, it is quite possible that real-world use will result in
>      some situation requiring that high-stress workloads run on hardware
>      not designed to accommodate them, and also requiring that the kernel
>      refrain from marking clocksources unstable.
>      =

>      Therefore, provide an out-of-tree patch that reacts to this situation


out-of-tree means it will not be submitted?


I think it would make sense upstream, but perhaps guarded with some option.

--===============1355181912582071929==--

