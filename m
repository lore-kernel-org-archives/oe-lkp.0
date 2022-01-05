Content-Type: multipart/mixed; boundary="===============7222285019864580797=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage - clang KCOV?
Date: Wed, 05 Jan 2022 20:47:28 +0800
Message-ID: <fa2f7d50-5226-726d-a9ad-2c42cb5c4054@intel.com>
In-Reply-To: <YdWCstlEW6k45+hH@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============7222285019864580797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 1/5/2022 7:36 PM, Borislav Petkov wrote:
> On Wed, Jan 05, 2022 at 10:35:20AM +0800, Yin Fengwei wrote:
>> Did you get update from clang folks for this behavior? Thanks.
> =

> No. Why?
My understanding:
it's better that clang restore its behavior to clang-12. Or people
need to use __no_profile annotation if want to add function before
GCOV/KASAN is initialized. Thanks.


Regards
Yin, Fengwei

>=20
--===============7222285019864580797==--

