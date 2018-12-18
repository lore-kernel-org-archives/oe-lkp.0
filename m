Content-Type: multipart/mixed; boundary="===============7556010846649897922=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: 5404a7f1c2 [ 90.902541] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper:1]
Date: Tue, 18 Dec 2018 04:17:10 -0800
Message-ID: <20181218121710.GT10600@bombadil.infradead.org>
In-Reply-To: <20181218002028.GG23332@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7556010846649897922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2018 at 08:20:28AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 5404a7f1c21cfda061712bedf2d06cc0f6c755e9

I feel like you're wasting my time.  This is the fourth time in a row
you've reported something I can't reproduce.  At least this time the
instructions work, but I've tried it a dozen times and it doesn't produce
the error you're showing.

$ git branch
* (HEAD detached at 5404a7f1c21c)
...
[    0.000000] Linux version 4.20.0-rc1-00012-g5404a7f1c21c (willy(a)bobo) =
(gcc version 8.2.0 (Debian 8.2.0-9)) #4 Mon Dec 17 23:28:21 EST 2018
...
[    9.848471] test_uuid: all 18 tests passed
[   11.019267] XArray: 19496249 of 19496249 tests passed

Your logs show it failing every time.  I can't help but wonder if it's
something else in your setup that's causing it to fail -- maybe the
machines doing the testing are overloaded?

--===============7556010846649897922==--

