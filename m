Content-Type: multipart/mixed; boundary="===============3694996286328577265=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/entry/vsyscall] 3dc33bd30f: Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Wed, 18 Nov 2015 08:17:13 -0800
Message-ID: <CALCETrW1wqZfr6Q5CwLkpD5K502bwwL+T3RnSmzmW+mRy4sBWw@mail.gmail.com>
In-Reply-To: <877flfu87x.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3694996286328577265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2015 at 10:34 PM, kernel test robot
<ying.huang@linux.intel.com> wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 3dc33bd30f3e1c1bcaaafa3482737694debf0f0b ("x86/entry/vsyscall: Add=
 CONFIG to control default")

This is intentional.  if you flip the default to disable vsyscalls,
then you need newer userspace code.

Can you either teach kbuild not to do that or rebuild your userspace
using an updated libc?

--Andy

--===============3694996286328577265==--

