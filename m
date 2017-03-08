Content-Type: multipart/mixed; boundary="===============1108883796230932980=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [locking/ww_mutex] 857811a371: INFO:task_blocked_for_more_than#seconds
Date: Wed, 08 Mar 2017 12:13:12 +0000
Message-ID: <20170308121312.GL25284@nuc-i3427.alporthouse.com>
In-Reply-To: <20170308010854.GA17420@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1108883796230932980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 09:08:54AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 857811a37129f5d2ba162d7be3986eff44724014 ("locking/ww_mutex: Adju=
st the lock number for stress test")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -m 320M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Now the test is running, it takes too long. :)

wait_for_completion_interruptible() would stop the hung task check? That
leaves NMI watchdog to check if we hit a deadlock between the workers.

And add a timeout to the stress test.
-Chris

-- =

Chris Wilson, Intel Open Source Technology Centre

--===============1108883796230932980==--

