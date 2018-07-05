Content-Type: multipart/mixed; boundary="===============7538013872453893098=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/entry/64/compat] 8bb2610bc4: kernel_selftests.x86.test_syscall_vdso_32.fail
Date: Thu, 05 Jul 2018 08:39:10 +0800
Message-ID: <20180705003910.GD10005@yexl-desktop>
In-Reply-To: <CA+55aFwSD8T1dusD_Q14MhAxQcYG===ZTdS+CXuT-odj88xWkA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7538013872453893098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/04, Linus Torvalds wrote:
>On Tue, Jul 3, 2018 at 11:58 PM kernel test robot <xiaolong.ye@intel.com=
> wrote:
>>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 8bb2610bc4967f19672444a7b0407367f1540028 ("x86/entry/64/compat: =
Preserve r8-r11 in int $0x80")
>> [...]
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>
>So that commit is expected to fix things, but it also *enabled* the
>selftests to warn about the change.
>
>Did you run the new selftest on an old kernel?
>
>It looks that way, because you talk about running the selftests for
>commit 8bb2610bc496 (which is 4.17-rc2+), but the dmesg you include is
>some ancient version"
>
>    Linux version 4.12.0-10998-g6974f0c

Just double checked the attached dmesg, the version seems correct, did you
check the right one?

[    0.000000] Linux version 4.17.0-rc2-00006-g8bb2610 (kbuild(a)cairo) (gc=
c version 7.3.0 (Debian 7.3.0-16)) #1 SMP Thu Jun 7 15:10:14 CST 2018      =



Thanks,
Xiaolong
>
>Hmm. Some of those self-tests are very much expected to break on old kerne=
ls.
>
>                  Linus

--===============7538013872453893098==--

