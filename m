Content-Type: multipart/mixed; boundary="===============4540376775913949760=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] e5a305ac4a: WARNING:at_lib/list_debug.c:#__list_del_entry_valid
Date: Wed, 18 Jan 2017 13:09:02 -0800
Message-ID: <20170118130902.90f3dcb2431b4b95f3044244@linux-foundation.org>
In-Reply-To: <20170118012304.GB14484@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4540376775913949760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Jan 2017 09:23:04 +0800 kernel test robot <xiaolong.ye@intel.c=
om> wrote:

> =

> FYI, we noticed the following commit:
> =

> commit: e5a305ac4a5233e039586c97f4ea643a4c7dc484 ("Reimplement IDR and ID=
A using the radix tree")
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -m 256M
> =

> ...
> =

> [    2.963488] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    2.964998] evbug: Connected device: input1 (AT Translated Set 2 keybo=
ard at isa0060/serio0/input0)
> [    2.966202] ------------[ cut here ]------------
> [    2.966844] WARNING: CPU: 0 PID: 14 at lib/list_debug.c:55 __list_del_=
entry_valid+0x43/0xb0
> [    2.968198] list_del corruption. next->prev should be bc904168, but wa=
s b215df80
> [    2.969171] CPU: 0 PID: 14 Comm: kworker/0:1 Not tainted 4.10.0-rc2-02=
114-ge5a305a #1
> [    2.970209] Workqueue: events_long serio_handle_event
> [    2.970893] Call Trace:
> [    2.971217]  dump_stack+0x16/0x19
> [    2.971677]  __warn+0xa5/0xc0
> [    2.972074]  warn_slowpath_fmt+0x28/0x30

Thanks.

That isn't a very good backtrace.  Is that really the entire output?

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email


--===============4540376775913949760==--

