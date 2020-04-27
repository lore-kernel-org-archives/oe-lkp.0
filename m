Content-Type: multipart/mixed; boundary="===============1358295577628073793=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [fs] ce436509a8: ltp.openat203.fail
Date: Mon, 27 Apr 2020 16:27:33 +0200
Message-ID: <20200427142733.GD7661@rei>
In-Reply-To: <20200427135210.GB5770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1358295577628073793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> commit: ce436509a8e109330c56bb4d8ec87d258788f5f4 ("[PATCH v4 2/3] fs: ope=
nat2: Extend open_how to allow userspace-selected fds")
> url: https://github.com/0day-ci/linux/commits/Josh-Triplett/Support-users=
pace-selected-fds/20200414-102939
> base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.=
git next

This commit adds fd parameter to the how structure where LTP test was
previously passing garbage, which obviously causes the difference in
errno.

This could be safely ignored for now, if the patch gets merged the test
needs to be updated.

-- =

chrubis(a)suse.cz
--===============1358295577628073793==--

