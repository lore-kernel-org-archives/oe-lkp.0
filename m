Content-Type: multipart/mixed; boundary="===============2143855219925304090=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: 922c7b4064 ("locking/mutex: Test for initialized mutex"): WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:912 __mutex_lock
Date: Fri, 05 Jul 2019 09:18:01 +0200
Message-ID: <20190705071801.obda3ldhtbecshsm@linutronix.de>
In-Reply-To: <5d1e7ba1.hFB5d7WdpMDujmpR%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2143855219925304090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2019-07-05 06:20:17 [+0800], kernel test robot wrote:
> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://kernel.googlesource.com/pub/scm/linux/kernel/git/bigeasy/staging.=
git fpu
> =

> commit 922c7b406473a362269dae9d1a1a1c65e23368c7
> Author:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>

works perfectly, uncovered a bug which is fixed by
	https://git.kernel.org/tip/32232b350d7cd93cdc65fe5a453e6a40b539e9f9

Sebastian

--===============2143855219925304090==--

