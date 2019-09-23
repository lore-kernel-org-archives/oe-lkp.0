Content-Type: multipart/mixed; boundary="===============0398848410203365985=="
MIME-Version: 1.0
From: Richard Palethorpe <rpalethorpe@suse.de>
To: lkp@lists.01.org
Subject: Re: [LTP] 12abeb544d: ltp.read_all_dev.fail
Date: Mon, 23 Sep 2019 10:11:40 +0200
Message-ID: <871rw7l9dv.fsf@rpws.prws.suse.cz>
In-Reply-To: <20190923003846.GB15734@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0398848410203365985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

kernel test robot <rong.a.chen@intel.com> writes:

> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 12abeb544d548f55f56323fc6e5e6c0fb74f58e1 ("horrible test hack")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/luto/linux.git r=
andom/kill-it
>
> in testcase: ltp
> with following parameters:
>
> 	disk: 1HDD
> 	fs: ext4
> 	test: fs-02
>
> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
> <<<test_start>>>
> tag=3Dread_all_dev stime=3D1569106866
> cmdline=3D"read_all -d /dev -p -q -r 10"
> contacts=3D""
> analysis=3Dexit
> <<<test_output>>>
> tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
> Test timeouted, sending SIGKILL!
> tst_test.c:1148: INFO: If you are running on slow machine, try exporting =
LTP_TIMEOUT_MUL > 1
> tst_test.c:1149: BROK: Test killed! (timeout?)

So perhaps this is caused by reads of /dev/random hanging? At any rate,
I suppose this is intended to deliberately break something, so we can
ignore it.

--
Thank you,
Richard.

--===============0398848410203365985==--

