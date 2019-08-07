Content-Type: multipart/mixed; boundary="===============4621051036698536142=="
MIME-Version: 1.0
From: Nikolay Borisov <nborisov@suse.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 06297d8cef: fio hangs
Date: Wed, 07 Aug 2019 08:51:19 +0300
Message-ID: <afd64160-8247-930b-1f38-1bf3c610b3a6@suse.com>
In-Reply-To: <73e5016e-6d2f-825e-ccd2-e749d96fa7a5@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4621051036698536142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 7.08.19 =D0=B3. 8:42 =D1=87., kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 06297d8cefcaa2029c4cb71b79285d2bfff06d4d ("btrfs: switch
> extent_buffer blocking_writers from atomic to int")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.g=
it
> master
> =

> in testcase: fio-basic
> =


This is a known problem but it has been resolved by with commit :
6e7ca09b583d ("btrfs: Fix deadlock caused by missing memory barrier")


--===============4621051036698536142==--

