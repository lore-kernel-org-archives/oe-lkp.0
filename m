Content-Type: multipart/mixed; boundary="===============4767135251761058764=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [kmod] d9c6a72d6f: kernel_selftests.kmod.kmod.sh.fail
Date: Thu, 14 Sep 2017 12:13:09 +0800
Message-ID: <20170914041309.GA16808@yexl-desktop>
In-Reply-To: <20170913185222.GO16216@wotan.suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4767135251761058764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/13, Luis R. Rodriguez wrote:
>On Wed, Sep 13, 2017 at 03:36:46PM +0800, kernel test robot wrote:
>> 2017-09-06 14:55:06 make run_tests -C kmod
>> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-d9c6a=
72d6fa29d3a7999dda726577e5d1fccafa5/tools/testing/selftests/kmod'
>> /bin/sh: 1: ./kmod.sh: Permission denied
>> selftests:  kmod.sh [FAIL]
>
>This was fixed by commit 0a9c40cea70d3f2dfa401bc259b318cd9aec8613 ("test_k=
mod:
>fix kmod.sh by making it executable").
>

Thanks for the info.

Xiaolong
>  Luis

--===============4767135251761058764==--

