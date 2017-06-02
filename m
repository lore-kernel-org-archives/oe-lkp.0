Content-Type: multipart/mixed; boundary="===============0715631567995312500=="
MIME-Version: 1.0
From: Bart Van Assche <Bart.VanAssche@sandisk.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 105931d39f: BUG:unable_to_handle_kernel
Date: Fri, 02 Jun 2017 01:26:21 +0000
Message-ID: <1496366780.7614.1.camel@sandisk.com>
In-Reply-To: <20170602011451.GG16905@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0715631567995312500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-06-02 at 09:14 +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: 105931d39f6a37845e07f65f7e23b4bed9d1d8f8 ("Move most of scsi_init=
_command() into scsi_initialize_rq()")
> https://github.com/bvanassche/linux for-next
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> [    6.892331] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)

Hello,

This report applies to a patch series that I pushed a few days ago into the
for-next branch of my github repository. This patch is obsolete since I rew=
orked
the patch series it was part of and has not been posted on any mailing list=
 so
this report can be ignored.

Bart.
--===============0715631567995312500==--

