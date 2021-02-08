Content-Type: multipart/mixed; boundary="===============6698935695468993968=="
MIME-Version: 1.0
From: Michael S. Tsirkin <mst@redhat.com>
To: lkp@lists.01.org
Subject: Re: [vdpa_sim_net] 79991caf52: net/ipv4/ipmr.c:#RCU-list_traversed_in_non-reader_section
Date: Mon, 08 Feb 2021 04:57:20 -0500
Message-ID: <20210208045641-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210207030330.GB17282@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6698935695468993968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 07, 2021 at 11:03:30AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 79991caf5202c7989928be534727805f8f68bb8d ("vdpa_sim_net: Add supp=
ort for user supported devices")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git Dongli-Zh=
ang/vhost-scsi-alloc-vhost_scsi-with-kvzalloc-to-avoid-delay/20210129-191605
> =

> =

> in testcase: trinity
> version: trinity-static-x86_64-x86_64-f93256fb_2019-08-28
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =


Parav want to take a look?

-- =

MST

--===============6698935695468993968==--

