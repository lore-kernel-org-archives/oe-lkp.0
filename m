Content-Type: multipart/mixed; boundary="===============0898685593131017430=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage - clang KCOV?
Date: Thu, 06 Jan 2022 14:56:51 +0800
Message-ID: <0736f5f9-b38f-27e9-58da-b71a596c498e@intel.com>
In-Reply-To: <YdW3a3dUfi5pBaiH@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0898685593131017430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On 1/5/22 11:21 PM, Borislav Petkov wrote:
> ... yap, and because fixing it this way is easy, I've already queued the
> __no_profile solution:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx=
86/mm&id=3Db64dfcde1ca9cb82e38e573753f0c0db8fb841c2
This fixing is good to me.

Just a little concern: if people need to add function in the future,
if he/she is not using clang-14, it's possible that he/she misses the
__no_profile and triggers this kind of issue again.

It may not be a big problem (we will capture it in our test. :)). Thanks.


Regards
Yin, Fengwei

> =

> Thanks.
--===============0898685593131017430==--

