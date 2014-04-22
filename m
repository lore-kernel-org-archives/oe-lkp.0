Content-Type: multipart/mixed; boundary="===============2320240705585013542=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [libata/ahci] 8a4aeec8d2d: +138.4% perf-stat.dTLB-store-misses, +37.2% perf-stat.dTLB-load-misses
Date: Tue, 22 Apr 2014 10:11:56 -0700
Message-ID: <CAPcyv4jWnaF6tNfZqf13WnqZ0=U98X-5K-kMWnruQPoBYO21KQ@mail.gmail.com>
In-Reply-To: <5354C8F3.3050504@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2320240705585013542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2014 at 12:29 AM, Jet Chen <jet.chen@intel.com> wrote:
> HI Dan,
>
> we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata for-next
> commit 8a4aeec8d2d6a3edeffbdfae451cdf05cbf0fefd ("libata/ahci: accommodate
> tag ordered controllers")

Hi, was this on simulated hardware or a real AHCI controller and disk?

It does appear this test noticed increased throughput:

    203893 ~ 0%      +3.7%     211474 ~ 0%  TOTAL iostat.sda.wkB/s

I wonder if ap->last_tag can be moved to a hotter cacheline, but if
throughput goes up I can imagine it throws off the cpu statistics
quite a bit.

--===============2320240705585013542==--

