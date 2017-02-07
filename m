Content-Type: multipart/mixed; boundary="===============0834964483940093054=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 24972782d0: BUG:unable_to_handle_kernel
Date: Tue, 07 Feb 2017 09:13:17 +0100
Message-ID: <20170207081317.GU6500@twins.programming.kicks-ass.net>
In-Reply-To: <20170207013046.GA2568@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0834964483940093054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 09:30:46AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 24972782d0379cd7e2f1d049f642863223c4416b ("fs: Remove iput_final(=
)")
> https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git locking/ref=
counts
> =


Ah right.. So that series is flaky but I obviously made a dumb mistake
in that patch (dereferencing @inode before testing its not NULL).

--===============0834964483940093054==--

