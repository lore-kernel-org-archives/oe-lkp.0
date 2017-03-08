Content-Type: multipart/mixed; boundary="===============8524249882474931364=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [locking/ww_mutex] 857811a371: INFO:task_blocked_for_more_than#seconds
Date: Wed, 08 Mar 2017 22:46:32 +0800
Message-ID: <20170308144632.ffeelkijmpqui3so@wfg-t540p.sh.intel.com>
In-Reply-To: <20170308121312.GL25284@nuc-i3427.alporthouse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8524249882474931364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 12:13:12PM +0000, Chris Wilson wrote:
>On Wed, Mar 08, 2017 at 09:08:54AM +0800, kernel test robot wrote:
>>
>> FYI, we noticed the following commit:
>>
>> commit: 857811a37129f5d2ba162d7be3986eff44724014 ("locking/ww_mutex: Adj=
ust the lock number for stress test")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-i386 -enable-kvm -m 320M
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>
>Now the test is running, it takes too long. :)

Sorry that's right. Up to now the 0day robot still cannot guarantee
the timely reporting of a runtime regression, nor can it guarantee
bisecting of a new regression even when some test actually triggered
the bug.

One fundamental challenge is, there are ~50,000 runtime "regressions"
queued for bisect. Obviously there is no way to bisect them all. So a
large portion of real regressions never get a chance to be bisected.
Not to mention the problem of bisect reliability and efficiency.

Most of the test "regressions" may be duplicates to each other (eg. a
bug in mainline kernel will also show up in various developer trees).
A great portion of them may also be random noises (eg. performance
fluctuations). We've tried various approaches to improve the
de-duplicate, filtering, prioritize etc. algorithms. Together with
increased test coverage, they have been reflected in our slowly
increasing report numbers. However there is still a long way to go.

Thanks,
Fengguang

--===============8524249882474931364==--

