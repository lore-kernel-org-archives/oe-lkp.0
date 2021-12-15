Content-Type: multipart/mixed; boundary="===============4035332918778594726=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: lkp@lists.01.org
Subject: Re: [loop] e3f9387aea: stress-ng.loop.ops_per_sec 78.9% improvement
Date: Thu, 16 Dec 2021 01:02:12 +0900
Message-ID: <8b080deb-adcc-4490-8e1d-5be789b1fcff@i-love.sakura.ne.jp>
In-Reply-To: <20211215135803.GA34913@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4035332918778594726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021/12/15 22:58, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a 78.9% improvement of stress-ng.loop.ops_per_sec due to =
commit:
> =

> =

> commit: e3f9387aea67742b9d1f4de8e5bb2fd08a8a4584 ("loop: Use pr_warn_once=
() for loop_control_remove() warning")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =


Avoiding printk() flooding will reduce latency, but I'm curious
why the testing program is trying ioctl(fd, LOOP_CTL_REMOVE, -1) ?
Since such ioctl() is pointless, measuring ops_per_sec is also pointless...
--===============4035332918778594726==--

