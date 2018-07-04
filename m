Content-Type: multipart/mixed; boundary="===============7588336988358851894=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/entry/64/compat] 8bb2610bc4: kernel_selftests.x86.test_syscall_vdso_32.fail
Date: Wed, 04 Jul 2018 09:23:32 -0700
Message-ID: <CA+55aFwSD8T1dusD_Q14MhAxQcYG===ZTdS+CXuT-odj88xWkA@mail.gmail.com>
In-Reply-To: <20180704065414.GD23907@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7588336988358851894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 3, 2018 at 11:58 PM kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 8bb2610bc4967f19672444a7b0407367f1540028 ("x86/entry/64/compat: P=
reserve r8-r11 in int $0x80")
> [...]
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

So that commit is expected to fix things, but it also *enabled* the
selftests to warn about the change.

Did you run the new selftest on an old kernel?

It looks that way, because you talk about running the selftests for
commit 8bb2610bc496 (which is 4.17-rc2+), but the dmesg you include is
some ancient version"

    Linux version 4.12.0-10998-g6974f0c

Hmm. Some of those self-tests are very much expected to break on old kernel=
s.

                  Linus

--===============7588336988358851894==--

