Content-Type: multipart/mixed; boundary="===============5989097616733547556=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: ww_mutex.sh hangs since v5.16-rc1
Date: Thu, 02 Dec 2021 23:57:12 +0100
Message-ID: <20211202225712.GG16608@worktop.programming.kicks-ass.net>
In-Reply-To: <895ef450-4fb3-5d29-a6ad-790657106a5a@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5989097616733547556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 09:26:18AM +0800, Li Zhijian wrote:
> Hi Folks
> =

> =

> LKP/0Day found that ww_mutex.sh cannot complete since v5.16-rc1, but
> I'm pretty sorry that we failed to bisect the FBC, instead, the bisection=
 pointed
> to a/below merge commit(91e1c99e17) finally.
> =

> Due to this hang, other tests in the same group are also blocked in 0Day,=
 we
> hope we can fix this hang ASAP.
> =

> So if you have any idea about this, or need more debug information, feel =
free to let me know :)
> =

> BTW, ww_mutex.sh was failed in v5.15 without hang, and looks it cannot re=
produce on a vm.

On real hardware:

root(a)ivb-ep:/usr/src/linux-2.6/tools/testing/selftests/locking# uname -a
Linux ivb-ep 5.16.0-rc3-00284-g68601c558556 #1 SMP PREEMPT Thu Dec 2 23:03:=
29 CET 2021 x86_64 GNU/Linux
root(a)ivb-ep:/usr/src/linux-2.6/tools/testing/selftests/locking# ./ww_mute=
x.sh
locking/ww_mutex: ok

[ 1907.907801] Beginning ww mutex selftests
[ 1915.700077] All ww mutex selftests passed


What else do I try?
--===============5989097616733547556==--

