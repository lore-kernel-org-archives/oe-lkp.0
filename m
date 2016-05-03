Content-Type: multipart/mixed; boundary="===============2915593894520842611=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: Extending the 0-day system with syzkaller?
Date: Tue, 03 May 2016 12:01:21 +0800
Message-ID: <20160503040121.GA10930@wfg-t540p.sh.intel.com>
In-Reply-To: <20160428014119.GB28943@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2915593894520842611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> One quick question is i recall an early discussion is that this enabling =
requires new gcc,
> is this still be true?

I see Debian just upgraded its gcc packages to 6.1, which makes it
more convenient for us to integrate with syzkaller.

Since syzkaller is more about a client-server system than a hands on
tool like trinity, it may need non-trivial modifications to 0-day and
possibly syzkaller to achieve the integration. For example, syzkaller
and 0-day each has its own way to run QEMU, which should be resolved
somehow.

Another question is, the 0-day model relies heavily on bisecting to
cover the large number of kernel trees. If a bug cannot be easily
reproduced and bisected, we don't know to whom it should be reported
to. Trinity offers an option "-sN: use N as random seed." to help
reproduce bugs it found. I wonder if syzkaller has similar mechanism
to help with reproducing bugs it found?

Thanks,
Fengguang

--===============2915593894520842611==--

