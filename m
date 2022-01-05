Content-Type: multipart/mixed; boundary="===============5564414716734029577=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage - clang KCOV?
Date: Wed, 05 Jan 2022 10:35:20 +0800
Message-ID: <a5cb8140-5834-7649-e629-f2775cf5b9a9@intel.com>
In-Reply-To: <YcHxKzB3WPurKlZ9@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============5564414716734029577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On 12/21/21 11:22 PM, Borislav Petkov wrote:
> And also, I'm still waiting on clang folks to chime in on the New Pass
> Manager and whether there's a bug in clang there so that we won't need
> the __no_profile annotation at all. I mean, gcc is fine with that config
> so unless clang is doing more profiling gunk than gcc and requires that
> __llvm_gcov_init constructor... see Nathan's mail upthread.

Did you get update from clang folks for this behavior? Thanks.


Regards
Yin, Fengwei
--===============5564414716734029577==--

