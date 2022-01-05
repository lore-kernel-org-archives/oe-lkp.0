Content-Type: multipart/mixed; boundary="===============3579764304045269858=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage - clang KCOV?
Date: Wed, 05 Jan 2022 16:21:15 +0100
Message-ID: <YdW3a3dUfi5pBaiH@zn.tnic>
In-Reply-To: <fa2f7d50-5226-726d-a9ad-2c42cb5c4054@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3579764304045269858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 08:47:28PM +0800, Yin Fengwei wrote:
> it's better that clang restore its behavior to clang-12.

Probably, but I'm not gonna hold my breath - folks are likely very
busy...

> Or people need to use __no_profile annotation if want to add function
> before GCOV/KASAN is initialized.

... yap, and because fixing it this way is easy, I've already queued the
__no_profile solution:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx86=
/mm&id=3Db64dfcde1ca9cb82e38e573753f0c0db8fb841c2

Thanks.

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============3579764304045269858==--

