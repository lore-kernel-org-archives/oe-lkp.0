Content-Type: multipart/mixed; boundary="===============0963891512240555700=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [signal] d7ada75831: kernel-selftests.x86.single_step_syscall_64.fail
Date: Mon, 01 Nov 2021 17:46:19 -0500
Message-ID: <87mtmna404.fsf@disp2133>
In-Reply-To: <20211031133215.GE25131@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0963891512240555700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: d7ada758319742a3b15264520df6a991e01cc294 ("signal: Add SA_IMMUTAB=
LE to ensure forced siganls do not get changed")
> https://git.kernel.org/cgit/linux/kernel/git/ebiederm/user-namespace.git =
exit-cleanups-for-v5.16
>

Good catch.  I added a new sa_flag and a typo caused it to have an extra
trailing 0, so it had the wrong value.  The typo is now fixed and the
updated version is available as commit: ac4fdfaf4792d41ad7b24d1c8ab486aeb7c=
cd495

Eric

--===============0963891512240555700==--

