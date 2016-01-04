Content-Type: multipart/mixed; boundary="===============2197057725972067232=="
MIME-Version: 1.0
From: Rainer Weikusat <rweikusat@mobileactivedefense.com>
To: lkp@lists.01.org
Subject: Re: [af_unix] 039b21aaee: otc_kernel_qa-ts_ltp_ddt.bind01.fail
Date: Mon, 04 Jan 2016 13:06:09 +0000
Message-ID: <87mvslo5oe.fsf@doppelsaurus.mobileactivedefense.com>
In-Reply-To: <87poxim7uu.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2197057725972067232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <ying.huang@linux.intel.com> writes:
> FYI, we noticed the below changes on
>
> https://github.com/0day-ci/linux Rainer-Weikusat/af_unix-Fix-splice-bind-=
deadlock/20151228-041437
> commit 039b21aaee6515d0197e26321204f319b4ea6e9e ("af_unix: Fix splice-bin=
d deadlock")
>
> The commit failed for the bind01 test case of LTP syscalls test suite.

Judging from the bind01 test case code, about the only useful
information available in this message,

https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/sysc=
alls/bind/bind01.c

(and even that only indirectly), this ought the be error in the original
patch where -EEXIST from kern_path_create isn't translated to
-EADDRINUSE. This is fixed in the patch I sent yesterday, tested via
highly unsophisticated

perl -MSocket  <<'TT'
socket($sk, AF_UNIX, SOCK_DGRAM, 0);
bind($sk, sockaddr_un("."));
print "$!\n"
TT

--===============2197057725972067232==--

