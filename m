Content-Type: multipart/mixed; boundary="===============3441113901273869493=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [libata/ahci] 8a4aeec8d2d: +138.4% perf-stat.dTLB-store-misses, +37.2% perf-stat.dTLB-load-misses
Date: Wed, 23 Apr 2014 16:21:06 +0800
Message-ID: <535777F2.1050501@intel.com>
In-Reply-To: <CAPcyv4jWnaF6tNfZqf13WnqZ0=U98X-5K-kMWnruQPoBYO21KQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3441113901273869493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/23/2014 01:11 AM, Dan Williams wrote:
> On Mon, Apr 21, 2014 at 12:29 AM, Jet Chen <jet.chen@intel.com> wrote:
>> HI Dan,
>>
>> we noticed the below changes on
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata for-next
>> commit 8a4aeec8d2d6a3edeffbdfae451cdf05cbf0fefd ("libata/ahci: accommoda=
te
>> tag ordered controllers")
> =

> Hi, was this on simulated hardware or a real AHCI controller and disk?
> =


Testing was on a physical machine with a real AHCI controller.

root(a)bay ~# lspci | grep AHCI
00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 po=
rt SATA Controller [AHCI mode] (rev 02)

> It does appear this test noticed increased throughput:
> =

>     203893 ~ 0%      +3.7%     211474 ~ 0%  TOTAL iostat.sda.wkB/s
> =

> I wonder if ap->last_tag can be moved to a hotter cacheline, but if
> throughput goes up I can imagine it throws off the cpu statistics
> quite a bit.
>=20

--===============3441113901273869493==--

