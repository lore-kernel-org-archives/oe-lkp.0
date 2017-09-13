Content-Type: multipart/mixed; boundary="===============7955083836727391663=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [kmod] d9c6a72d6f: kernel_selftests.kmod.kmod.sh.fail
Date: Wed, 13 Sep 2017 20:52:22 +0200
Message-ID: <20170913185222.GO16216@wotan.suse.de>
In-Reply-To: <20170913073646.GC22742@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7955083836727391663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2017 at 03:36:46PM +0800, kernel test robot wrote:
> 2017-09-06 14:55:06 make run_tests -C kmod
> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-d9c6a7=
2d6fa29d3a7999dda726577e5d1fccafa5/tools/testing/selftests/kmod'
> /bin/sh: 1: ./kmod.sh: Permission denied
> selftests:  kmod.sh [FAIL]

This was fixed by commit 0a9c40cea70d3f2dfa401bc259b318cd9aec8613 ("test_km=
od:
fix kmod.sh by making it executable").

  Luis

--===============7955083836727391663==--

