Content-Type: multipart/mixed; boundary="===============4066167050867930206=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm/kaiser] a6c70b8b30: WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_off_caller
Date: Fri, 24 Nov 2017 15:02:33 +0100
Message-ID: <20171124140233.4vurnujcykobhccw@gmail.com>
In-Reply-To: <20171124131934.whmnawezbeggbqhm@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============4066167050867930206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <fengguang.wu@intel.com> wrote:

> =

> FYI, we noticed the following commit (built with gcc-6):
> =

> commit: a6c70b8b30bf35045d14e352bfd1eb16aaee906f ("x86/mm/kaiser: Prepare=
 assembly for entry/exit CR3 switching")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git WIP.x86/mm

Should be fixed in the latest version - please let me know if it isn't.

Thanks,

	Ingo

--===============4066167050867930206==--

